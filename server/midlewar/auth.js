const jws = require("jsonwebtoken");

const authvalid = async (req, res, next) => {
  try {
    const token = req.header("auth-token");
    if (!token) {
      return res
        .status(400)
        .json({ mes: "No Auth token,access denied!,try again" });
    }
    const isverify = jws.verify(token, "Avinash");
    if (!isverify) {
      return res
        .status(400)
        .json({ mes: "Token Verificationfaild.access denied!,try again" });
    }
    req.user=isverify.id;
    req.token=token;
    next();
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
};

module.exports=authvalid;
