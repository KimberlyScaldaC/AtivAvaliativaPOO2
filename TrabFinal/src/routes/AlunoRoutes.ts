import express from 'express';
import { AlunoController } from '../controllers/AlunoController';

const router = express.Router();
const alunoController = new AlunoController();

// Rota para buscar todos os alunos
router.get('/alunos', alunoController.getAllAlunos);

// Rota para buscar um aluno por ID
router.get('/alunos/:id', alunoController.getAlunoById);

// Rota para criar um novo aluno
router.post('/alunos', alunoController.createAluno);

// Rota para excluir um aluno por ID
router.delete('/alunos/:id', alunoController.deleteAluno);

// Rota para atualizar um aluno por ID
router.put('/alunos/:id', alunoController.updateAluno);

// Rota para buscar um aluno por matricula
router.get('/alunos/matricula/:matricula', alunoController.getAlunoByMatricula);

export default router;