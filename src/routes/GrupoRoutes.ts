import express from 'express';
import { GrupoController } from '../controllers/GrupoController';

const router = express.Router();
const grupoController = new GrupoController();

// Rota para buscar todos os grupos
router.get('/grupos', grupoController.getAllGrupos);

// Rota para buscar um grupo por ID
router.get('/grupos/:id', grupoController.getGrupoById);

// Rota para criar um novo grupo
router.post('/grupos', grupoController.createGrupo);

// Rota para excluir um grupo por ID
router.delete('/grupos/:id', grupoController.deleteGrupo);

// Rota para atualizar um grupo por ID
router.put('/grupos/:id', grupoController.updateGrupo);

export default router;