const express = require("express");
const product = require("../modules/product");
const auth = require("../midlewar/auth");
const userroutes = express.Router();

userroutes.get("/user/get-products", auth, async (req, res) => {
  try {
    const category = req.query.category;
    const Product = await product.find({ category });
    res.json(Product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userroutes.get("/user/get-products/search/:name", auth, async (req, res) => {
  try {
    const name = req.params.name;
    const Product = await product.find({ name:{$regex:name,$options:'i'}});
    res.json(Product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = userroutes;
