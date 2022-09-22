import { Router } from "express";
import {
  createUser,
  getUserById,
  getUserByUserName
} from "../controllers/userController";

const route = Router();
const bcrypt = require('bcrypt');
// const bodyParser = require('body-parser');
const jwt = require('jsonwebtoken');

const passport = require('passport');
const passportJWT = require('passport-jwt');
let ExtractJwt = passportJWT.ExtractJwt;

const JwtStrategy = passportJWT.Strategy;
const jwtOptions = {jwtFromRequest: passportJWT.ExtractJwt.fromAuthHeaderAsBearerToken(),
  secretOrKey: process.env.TOKEN_KEY};

jwtOptions.jwtFromRequest = ExtractJwt.fromAuthHeaderAsBearerToken();
jwtOptions.secretOrKey = process.env.TOKEN_KEY;

const strategy = new JwtStrategy(jwtOptions, function(jwt_payload, done) {
  // console.log('payload received', jwt_payload);
  const user = getUserById( jwt_payload.id );
  if (user) {
    done(null, user);
  } else {
    done(null, false);
  }
});
route.post("/createUser", async (req, res, next) => {

const userName: string = req.body.userName;
const nic: string = req.body.nic;
const userRole: number = req.body.userRole;
// const password: string = req.body.password;
const user_pl = {name : userName}; 
const token = jwt.sign(user_pl,process.env.TOKEN_KEY);

const salt = await bcrypt.genSalt();
  
const password: string = await bcrypt.hash(req.body.password,salt);

const user = await createUser(userName, nic, userRole, password,token);
    return res.status(user.status).json({
      status: user.status,
      message: user.message,
      user: user.user,
    });
});


route.get("/getUser/:id", async (req, res, next) => {
    
    const id: string = req.params.id;

      const user = await getUserById(Number(id));
      return res.status(user.status).json({
        status: user.status,
        message: user.message,
        user: user.user,
      }); 

  });

route.post("/userLogin",async (req, res,next)=>{

  const { userName, password } = req.body;
  try{
    
    const user = await getUserByUserName(userName);
    if(!user){
     return res.status(401).json({ msg: 'No such user found', user});
    }
    const match = await bcrypt.compare(req.body.password, user.password);
    const accessToken = user.token;
    if(match){
        res.json({ accessToken: accessToken });
    } else {
        res.json({ message: "Invalid Credentials" });
    }
} catch(e) {
    console.log(e)
}
  if(userName && password){
    const user = await getUserByUserName(userName);
    if (!user) {
      return res.status(401).json({ msg: "No such user found", user });
    } 
    if (user.password === password) {

      const payload = { id: user.id };
      const token = jwt.sign(payload, process.env.TOKEN_KEY);
      res.json({ msg: 'Login Successful', token: token });
    } else {
      res.status(401).json({ msg: 'Password is incorrect' });
    }
  
  }})

  module.exports = route;
