import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export class AvaliacaoService {
  public async getAllAvaliacoes() {
    return prisma.avaliacao.findMany();
  }

  public async getAvaliacaoById(idAvaliacao: string) {
    return prisma.avaliacao.findUnique({
      where: { idAvaliacao },
    });
  }

  public async createAvaliacao(data: { notaAluno: number; notaProfessor: number }) {
    return prisma.avaliacao.create({
      data: {
        notaAluno: data.notaAluno,
        notaProfessor: data.notaProfessor,
      },
    });
  }

  public async deleteAvaliacao(idAvaliacao: string) {
    await prisma.alunoOnAvaliacao.deleteMany({
      where: {
        avaliacaoId: idAvaliacao,
      },
    });

    await prisma.professorOnAvaliacao.deleteMany({
      where: {
        avaliacaoId: idAvaliacao,
      },
    });

    const avaliacao = await prisma.avaliacao.delete({
      where: {
        idAvaliacao,
      },
    });

    return avaliacao;
  }

  public async updateAvaliacao(idAvaliacao: string, data: { notaAluno?: number; notaProfessor?: number }) {
    return prisma.avaliacao.update({
      where: { idAvaliacao },
      data,
    });
  }

  // Se precisar de mais métodos específicos para avaliação, adicione-os aqui
}