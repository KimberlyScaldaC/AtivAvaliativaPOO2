import { Prisma, PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

class GrupoService {
    constructor() {}

    async createGrupo(dados: Prisma.GrupoCreateInput) {
        try {
            console.log("criar");
            const newGrupo = await prisma.grupo.create({ data: dados });
            // console.log(newGrupo);
            return newGrupo;
        } catch (error) {
            console.log(error);
        }
    }

    async updateGrupo(idGrupo: string, updateGrupo: Prisma.GrupoUpdateInput) {
        try {
            const newGrupo = await prisma.grupo.update({
                where: {
                    idGrupo
                },
                data: updateGrupo
            });

            return newGrupo;
        } catch (error) {
            console.log(error);
        }
    }

    async listGrupos(idGrupo?: string) {
        try {
            // se não existe esse id
            if (!idGrupo) {
                // return await prisma.user.findMany();
                // ou
                const grupos = await prisma.grupo.findMany();
                return grupos;
            } else {
                const grupo = await prisma.grupo.findUnique({
                    where: {
                        idGrupo
                    }
                });
                return grupo;
            }
        } catch (error) {
            console.log(error);
            return null;
        }
    }

    async deleteGrupo(idGrupo: string) {
        try {
            await prisma.grupo.delete({
                where: {
                    idGrupo
                }
            });
        } catch (error) {
            console.log(error);
        }
    }
}

export default new GrupoService();
