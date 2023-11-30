import { Router, Request, Response } from "express";
import UserController from "../controllers/UserController";

const UserRouter = Router();

UserRouter.get("/users", UserController.listUsers);

UserRouter.post("/user", function (req: Request, res: Response) {
    res.send("Requisição do POST usuario");
});

UserRouter.put("/user", function (req: Request, res: Response) {
    res.send("Requisição do PUT usuario");
});

UserRouter.delete("/user", function (req: Request, res: Response) {
    res.send("Requisição do DELETE usuario");
});


export default UserRouter;