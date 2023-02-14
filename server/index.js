const express = require("express");
const mongoos = require("mongoose");
const mong =
  "mongodb+srv://avipatel_45:avipatel45@cluster0.kmzsxzj.mongodb.net/?retryWrites=true&w=majority";

const port = 3000;
const app = express();

const auth = require("./routes/auth");
app.use(express.json());
app.use(auth);

const user = require("./routes/user");
app.use(express.json());
app.use(user);

const admin = require("./routes/admin");
app.use(express.json());
app.use(admin);

mongoos.set("strictQuery", false);
mongoos.connect(mong).then(() => {
  console.log("Connection Sucessfull");
});

app.get("/avi",(req,res)=>{
  res.json("Avinash");
})

app.listen(port, "0.0.0.0", () => {
  console.log("hi my name is patel avinash \nthank you");
});
