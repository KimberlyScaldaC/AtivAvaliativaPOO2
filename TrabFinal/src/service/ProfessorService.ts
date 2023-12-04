//ok
import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export class ProfessorService {
  public async getAllProfessores() {
    return prisma.professor.findMany();
  }

  public async getProfessorById(idProfessor: string) {
    return prisma.professor.findUnique({
      where: { idProfessor },
    });
  }

  public async createProfessor(data: { nome: string; matricula: string; email: string }) {
    return prisma.professor.create({
      data: {
        nome: data.nome,
        matricula: data.matricula,
        email: data.email,
      },
    });
  }

  public async deleteProfessor(idProfessor: string) {
    await prisma.professorOnAvaliacao.deleteMany({
      where: {
        professorId: idProfessor,
      },
    });

    const professor = await prisma.professor.delete({
      where: {
        idProfessor,
      },
    });

    return professor;
  }

  public async updateProfessor(idProfessor: string, data: { nome?: string; matricula?: string; email?: string }) {
    return prisma.professor.update({
      where: { idProfessor },
      data,
    });
  }

  // Se precisar de mais métodos específicos para professor, adicione-os aqui
}