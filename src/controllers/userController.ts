import { PrismaClient } from "@prisma/client";

export const createUser = async (userName: string,nic: string,userRole: number,password: string,token:string) => {
    
  const prisma = new PrismaClient();

  if (!userName || userName.split(" ").join("").length === 0) {
    return { status: 500, message: "username is invalid", user: null };
  }
  if (!nic || nic.split(" ").join("").length === 0) {
    return { status: 500, message: "nic is invalid", user: null };
  }
  if (!password || password.split(" ").join("").length === 0) {
    return { status: 500, message: "password is invalid", user: null };
  }
  if (!userRole) {
    userRole = 1;
  }
  if(!token){
    token = "";
  }

//   const checkUser = await getUserByUserName(userName);

//   if (checkUser) {
//     return { status: 403, message: "username already exists", user: null };
//   }

  const user = await prisma.users
    .create({
      data: {
        userName,
        nic,
        userRole,
        password,
        token
      },
    })
    .catch((e: any) => {
      throw e;
    })
    .finally(async () => {
      await prisma.$disconnect();
    });

  return {
    status: 200,
    message: "user created",
    user: {
      id: Number(user.id),
      userName: user.userName,
      nic: user.nic,
      userRole: user.userRole,
      password : user.password,
      token:user.token
    },
  };
};

export const getUserById = async (id: number) => {
  const prisma = new PrismaClient();

  const user = await prisma.users
    .findUnique({
      where: {
        id,
      },
    })
    .catch((e: any) => {
      throw e;
    })
    .finally(async () => {
      prisma.$disconnect();
    });

  if (user) {
    return {
      status: 200,
      message: "user found",
      user: {
        id: Number(user.id),
        userName: user.userName,
        nic: user.nic,
        userRole: user.userRole,
        cashInHand: user.cashInHand,
        password : user.password
      },
    };
  } else {
    return {
      status: 404,
      message: "user not found",
      user: null,
    };
  }
};

export const getUserByUserName = async (userName: string) => {
  const prisma = new PrismaClient();

  const user = await prisma.users
    .findFirst({
      where: {
        userName,
      },
    })
    .catch((e: any) => {
      throw e;
    })
    .finally(async () => {
      await prisma.$disconnect();
    });

  return user;
};
