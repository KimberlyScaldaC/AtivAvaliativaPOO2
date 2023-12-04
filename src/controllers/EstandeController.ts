import { Request, Response } from 'express';
import { EstandeService } from '../service/EstandeService';

const estandeService = new EstandeService();

export class EstandeController {
  public async getAllEstandes(req: Request, res: Response) {
    try {
      const estandes = await estandeService.getAllEstandes();
      return res.json(estandes);
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao buscar estandes' });
    }
  }

  public async getEstandeById(req: Request, res: Response) {
    const { id } = req.params;
    try {
      const estande = await estandeService.getEstandeById(id);
      if (estande) {
        return res.json(estande);
      } else {
        return res.status(404).json({ error: 'Estande não encontrado' });
      }
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao buscar estande' });
    }
  }

  public async createEstande(req: Request, res: Response) {
    const estandeData = req.body;
    try {
      const estande = await estandeService.createEstande(estandeData);
      return res.json(estande);
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao criar estande' });
    }
  }

  public async deleteEstande(req: Request, res: Response) {
    const { id } = req.params;
    try {
      const estande = await estandeService.deleteEstande(id);
      return res.json(estande);
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao excluir estande' });
    }
  }

  public async updateEstande(req: Request, res: Response) {
    const { id } = req.params;
    const estandeData = req.body;
    try {
      const estande = await estandeService.updateEstande(id, estandeData);
      if (estande) {
        return res.json(estande);
      } else {
        return res.status(404).json({ error: 'Estande não encontrado' });
      }
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao atualizar estande' });
    }
  }
}