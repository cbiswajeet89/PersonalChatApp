# Use the official, lightweight Node.js image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json first
# (This is a Docker best practice to make building faster)
COPY package*.json ./

# Install the dependencies (Express and Socket.io)
RUN npm install

# Copy the rest of your app's code (server.js and the 'public' folder)
COPY . .

# Expose port 3000
EXPOSE 3000

# Start the server
CMD ["cd", "local-chat"]
CMD ["node", "server.js"]