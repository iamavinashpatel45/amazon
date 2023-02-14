const express = require("express");
const product = require("../modules/product");
const userroutes = express.Router();

userroutes.post("/user/get-products", async (req, res) => {
  try {
    const {category}=req.body;
    const Product=await product.find({category});
    res.json(Product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports=userroutes;
