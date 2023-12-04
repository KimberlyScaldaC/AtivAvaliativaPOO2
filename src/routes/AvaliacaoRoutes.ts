import express from 'express';
import { AvaliacaoController } from '../controllers/AvaliacaoController';

const router = express.Router();
const avaliacaoController = new AvaliacaoController();

// Rota para buscar todas as avaliações
router.get('/avaliacoes', avaliacaoController.getAllAvaliacoes);

// Rota para buscar uma avaliação por id
router.get('/avaliacoes/:id', avaliacaoController.getAvaliacaoById);

// Rota para criar uma nova avaliação
router.post('/avaliacoes', avaliacaoController.createAvaliacao);

// Rota para excluir uma avaliação por ID
router.delete('/avaliacoes/:id', avaliacaoController.deleteAvaliacao);

// Rota para atualizar uma avaliação por ID
router.put('/avaliacoes/:id', avaliacaoController.updateAvaliacao);


export default router;