import { Router, Response, Request } from "express";
//import AvaliaçãoController from "../controllers/AvaliaçãoController";

const AvaliacaoRouter = Router();

AvaliacaoRouter.get("/Avaliação", function (Req: Request, res: Response){
    res.send("Requisição GET de avaliações");
});
 
AvaliacaoRouter.post("/avaliação", function (Req: Request, res: Response){
    res.send("Requisição POST de avaliações");
});

AvaliacaoRouter.put("/avaliação", function (Req: Request, res: Response){
    res.send("Requisição PUT de avaliações");
});

AvaliacaoRouter.delete("/avaliação", function (Req: Request, res: Response){
    res.send("Requisição DELETE de avaliações");
});

export default AvaliacaoRouter;