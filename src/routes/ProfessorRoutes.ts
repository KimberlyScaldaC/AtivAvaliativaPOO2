import express from 'express';
import { ProfessorController } from '../controllers/ProfessorController';

const router = express.Router();
const professorController = new ProfessorController();

// Rota para buscar todos os professores
router.get('/professores', professorController.getAllProfessores);

// Rota para buscar um professor por ID
router.get('/professores/:id', professorController.getProfessorById);

// Rota para criar um novo professor
router.post('/professores', professorController.createProfessor);

// Rota para excluir um professor por ID
router.delete('/professores/:id', professorController.deleteProfessor);

// Rota para atualizar um professor por ID
router.put('/professores/:id', professorController.updateProfessor);


export default router;