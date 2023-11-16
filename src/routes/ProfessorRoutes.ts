import { Router } from "express";
import ProfessorController from "../controllers/ProfessorController";

const ProfessorRouter = Router();

//get pegar as coisas no servido
ProfessorRouter.get("/professores", ProfessorController.listProfessores);
 
ProfessorRouter.post("/professor", ProfessorController.createProfessor);

ProfessorRouter.put("/professor", ProfessorController.updateProfessor);

ProfessorRouter.delete("/professor", ProfessorController.deleteProfessor);

export default ProfessorRouter;