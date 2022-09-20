const express = require("express");
const mongoose = require("mongoose");
const server = express();
const User = require("./models/User");
require("dotenv").config({ path: "variables.env" });

server.get("/", (req, res) => {
  const newUser = new User();
  newUser.email = "soo0864@gmail.com";
  newUser.name = "sooyoung";
  newUser.age = 25;
  newUser
    .save()
    .then((data) => {
        console.log(data);
        console.log(data);
        res.json({ 
        message: "Connected to database successfully" 
        });
  })
    .catch((err) => {
        res.json({
            message: "User war not Successfully created"
    });
  });
});

server.listen(3000, (err) => {
  if (err) {
    return console.log(err);
  } else {
    mongoose.connect(
        process.env.MONGDB_URL,
        { useNewUrlParser: true, useUnifiedTopology: true },
        (err) => {
            if (err) {
            console.log(err);
            } else {
            console.log("Connected to database successfully");
            }
        });
    }
});