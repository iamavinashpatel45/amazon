const express = require("express");
const product = require("../modules/product");
const auth = require("../midlewar/auth");
const ratingshema = require("../modules/rating");
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
    const Product = await product.find({
      name: { $regex: name, $options: "i" },
    });
    res.json(Product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

userroutes.post("/user/rate-product", auth, async (req, res) => {
  try {
    const { id, rating } = req.body;
    let Product = await product.findById(id);
    const length = Product.rating.length;
    const ratingshema = {
      userid: req.user,
      rating,
    };
    for (let i = 0; i < length; i++) {
      if (Product.rating[i].userid == req.user) {
        Product.rating[i] = ratingshema;
      }
      break;
    }
    Product = await Product.save();
    res.json(Product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = userroutes;
