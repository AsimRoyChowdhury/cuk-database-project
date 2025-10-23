import { serve } from '@hono/node-server';
import { Hono } from 'hono';
import { cors } from 'hono/cors';

const app = new Hono();

// --- Middleware ---
// Add CORS middleware to allow requests from your Next.js frontend
app.use('/api/*', cors({
  origin: 'http://localhost:3000', // Your Next.js app URL
  allowHeaders: ['Content-Type', 'Authorization'],
  allowMethods: ['POST', 'GET', 'PUT', 'DELETE', 'OPTIONS'],
  credentials: true,
}));

// --- Routes ---
app.get('/api', (c) => {
  return c.json({ message: 'Hello from Hono Backend!' });
});

// TODO: Add your auth routes (login, logout)
// TODO: Add your stats routes (GET, POST, PUT, DELETE)

// --- Server ---
const port = 8000;
console.log(`Backend server running on http://localhost:${port}`);

serve({
  fetch: app.fetch,
  port,
});

