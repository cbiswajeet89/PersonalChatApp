# Use the official, lightweight Node.js image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# 1. Copy the package.json files from the ROOT folder
COPY package*.json ./

# 2. Install the dependencies (this will finally install Express & Socket.io)
RUN npm install

# 3. Copy your app code from inside the local-chat folder
COPY local-chat/ ./

# Expose port 3000
EXPOSE 3000

# Start the server
CMD ["node", "server.js"]
