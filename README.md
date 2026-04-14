# 🚀 Monitoramento de Servidor Virtualizado - Minecraft

Este projeto foi desenvolvido como trabalho final da disciplina de **Sistemas Operacionais (IFPB)**. O objetivo foi gerenciar e monitorar um servidor de Minecraft rodando em uma instância **AWS EC2 (2GB RAM)**, expondo dados dos usuários e performance em uma página web.

## 🛠️ Tecnologias
- **Backend:** Python (Scripts de automação e extração)
- **Database:** PostgreSQL (Schema disponível em `schema_db.sql`)
- **Infra:** AWS EC2 (Ubuntu)
- **Frontend:** HTML/JS para visualização em tempo real

## 🧠 O Desafio Técnico
Rodar um servidor de Minecraft com mods em uma instância de apenas 2GB de RAM exige uma gestão rigorosa de processos. 
- Utilizei scripts em Python para ler logs/plugins e persistir no **PostgreSQL**.
- Implementação de uma API de status para evitar overhead no servidor principal.

## 📈 Foco Acadêmico
Este projeto serve como base de estudo para minha futura linha de pesquisa no **Mestrado**, focada em escalabilidade de sistemas e eficiência computacional.