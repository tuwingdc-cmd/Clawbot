#!/bin/bash

openclaw config set gateway.mode local

if [ -n "$DISCORD_TOKEN" ]; then
  openclaw config set channels.discord.token "$DISCORD_TOKEN"
else
  openclaw config set channels.discord.enabled false
fi

if [ -n "$TELEGRAM_TOKEN" ]; then
  openclaw config set channels.telegram.token "$TELEGRAM_TOKEN"
fi

if [ -n "$ANTHROPIC_KEY" ]; then
  echo "$ANTHROPIC_KEY" | openclaw models auth paste-token --provider anthropic
fi

if [ -n "$OPENAI_KEY" ]; then
  echo "$OPENAI_KEY" | openclaw models auth paste-token --provider openai
fi

if [ -n "$GOOGLE_KEY" ]; then
  echo "$GOOGLE_KEY" | openclaw models auth paste-token --provider google
fi

if [ -n "$GROQ_KEY" ]; then
  echo "$GROQ_KEY" | openclaw models auth paste-token --provider groq
fi

if [ -n "$CEREBRAS_KEY" ]; then
  echo "$CEREBRAS_KEY" | openclaw models auth paste-token --provider cerebras
fi

if [ -n "$HUGGINGFACE_KEY" ]; then
  echo "$HUGGINGFACE_KEY" | openclaw models auth paste-token --provider huggingface
fi

if [ -n "$XAI_KEY" ]; then
  echo "$XAI_KEY" | openclaw models auth paste-token --provider xai
fi

if [ -n "$OPENROUTER_KEY" ]; then
  echo "$OPENROUTER_KEY" | openclaw models auth paste-token --provider openrouter
fi

if [ -n "$TAVILY_API_KEY" ]; then
  openclaw config set skills.entries.tavily.env.TAVILY_API_KEY "$TAVILY_API_KEY"
fi

openclaw gateway run --port 8080 --bind auto
