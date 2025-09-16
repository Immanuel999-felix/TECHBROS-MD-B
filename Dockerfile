# ╭─❍「 📂 TECHBROS-MD DOCKERFILE 」❍
FROM node:18-buster

WORKDIR /usr/src/app

# Install system dependencies (needed for sharp, canvas, etc.)
RUN apt-get update && apt-get install -y \
  python3 \
  build-essential \
  libcairo2-dev \
  libpango1.0-dev \
  libjpeg-dev \
  libgif-dev \
  librsvg2-dev \
  && rm -rf /var/lib/apt/lists/*

# Copy package files
COPY package*.json ./

# Install all dependencies
RUN npm install

# Copy bot source code
COPY . .

# Expose port (Render expects this)
EXPOSE 3000

# Start the bot
CMD ["node", "index.js"]
