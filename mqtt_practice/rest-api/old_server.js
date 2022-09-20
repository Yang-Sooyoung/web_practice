const mongoose = require("mongoose");
require("dotenv").config({ path: "variables.env" });

const MONGDB_URL =
  "mongodb+srv://root:1234@education.nnrmect.mongodb.net/test?retryWrites=true&w=majority";
mongoose.connect(
  process.env.MONGDB_URL,
  { useNewUrlParser: true, useUnifiedTopology: true },
  (err) => {
    if (err) {
      console.log(err);
    } else {
      console.log("Connected to database successfully");
    }
  }
);
