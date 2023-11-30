import { Router, Response, Request } from "express";
//import EstandeController from "../controllers/EstandeController";

const EstandeRouter = Router();

EstandeRouter.get("/Estande", function (Req: Request, res: Response){
    res.send("Requisição GET de estandes");
});
 
EstandeRouter.post("/estande", function (Req: Request, res: Response){
    res.send("Requisição POST de estandes");
});

EstandeRouter.put("/estande", function (Req: Request, res: Response){
    res.send("Requisição PUT de estandes");
});

EstandeRouter.delete("/estande", function (Req: Request, res: Response){
    res.send("Requisição DELETE de estandes");
});

export default EstandeRouter;