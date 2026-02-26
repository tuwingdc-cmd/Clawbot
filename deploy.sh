#!/bin/bash
curl -fsSL https://openclaw.ai/install.sh | bash
mkdir -p ~/.openclaw
cp openclaw.example.json ~/.openclaw/openclaw.json
openclaw config set gateway.mode local
openclaw models auth paste-token --provider groq
openclaw models auth paste-token --provider cerebras
openclaw models auth paste-token --provider huggingface
openclaw daemon restart
