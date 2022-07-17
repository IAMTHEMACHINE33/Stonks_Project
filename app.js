const express = require("express");
const app =express();

app.use(express.json());
require("./database/database");
const userRouter = require("./router/userRouter");
app.use(userRouter);

const blogRouter = require("./router/blogRouter");
app.use(blogRouter);

const stockRouter = require("./router/stockRouter");
app.use(stockRouter);
app.listen(90)