const e = require("express");
const express = require("express");
const app = express();
const port = 3000;

const fs = require("fs");

if (!fs.existsSync("scores.json")) {
  fs.writeFileSync("scores.json", "[]");
}

app.get("/trivia/:userId/:score/:category", (req, res) => {
  //console.log(req.params);
  res.send(req.params);
  saveScore(req.params.userId, req.params.score, req.params.category);
});

app.get("/trivia/leaderboard", (req, res) => {
  //todo: get leaderboard from db
  fs.readFile("scores.json", "utf-8", (err, data) => {
    if (err) {
      throw err;
    } else {
      userData = JSON.parse(data);
      res.send(userData);
    }
  });
});

const saveScore = (userId, score, category) => {
  let userData = [];
  fs.readFile("scores.json", "utf-8", (err, data) => {  
    if (err) throw err;
    else {
      userData = JSON.parse(data);
      userData.push({
        userName: userId,
        score: score,
        category: category,
      });

      console.log(typeof userData);
      const content = JSON.stringify(userData);
      console.log(typeof content);
      console.log(typeof JSON.parse(content));
      fs.writeFile("scores.json", content, "utf-8", (err) => {
        if (err) throw err;
      });
    }
  });
};

app.listen(port, () => console.log(`app listening on port ${port}!`));
