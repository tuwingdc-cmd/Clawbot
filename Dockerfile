FROM node:22-slim

RUN apt-get update && apt-get install -y git curl bash && rm -rf /var/lib/apt/lists/*

RUN npm install -g openclaw

WORKDIR /app
COPY . .

RUN mkdir -p /root/.openclaw
COPY openclaw.example.json /root/.openclaw/openclaw.json

ENV OPENCLAW_GATEWAY_PORT=8080

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 18789

CMD ["/entrypoint.sh"]
