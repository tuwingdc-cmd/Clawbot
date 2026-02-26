FROM node:22-slim

RUN apt-get update && apt-get install -y git curl bash && rm -rf /var/lib/apt/lists/*

RUN curl -fsSL https://openclaw.ai/install.sh | bash

WORKDIR /app
COPY . .

RUN mkdir -p /root/.openclaw
COPY openclaw.example.json /root/.openclaw/openclaw.json

ENV OPENCLAW_GATEWAY_PORT=18789
ENV DISCORD_TOKEN=""
ENV ANTHROPIC_KEY=""
ENV OPENAI_KEY=""
ENV GOOGLE_KEY=""
ENV GROQ_KEY=""
ENV CEREBRAS_KEY=""
ENV HUGGINGFACE_KEY=""
ENV XAI_KEY=""
ENV OPENROUTER_KEY=""
ENV TAVILY_API_KEY=""

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 18789

CMD ["/entrypoint.sh"]
