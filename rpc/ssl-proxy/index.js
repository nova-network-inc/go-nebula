var httpProxy = require('http-proxy');
var fs = require('fs');

httpProxy.createServer({
  target: {
    host: 'localhost',
    port: 80
 },
 ssl: {
    key: fs.readFileSync(
    '/assets/ssl/default.key', 'utf8'),
    cert: fs.readFileSync(
    '/assets/ssl/default.crt', 'utf8')
 }
}).listen(443);
