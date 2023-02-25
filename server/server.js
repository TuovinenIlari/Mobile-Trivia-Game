const express = require('express');
const app = express();
const port = 3000;

app.get('/trivia/:userId/:score/:category', (req, res) => {
    console.log(req.params);
    res.send(req.params);

    //todo: save score to db
});

app.get('/trivia/leaderboard', (req, res) => {

    //todo: get leaderboard from db
});

app.listen(port, () => console.log(`app listening on port ${port}!`));