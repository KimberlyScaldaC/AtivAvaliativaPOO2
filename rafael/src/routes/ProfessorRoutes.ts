import { Router, Response, Request } from "express";

const ProfessorRouter = Router();

ProfessorRouter.get("/professor", function (Req: Request, res: Response){
    res.send("Requisição GET de professores");
});
 
ProfessorRouter.post("/professor", function (Req: Request, res: Response){
    res.send("Requisição POST de professores");
});

ProfessorRouter.put("/professor", function (Req: Request, res: Response){
    res.send("Requisição PUT de professores");
});

ProfessorRouter.delete("/professor", function (Req: Request, res: Response){
    res.send("Requisição DELETE de professores");
});

export default ProfessorRouter;