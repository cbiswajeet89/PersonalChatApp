const express = require('express');
const http = require('http');
const { Server } = require('socket.io');

const app = express();
const server = http.createServer(app);
const io = new Server(server);

// Serve static files from the 'public' directory
app.use(express.static('public'));

// Handle WebSocket connections
io.on('connection', (socket) => {
    console.log('A user connected via device:', socket.id);

    // Listen for incoming messages
    socket.on('chat message', (msg) => {
        // Broadcast the message to EVERYONE connected
        io.emit('chat message', msg); 
    });

    socket.on('disconnect', () => {
        console.log('User disconnected');
    });
});

const PORT = 3000;

// '0.0.0.0' allows the server to accept connections from other devices on the LAN
server.listen(PORT, '0.0.0.0', () => {
    console.log(`Server is running!`);
    console.log(`- On this computer, go to: http://localhost:${PORT}`);
    console.log(`- On other devices, go to: http://<YOUR_LOCAL_IP_ADDRESS>:${PORT}`);
});