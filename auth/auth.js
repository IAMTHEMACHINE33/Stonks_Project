const jwt = require("jsonwebtoken");
const user = require("../model/userModel")


module.exports.userGuard=(req,res,next)=>{
    try{
        const token = req.headers.authorization.split(" ")[1];
        const data = jwt.verify(token, "done");

        user.findOne({_id:data.userId})
        .then((udata)=>{
            req.userInfo = udata;
            next();
        })
        .catch((e)=>{
            res.json({message:"invalid token"})
        })
    }
    catch(e){
        res.json({message:"invalid token"})
    }
}