import { Request, Response } from "express";
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

class UserController {
    constructor(){}

    async listUsers(req: Request, res: Response){
        const users = await prisma.user.findMany();
        res.json({
            users,
        });
    }
}

export default new UserController();