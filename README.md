# Clawbot - OpenClaw Discord Bot

Bot AI untuk Discord, Telegram, dan WhatsApp menggunakan OpenClaw.

## Requirements

- Ubuntu VPS (20.04 / 22.04 / 24.04)
- Node.js v18+
- Git

## Install Node.js (jika belum ada)

curl -fsSL https://deb.nodesource.com/setup_22.x | bash
apt install -y nodejs

## Deploy

git clone https://github.com/tuwingdc-cmd/Clawbot.git
cd Clawbot
bash deploy.sh

## Pilihan Config

Saat deploy.sh berjalan, pilih salah satu:

1. Gratis - Cerebras, Groq, HuggingFace (tidak perlu kartu kredit)
2. Premium - Claude Opus 4.6, GPT-5, Gemini 3.1 Pro, Grok 4
3. Premium + Multi-Channel - Discord + Telegram + WhatsApp

## API Key yang Diperlukan

### Gratis
- Discord Bot Token - https://discord.com/developers
- Groq API Key - https://console.groq.com
- Cerebras API Key - https://cloud.cerebras.ai
- HuggingFace API Key - https://huggingface.co/settings/tokens
- Tavily API Key (opsional) - https://tavily.com

### Premium
- Anthropic API Key - https://console.anthropic.com
- OpenAI API Key - https://platform.openai.com
- Google API Key - https://aistudio.google.com
- xAI Grok API Key - https://console.x.ai
- OpenRouter API Key - https://openrouter.ai (1 key untuk semua model)

## Setup Discord Bot

1. Buka https://discord.com/developers/applications
2. New Application -> beri nama
3. Bot -> Add Bot -> Copy Token
4. OAuth2 -> URL Generator -> centang bot + applications.commands
5. Permissions: Send Messages, Read Messages, Use Slash Commands
6. Invite bot ke server menggunakan URL yang dihasilkan
7. Aktifkan Message Content Intent di halaman Bot

## Setup Telegram Bot

1. Buka Telegram -> cari @BotFather
2. Ketik /newbot
3. Ikuti instruksi -> copy token yang diberikan

## Perintah Bot di Discord

- @NamaBot [pertanyaan] - Chat dengan bot
- /new - Mulai sesi baru
- /weather - Cek cuaca
- /help - Lihat semua perintah

## Manajemen Bot

Cek status:
openclaw daemon status

Lihat log:
openclaw logs --follow

Restart:
openclaw daemon restart

Ganti model:
openclaw models set cerebras/gpt-oss-120b

Reset session:
rm ~/.openclaw/agents/main/sessions/sessions.json
openclaw daemon restart

## Troubleshooting

Bot tidak merespon:
- Pastikan Message Content Intent aktif di Discord Developer Portal
- Cek log: openclaw logs --follow
- Mention bot langsung: @NamaBot halo

Rate limit:
- Reset session dan ganti ke model lain
- openclaw models set groq/llama-3.3-70b-versatile

Bot stuck mengetik:
- openclaw daemon restart
