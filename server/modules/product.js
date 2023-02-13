const mongoos = require("mongoose");

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
});

const product = mongoos.model("product", productshema);
module.exports = product;
