# ╭─❍「 📂 TECHBROS-MD DOCKERFILE 」❍
# │ Base image
FROM node:18-buster

# │ Set working directory
WORKDIR /usr/src/app

# │ Copy package files and install dependencies
COPY package*.json ./
RUN npm install --production

# │ Copy bot source code
COPY . .

# │ Expose the port if needed (example: 3000)
EXPOSE 3000

# │ Start the bot
CMD ["node", "index.js"]
