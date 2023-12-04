//ok
import { Request, Response } from 'express';
import { AlunoService } from '../service/AlunoService';

const alunoService = new AlunoService();

export class AlunoController {
  public async getAllAlunos(req: Request, res: Response) {
    try {
      const alunos = await alunoService.getAllAlunos();
      return res.json(alunos);
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao buscar alunos' });
    }
  }

  public async getAlunoById(req: Request, res: Response) {
    const { id } = req.params;
    try {
      const aluno = await alunoService.getAlunoById(id);
      if (aluno) {
        return res.json(aluno);
      } else {
        return res.status(404).json({ error: 'Aluno não encontrado' });
      }
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao buscar aluno' });
    }
  }

  public async createAluno(req: Request, res: Response) {
    const alunoData = req.body;
    try {
      const aluno = await alunoService.createAluno(alunoData);
      return res.json(aluno);
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao criar aluno' });
    }
  }

  public async deleteAluno(req: Request, res: Response) {
    const { id } = req.params;
    try {
      const aluno = await alunoService.deleteAluno(id);
      return res.json(aluno);
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao excluir aluno' });
    }
  }

  public async updateAluno(req: Request, res: Response) {
    const { id } = req.params;
    const alunoData = req.body;
    try {
      const aluno = await alunoService.updateAluno(id, alunoData);
      if (aluno) {
        return res.json(aluno);
      } else {
        return res.status(404).json({ error: 'Aluno não encontrado' });
      }
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao atualizar aluno' });
    }
  }

  public async getAlunoByMatricula(req: Request, res: Response) {
    const { matricula } = req.params;
    try {
      const aluno = await alunoService.getAlunoByMatricula(matricula);
      if (aluno) {
        return res.json(aluno);
      } else {
        return res.status(404).json({ error: 'Aluno não encontrado' });
      }
    } catch (error) {
      return res.status(500).json({ error: 'Erro ao buscar aluno' });
    }
  }
}