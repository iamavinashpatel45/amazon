const express = require("express");
const bcryptjs = require("bcryptjs");
const jwt = require("jsonwebtoken");
const user = require("../modules/user");
const authvalid = require("../midlewar/auth");
const routes = express.Router();

routes.post("/api/signup", async (req, res) => {
  try {
    const { name, email, password } = req.body;
    const existingUser = await user.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }
    const bcryptpassword = await bcryptjs.hash(password, 8);
    let User = new user({
      name,
      email,
      password: bcryptpassword,
    });
    User = await User.save();
    res.json(User);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

routes.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const User = await user.findOne({ email });
    if (!user) {
      return res
        .status(400)
        .json({ mes: "User with this email does not exits!" });
    }
    const issame = await bcryptjs.compare(password, User.password);
    if (!issame) {
      return res.status(400).json({ mes: "Incorrect Password!" });
    }
    const token = jwt.sign({ id: User._id }, "Avinash");
    res.json({ token, ...User._doc });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

routes.post("/istokenvalid", async (req, res) => {
  try {
    const token = req.header("auth-token");
    if (token == null) {
      return res.json(false);
    }
    const isverify = jwt.verify(token, "Avinash");
    if (!isverify) {
      return res.json(false);
    }
    const User = await user.findById(isverify.id);
    if (!User) {
      return res.json(false);
    }
    res.json(true);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

routes.get("/", authvalid, async (req, res) => {
  const User = await user.findById(req.user);
  res.json({ ...User._doc, token: req.token });
});

module.exports = routes;
