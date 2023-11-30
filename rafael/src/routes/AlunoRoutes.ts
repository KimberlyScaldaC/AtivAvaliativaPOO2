import { Router, Response, Request } from "express";
//import AlunoController from "../controllers/AlunoController";

const AlunoRouter = Router();

AlunoRouter.get("/Aluno", function (Req: Request, res: Response){
    res.send("Requisição GET de alunos");
});
 
AlunoRouter.post("/aluno", function (Req: Request, res: Response){
    res.send("Requisição POST de alunos");
});

AlunoRouter.put("/aluno", function (Req: Request, res: Response){
    res.send("Requisição PUT de alunos");
});

AlunoRouter.delete("/aluno", function (Req: Request, res: Response){
    res.send("Requisição DELETE de alunos");
});

export default AlunoRouter;