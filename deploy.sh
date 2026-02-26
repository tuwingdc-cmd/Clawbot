#!/bin/bash

echo "=============================="
echo " OpenClaw Bot Installer"
echo "=============================="

curl -fsSL https://openclaw.ai/install.sh | bash

mkdir -p ~/.openclaw

echo ""
echo "Pilih config yang ingin digunakan:"
echo "1) Gratis - Discord only (Cerebras, Groq, HuggingFace)"
echo "2) Gratis - Multi-Channel Discord+Telegram+WhatsApp"
echo "3) Premium - Discord only (Claude, GPT-5, Gemini, Grok)"
echo "4) Premium - Multi-Channel Discord+Telegram+WhatsApp"
read -p "Pilihan (1/2/3/4): " CHOICE

if [ "$CHOICE" = "1" ]; then
  cp openclaw.example.json ~/.openclaw/openclaw.json
elif [ "$CHOICE" = "2" ]; then
  cp openclaw.example.json ~/.openclaw/openclaw.json
  MULTI=true
elif [ "$CHOICE" = "3" ]; then
  cp openclaw2.example.json ~/.openclaw/openclaw.json
elif [ "$CHOICE" = "4" ]; then
  cp openclaw3.example.json ~/.openclaw/openclaw.json
  MULTI=true
fi

openclaw config set gateway.mode local

echo ""
echo "=============================="
echo " Isi Token Discord"
echo "=============================="
read -p "Discord Bot Token: " DISCORD_TOKEN
openclaw config set channels.discord.token "$DISCORD_TOKEN"

if [ "$MULTI" = "true" ]; then
  echo ""
  echo "=============================="
  echo " Isi Token Telegram"
  echo "=============================="
  read -p "Telegram Bot Token: " TELEGRAM_TOKEN
  openclaw config set channels.telegram.token "$TELEGRAM_TOKEN"
fi

echo ""
echo "=============================="
echo " Isi API Key Model (Enter kosong untuk skip)"
echo "=============================="

read -p "Anthropic API Key: " ANTHROPIC_KEY
if [ -n "$ANTHROPIC_KEY" ]; then
  echo "$ANTHROPIC_KEY" | openclaw models auth paste-token --provider anthropic
fi

read -p "OpenAI API Key: " OPENAI_KEY
if [ -n "$OPENAI_KEY" ]; then
  echo "$OPENAI_KEY" | openclaw models auth paste-token --provider openai
fi

read -p "Google API Key: " GOOGLE_KEY
if [ -n "$GOOGLE_KEY" ]; then
  echo "$GOOGLE_KEY" | openclaw models auth paste-token --provider google
fi

read -p "Groq API Key: " GROQ_KEY
if [ -n "$GROQ_KEY" ]; then
  echo "$GROQ_KEY" | openclaw models auth paste-token --provider groq
fi

read -p "Cerebras API Key: " CEREBRAS_KEY
if [ -n "$CEREBRAS_KEY" ]; then
  echo "$CEREBRAS_KEY" | openclaw models auth paste-token --provider cerebras
fi

read -p "HuggingFace API Key: " HF_KEY
if [ -n "$HF_KEY" ]; then
  echo "$HF_KEY" | openclaw models auth paste-token --provider huggingface
fi

read -p "xAI Grok API Key: " XAI_KEY
if [ -n "$XAI_KEY" ]; then
  echo "$XAI_KEY" | openclaw models auth paste-token --provider xai
fi

read -p "OpenRouter API Key: " OR_KEY
if [ -n "$OR_KEY" ]; then
  echo "$OR_KEY" | openclaw models auth paste-token --provider openrouter
fi

read -p "Tavily API Key: " TAVILY_KEY
if [ -n "$TAVILY_KEY" ]; then
  openclaw config set skills.entries.tavily.env.TAVILY_API_KEY "$TAVILY_KEY"
fi

echo ""
echo "=============================="
echo " Setup Selesai, Starting Bot..."
echo "=============================="
openclaw daemon restart

echo ""
echo "Bot sudah berjalan!"
echo "Cek log: openclaw logs --follow"
