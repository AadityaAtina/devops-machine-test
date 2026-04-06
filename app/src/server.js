const express = require('express');
const app = express();
const port = process.env.PORT || 3000;

app.get('/health', (req, res) => {
  res.status(200).json({ status: 'ok', service: 'machine-test-api' });
});

app.get('/', (req, res) => {
  res.status(200).json({ message: 'Machine test API is running' });
});

app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});

module.exports = app;
