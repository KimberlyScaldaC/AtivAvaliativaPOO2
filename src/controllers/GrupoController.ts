import { Request, Response } from 'express';
import { GrupoService } from '../service/GrupoService';

const grupoService = new GrupoService();

export class GrupoController {
  public async getAllGrupos(req: Request, res: Response) {
    try {
      const grupos = await grupoService.getAllGrupos();
      return res.json(grupos);
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao buscar grupos' });
    }
  }

  public async getGrupoById(req: Request, res: Response) {
    const { id } = req.params;
    try {
      const grupo = await grupoService.getGrupoById(id);
      if (grupo) {
        return res.json(grupo);
      } else {
        return res.status(404).json({ error: 'Grupo não encontrado' });
      }
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao buscar grupo' });
    }
  }

  public async createGrupo(req: Request, res: Response) {
    const grupoData = req.body;
    try {
      const grupo = await grupoService.createGrupo(grupoData);
      return res.json(grupo);
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao criar grupo' });
    }
  }

  public async deleteGrupo(req: Request, res: Response) {
    const { id } = req.params;
    try {
      const grupo = await grupoService.deleteGrupo(id);
      return res.json(grupo);
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao excluir grupo' });
    }
  }

  public async updateGrupo(req: Request, res: Response) {
    const { id } = req.params;
    const grupoData = req.body;
    try {
      const grupo = await grupoService.updateGrupo(id, grupoData);
      if (grupo) {
        return res.json(grupo);
      } else {
        return res.status(404).json({ error: 'Grupo não encontrado' });
      }
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao atualizar grupo' });
    }
  }
}