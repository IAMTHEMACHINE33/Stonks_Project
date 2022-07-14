const express = require("express");
const router = new express.Router();
const Blog = require("../model/blogModel");
const auth = require("../auth/auth");
const upload = require("../fileupload/fileupload");

router.post("/blog/insert",auth.userGuard,upload.single("blog_img"),(req,res)=>{
    const title = req.body.title;
    const blog_body = req.body.blog_body;
    const blog_img = req.file.filename; 
    const userId = req.userInfo._id;

    const data = new Blog({
        title: title,
        blog_body:blog_body,
        blog_img:blog_img,
        userId : userId
    })
    data.save()
    .then(()=>{
        res.json({msg:"Post Added"})
    })
    .catch((e)=>{
        res.json({e})
    })
})



module.exports = router;