import { Router, Response, Request } from "express";
//import GrupoController from "../controllers/GrupoController";

const GrupoRouter = Router();

GrupoRouter.get("/Grupo", function (Req: Request, res: Response){
    res.send("Requisição GET de grupos");
});
 
GrupoRouter.post("/grupo", function (Req: Request, res: Response){
    res.send("Requisição POST de grupos");
});

GrupoRouter.put("/grupo", function (Req: Request, res: Response){
    res.send("Requisição PUT de grupos");
});

GrupoRouter.delete("/grupo", function (Req: Request, res: Response){
    res.send("Requisição DELETE de grupos");
});

export default GrupoRouter;