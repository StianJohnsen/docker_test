const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('Welcome to my awesome app!');
});

app.listen(3000, function () {
    console.log('Example app listening on port 3000!');
    });