const mongoos = require("mongoose");

const ratingshema = mongoos.Schema({
  userid: {
    required: true,
    type: String,
  },
  rating: {
    required: true,
    type: Number,
  },
});

module.exports=ratingshema;