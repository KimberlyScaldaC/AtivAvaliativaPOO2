import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export class EstandeService {
  public async getAllEstandes() {
    return prisma.estande.findMany();
  }

  public async getEstandeById(idEstande: string) {
    return prisma.estande.findUnique({
      where: { idEstande },
    });
  }

  public async createEstande(data: { numeroEstande: number; dataApresentacao: Date; horaApresentacao: Date; notaGrupoProfessores: number; notaGrupoAlunos: number }) {
    return prisma.estande.create({
      data: {
        numeroEstande: data.numeroEstande,
        dataApresentacao: data.dataApresentacao,
        horaApresentacao: data.horaApresentacao,
        notaGrupoProfessores: data.notaGrupoProfessores,
        notaGrupoAlunos: data.notaGrupoAlunos,
      },
    });
  }

  public async deleteEstande(idEstande: string) {
    await prisma.avaliacaoOnEstande.deleteMany({
      where: {
        estandeId: idEstande,
      },
    });

    const estande = await prisma.estande.delete({
      where: {
        idEstande,
      },
    });

    return estande;
  }

  public async updateEstande(idEstande: string, data: { numeroEstande?: number; dataApresentacao?: Date; horaApresentacao?: Date; notaGrupoProfessores?: number; notaGrupoAlunos?: number }) {
    return prisma.estande.update({
      where: { idEstande },
      data,
    });
  }

  // Se precisar de mais métodos específicos para estande, adicione-os aqui
}