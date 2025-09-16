# ╭─❍「 📂 TECHBROS-MD DOCKERFILE 」❍
FROM node:lts-buster

# Set working directory
WORKDIR /root/TECHBROS-MD

# Copy package files first (better cache)
COPY package*.json ./

# Install dependencies (prefer npm, fallback to yarn)
RUN npm install || yarn install --network-concurrency 1

# Copy all bot source code
COPY . .

# Install pm2 globally (optional for process management)
RUN npm install -g pm2

# Expose bot port (Render needs this, 3000 is standard)
EXPOSE 9090

# Start the bot
CMD ["node", "index.js"]
