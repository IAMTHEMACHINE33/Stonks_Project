const mongoose = require("mongoose");

const blog = new mongoose.Schema({
    title:{
        type: String,
        required: true
    },
    blog_body:{
        type: String,
        required: true
    },
    blog_img:{
        type: String
    },
    userId:{
        type: mongoose.Schema.Types.ObjectId,
        ref:"User"
    },
    blog_date:{
        type: Date,
        default: Date.now
    }
});

module.exports = mongoose.model('Blog',blog);