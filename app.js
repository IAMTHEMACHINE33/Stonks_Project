const express = require("express");
const app =express();
const cors = require("cors");

app.use(express.json());
app.use(cors());

app.use(express.static(__dirname+"/images"));
require("./database/database");
const userRouter = require("./router/userRouter");
app.use(userRouter);

const blogRouter = require("./router/blogRouter");
app.use(blogRouter);

const stockRouter = require("./router/stockRouter");
app.use(stockRouter);
app.listen(90)