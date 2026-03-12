//init project
require("dotenv").config();
var express = require("express");
var app = express();
//enable CORS, so the API is remotely testable by FCC
//Ethernet payload
var cors = require("cors");
app.use(cors({ optionsSuccessStatus: 200 })); // some legacy browsers choke on 204
//trust first proxy
app.set("trust proxy", true);

//avoid writing routes for all the files in the public directory. let express check the public directory for the files that are requested. if the file is found, it will be served. if not, it will move on to the next route.
app.use(express.static("public"));

app.get("/", function (req, res) {
  res.sendFile(__dirname + "/views/index.html");
  console.log(req.headers);
});

// your first API endpoint...
app.get("/api/hello", function (req, res) {
  res.json({ greeting: "hello API" });
});

app.get("/api/whoami", function (req, res) {
  res.json({
    ipaddress: req.ip,
    language: req.headers["accept-language"],
    software: req.headers["user-agent"],
  });
});

// listen for requests :)
var listener = app.listen(process.env.PORT || 3000, function () {
  console.log("Your app is listening on port " + listener.address().port);
});

//http://127.0.0.1:3000/api/hello
