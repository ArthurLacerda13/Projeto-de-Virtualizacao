tailwind.config = {
theme: {
    extend: {
    colors: {
        "minecraft-green": "#00FF00",
        "minecraft-dark": "#2D2D2D",
        "minecraft-brown": "#8B4513",
        "minecraft-stone": "#7F7F7F",
    },
    },
},
};

      // Copiar IP
      function copyIP() {
        const ip = document.getElementById("server-ip").textContent;
        navigator.clipboard.writeText(ip).then(() => {
          alert("IP copiado para a área de transferência!");
        });
      }

      // Buscar e atualizar dados
      async function updatePageData() {
        const lastUpdateElement = document.getElementById("last-update");
        try {
          const response = await fetch(
            "http://52.15.182.80:5000/api/server-data"
          );
          const data = await response.json();

          // Status
          const statusIndicator = document.getElementById("status-indicator");
          const statusText = document.getElementById("status-text");
          const playersOnline = document.getElementById("players-online");
          const maxPlayers = document.getElementById("max-players");
          const serverVersion = document.getElementById("server-version");

          if (data.status.online) {
            statusIndicator.className =
              "w-4 h-4 bg-minecraft-green rounded-full animate-pulse mr-2";
            statusText.textContent = "ONLINE";
            statusText.className = "text-xl font-semibold text-minecraft-green";
            playersOnline.textContent = data.status.players_online;
            maxPlayers.textContent = data.status.players_max;
            serverVersion.textContent = data.status.version;
          } else {
            statusIndicator.className = "w-4 h-4 bg-red-500 rounded-full mr-2";
            statusText.textContent = "OFFLINE";
            statusText.className = "text-xl font-semibold text-red-500";
            playersOnline.textContent = "0";
            maxPlayers.textContent = "--";
            serverVersion.textContent = "--";
          }

          // Top 10
          const tableBody = document.getElementById("players-table");
          tableBody.innerHTML = "";
          if (data.top10_players && data.top10_players.length > 0) {
            data.top10_players.forEach((player, index) => {
              const row = document.createElement("tr");
              row.className =
                "border-b border-minecraft-stone/30 hover:bg-minecraft-stone/20 transition-colors";

              const positionClass =
                index < 3 ? "text-yellow-400" : "text-white";
              const medal =
                index === 0
                  ? "🥇"
                  : index === 1
                  ? "🥈"
                  : index === 2
                  ? "🥉"
                  : "";

              const lastLoginClass =
                player.lastLogin === "Online"
                  ? "text-minecraft-green font-semibold"
                  : "text-gray-400";

              row.innerHTML = `
          <td class="py-3 px-4 ${positionClass} font-bold">${medal} ${
                index + 1
              }º</td>
          <td class="py-3 px-4">
              <div class="flex items-center space-x-2">
                  <div class="w-8 h-8 bg-minecraft-brown rounded flex items-center justify-center text-xs">👤</div>
                  <span class="font-semibold">${player.name}</span>
              </div>
          </td>
          <td class="py-3 px-4 font-mono text-minecraft-green">${
            player.time
          }</td>
          <td class="py-3 px-4 text-red-400 font-semibold">${player.deaths}</td>
          <td class="py-3 px-4 ${lastLoginClass}">${player.lastLogin}</td>
      `;
              tableBody.appendChild(row);
            });
          } else {
            tableBody.innerHTML =
              '<tr><td colspan="5" class="text-center py-4">Nenhum dado de jogador encontrado. Jogue um pouco para aparecer aqui!</td></tr>';
          }

          // Última atualização
          const now = new Date();
          lastUpdateElement.textContent = now.toLocaleString("pt-BR", {
            timeStyle: "short",
          });
        } catch (error) {
          console.error("Erro ao buscar dados do servidor:", error);
          document.getElementById("status-text").textContent =
            "API INDISPONÍVEL";
        }
      }

      // Inicialização
      document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("server-ip").textContent = "52.15.182.80:25565";
        updatePageData();
        setInterval(updatePageData, 30000);
      });