const express = require("express");
const router = new express.Router();
const bcryptjs = require("bcryptjs")
const jwt = require("jsonwebtoken");
const auth = require("../auth/auth")
const User = require("../model/userModel")
const multer = require("multer");
const upload = require("../fileupload/fileupload")


router.post("/user/insert",upload.single("user_img"),(req,res)=>{

    const email = req.body.email;
    User.findOne({email:email})

    .then((user_data)=>{
        if(user_data != null){
            res.json({msg:"Email already exists"});
            return;
        }

        const firstname = req.body.firstname;
        const lastname = req.body.lastname;

        const username = req.body.username;
        const age = req.body.age;

        const email = req.body.email;
        const password = req.body.password;
        const user_img = req.file.filename;

        bcryptjs.hash(password,10,(e, hased_pw)=>{
            const data = new User({
                firstname: firstname,
                lastname: lastname,
                username: username,
                password:hased_pw,
                age:age,
                email:email,
                user_img:user_img,
            })

        data.save()
        .then(()=>{
            res.json({success:true,msg:"Added"})
        })
        .catch((e)=>{res.json({e})})
        })
    })
    .catch()
})

router.post("/user/login",(req,res)=>{
    const email = req.body.email;
    const password = req.body.password;

    User.findOne({email:email})
    .then((user_data)=>{
        if(user_data == null){
            res
            .status(404)
            .json({success:false,error:"Invalid Credential"})
                return;
        }
        bcryptjs.compare(password,user_data.password,(e,result)=>{
            if(result == false){
                res
                .status(401)
                .json({success:false,error:"Invalid Credentials"})
                return;
            }

            const token = jwt.sign({userId:user_data._id},"done",{expiresIn:"1d"});

            res.json({success:true,token: token});
        })
    })
})

router.get("/user/dashboard",auth.userGuard,(req,res)=>{
    res.json({firstname:req.userInfo.firstname,lastname:req.userInfo.lastname,username:req.userInfo.username,email:req.userInfo.email,age:req.userInfo.age})
})
module.exports = router;