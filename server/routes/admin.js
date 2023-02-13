const express = require("express");
const adminvalid = require("../midlewar/admin");
const product = require("../modules/product");
const adminroutes = express.Router();

adminroutes.post("/admin/add-product", adminvalid, async (req, res) => {
  try {
    const { name, description, quantity, images, category, price } = req.body;
    let Product = new product({
      name,
      description,
      quantity,
      images,
      category,
      price,
    });
    Product=await Product.save();
    res.json(Product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports=adminroutes;
