FROM node:22-slim

RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://openclaw.ai/install.sh | bash

WORKDIR /app
COPY openclaw.example.json /root/.openclaw/openclaw.json

ENV OPENCLAW_GATEWAY_PORT=18789

EXPOSE 18789

CMD ["openclaw", "gateway", "--port", "18789"]
