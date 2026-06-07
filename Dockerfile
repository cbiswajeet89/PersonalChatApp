# Use the official, lightweight Node.js image
FROM node:20-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy the package.json files from the local-chat folder first
COPY local-chat/package*.json ./

# Install the dependencies
RUN npm install

# Copy the rest of the local-chat folder contents into the container
COPY local-chat/ ./

# Expose port 3000
EXPOSE 3000

# Start the server (it will now correctly find server.js)
CMD ["node", "server.js"]