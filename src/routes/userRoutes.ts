import { Router } from "express";
import {
  createUser,
  getUserById
} from "../controllers/userController";

const route = Router();
const bcrypt = require('bcrypt');

const jwt = require('jsonwebtoken');

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
  module.exports = route;
