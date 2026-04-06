const http = require('http');
const { spawn } = require('child_process');

const server = spawn('node', ['src/server.js'], {
  cwd: __dirname + '/..',
  stdio: 'ignore'
});

setTimeout(() => {
  http.get('http://127.0.0.1:3000/health', (res) => {
    if (res.statusCode === 200) {
      console.log('Health check passed');
      server.kill();
      process.exit(0);
    } else {
      console.error('Health check failed: status', res.statusCode);
      server.kill();
      process.exit(1);
    }
  }).on('error', (err) => {
    console.error('Health check error:', err.message);
    server.kill();
    process.exit(1);
  });
}, 1500);
