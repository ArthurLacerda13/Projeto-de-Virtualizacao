from flask import Flask, jsonify
from flask_cors import CORS
from mcstatus import JavaServer
import mysql.connector
import time

app = Flask(__name__)
CORS(app)

# --- Configurações ---
MINECRAFT_SERVER_ADDRESS = "localhost:25565"
DB_CONFIG = {
    'host': 'localhost',
    'user': 'TemSaborDMeL',
    'password': 'Avo13hai@',
    'database': 'minecraft_db'
}

def format_playtime(milliseconds):
    if milliseconds is None: 
        return "0m"
    seconds = milliseconds // 1000
    days = seconds // 86400
    hours = (seconds % 86400) // 3600
    minutes = (seconds % 3600) // 60
    if days > 0: return f"{days}d {hours}h"
    elif hours > 0: return f"{hours}h {minutes}m"
    else: return f"{minutes}m"

def format_last_login(unix_milliseconds):
    if unix_milliseconds is None: 
        return "Nunca"
    seconds_ago = int(time.time()) - (unix_milliseconds // 1000)
    if seconds_ago < 60: return "Agora mesmo"
    if seconds_ago < 3600: return f"{seconds_ago // 60}m atrás"
    if seconds_ago < 86400: return f"{seconds_ago // 3600}h atrás"
    else: return f"{seconds_ago // 86400}d atrás"

@app.route('/api/server-data')
def get_server_data():
    server_data = {}
    online_players_list = []
    try:
        server = JavaServer.lookup(MINECRAFT_SERVER_ADDRESS)
        status = server.status()
        server_data['status'] = {
            "online": True,
            "players_online": status.players.online,
            "players_max": status.players.max,
            "version": status.version.name
        }
        if status.players.sample:
            online_players_list = [p.name for p in status.players.sample]
    except Exception:
        server_data['status'] = {"online": False}

    top_10_players = []
    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor(dictionary=True)

        # Query unindo sessões e usuários
        cursor.execute("""
            SELECT 
                u.name,
                SUM(s.session_end - s.session_start) AS total_playtime,
                SUM(s.deaths) AS total_deaths,
                MAX(s.session_end) AS last_login
            FROM plan_users u
            JOIN plan_sessions s ON u.id = s.user_id
            GROUP BY u.id, u.name
            ORDER BY total_playtime DESC
            LIMIT 10;
        """)

        for row in cursor.fetchall():
            is_online = row['name'] in online_players_list
            top_10_players.append({
                "name": row['name'],
                "time": format_playtime(row['total_playtime']),
                "deaths": row['total_deaths'],
                "lastLogin": "Online" if is_online else format_last_login(row['last_login'])
            })

        cursor.close()
        conn.close()
    except Exception as e:
        print(f"Erro no banco de dados: {e}")

    server_data['top10_players'] = top_10_players
    return jsonify(server_data)

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
