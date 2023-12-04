import express from 'express';
import { EstandeController } from '../controllers/EstandeController';

const router = express.Router();
const estandeController = new EstandeController();

// Rota para buscar todos os estandes
router.get('/estandes', estandeController.getAllEstandes);

// Rota para buscar um estande por ID
router.get('/estandes/:id', estandeController.getEstandeById);

// Rota para criar um novo estande
router.post('/estandes', estandeController.createEstande);

// Rota para excluir um estande por ID
router.delete('/estandes/:id', estandeController.deleteEstande);

// Rota para atualizar um estande por ID
router.put('/estandes/:id', estandeController.updateEstande);

export default router;