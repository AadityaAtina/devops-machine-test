require('dotenv').config();
const express = require('express');
const mysql = require('mysql2');

const app = express();
app.use(express.json());

// ⚠️  BUG: connectionLimit is set to 2 (far too low).
// When scaled to 5+ pods, each pod creates its own pool of 2 connections.
// Under concurrent load, connection exhaustion causes requests to hang/fail.
// TODO: Fix this by setting an appropriate connectionLimit (e.g. 10)
// and ensuring DB max_connections is configured to handle all pods.
const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  connectionLimit: 2, // ⚠️ intentionally too low for multi-pod deployment
  waitForConnections: true,
  queueLimit: 0
});

const promisePool = pool.promise();

app.get('/health', (req, res) => {
  res.json({ status: 'ok', version: '1.0.0' });
});

app.get('/api/message', async (req, res) => {
  try {
    // Simulates a DB call that will exhaust connections under load at 5+ pods
    const [rows] = await promisePool.query('SELECT NOW() AS time');
    res.json({ message: 'API is running', db_time: rows[0].time });
  } catch (err) {
    console.error('DB error:', err.message);
    res.status(500).json({ error: 'Database error', detail: err.message });
  }
});

app.get('/api/users', async (req, res) => {
  try {
    const [rows] = await promisePool.query('SELECT id, name, email FROM users LIMIT 10');
    res.json(rows);
  } catch (err) {
    console.error('DB error:', err.message);
    res.status(500).json({ error: 'Failed to fetch users' });
  }
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Backend running on port ${PORT}`));

module.exports = app;
