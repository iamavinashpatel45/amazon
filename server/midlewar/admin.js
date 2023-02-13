const jws = require("jsonwebtoken");
const user = require("../modules/user");

const adminvalid = async (req, res, next) => {
  try {
    const token = req.header("auth-token");
    const isverify = jws.verify(token, "Avinash");
    const isadmin = await user.findById(isverify.id).user;
    if (isadmin == "user") {
      res.status(400).json({ message: "You are not an Admin!" });
    }
    req.user = isverify.id;
    req.token = token;
    next();
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports = adminvalid;
