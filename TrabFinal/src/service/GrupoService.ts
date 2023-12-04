import { PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

export class GrupoService {
  public async getAllGrupos() {
    return prisma.grupo.findMany();
  }

  public async getGrupoById(idGrupo: string) {
    return prisma.grupo.findUnique({
      where: { idGrupo },
    });
  }

  public async createGrupo(data: { nomeGrupo: string; matricula: string; estandeId: string; liderId: string}) {
    return prisma.grupo.create({
      data: {
        nomeGrupo: data.nomeGrupo,
        matricula: data.matricula,
        estandeId: data.estandeId,
        liderId: data.liderId,
      },
    });
  }

  public async deleteGrupo(idGrupo: string) {
    const grupo = await prisma.grupo.delete({
      where: {
        idGrupo,
      },
    });

    return grupo;
  }

  public async updateGrupo(idGrupo: string, data: { nomeGrupo?: string; matricula?: string; estandeId?: string }) {
    return prisma.grupo.update({
      where: { idGrupo },
      data,
    });
  }

  // Se precisar de mais métodos específicos para grupo, adicione-os aqui
}