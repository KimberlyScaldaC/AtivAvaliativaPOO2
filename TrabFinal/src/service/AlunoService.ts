//ok
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export class AlunoService {
  public async getAllAlunos() {
    return prisma.aluno.findMany();
  }

  public async getAlunoById(idAluno: string) {
    return prisma.aluno.findUnique({
      where: { idAluno },
    });
  }

  public async createAluno(data: { nome: string; matricula: string; email: string; grupoId: string }) {
    return prisma.aluno.create({
      data: {
        nome: data.nome,
        matricula: data.matricula,
        email: data.email,
        grupoId: data.grupoId,
      },
    });
  }

  public async deleteAluno(idAluno: string) {
    await prisma.alunoOnAvaliacao.deleteMany({
      where: {
        alunoId: idAluno,
      },
    });

    const aluno = await prisma.aluno.delete({
      where: {
        idAluno,
      },
    });

    return aluno;
  }

  public async updateAluno(idAluno: string, data: { nome?: string; matricula?: string; email?: string; grupoId?: string }) {
    return prisma.aluno.update({
      where: { idAluno },
      data,
    });
  }

  public async getAlunoByMatricula(matricula: string) {
    return prisma.aluno.findUnique({
      where: { matricula },
    });
  }
}