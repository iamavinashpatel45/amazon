const mongoos = require("mongoose");
const ratingshema = require("../modules/rating");

const productshema = mongoos.Schema({
  name: {
    required: true,
    type: String,
    trim: true,
  },
  description: {
    required: true,
    type: String,
  },
  quantity: {
    required: true,
    type: Number,
  },
  price: {
    required: true,
    type: Number,
  },
  images: [
    {
      type: String,
      required: true,
    },
  ],
  category: {
    required: true,
    type: String,
  },
  rating: [ratingshema],
});

const product = mongoos.model("product", productshema);
module.exports = product;
