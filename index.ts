import express from "express";

// const bodyParser = require('body-parser');
// const jwt = require('jsonwebtoken');
// // import passport and passport-jwt modules
// const passport = require('passport');
// const passportJWT = require('passport-jwt');
// // ExtractJwt to help extract the token
// let ExtractJwt = passportJWT.ExtractJwt;
// // JwtStrategy which is the strategy for the authentication
// let JwtStrategy = passportJWT.Strategy;
// let jwtOptions = {};
// jwtOptions.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
// jwtOptions.secretOrKey = 'wowwow';


const cors = require("cors");
const app = express();
const port = 3005;

const userRoutes = require("./src/routes/userRoutes");

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

app.use("/api/user", userRoutes);
app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
  });