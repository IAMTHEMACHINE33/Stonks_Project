const mongoose =require("mongoose");

const user = new mongoose.Schema({
    firstname:{
        type: String,
        required: true
    },
    lastname:{
        type: String,
        required: true
    },
    username:{
        type: String,
        required: true
    },
    age:{
        type: Number,
    },
    password:{
        type: String,
        required: true
    },
    email:{
        type: String,
        required: true
    },
    user_img:{
        type: String,
    }
});

module.exports=mongoose.model('User',user);