// app.js
const express = require('express');
const app = express();
const port = 3000;

app.use(express.static('public'));

app.listen(port, () => {
    console.log(`Candy store app listening at http://localhost:${3000}`);
});
