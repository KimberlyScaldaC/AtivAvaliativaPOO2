import { Prisma, PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

class EstandeService {
    constructor() {}

    async createEstande(dados: Prisma.EstandeCreateInput) {
        try {
            console.log("criar");
            const newEstande = await prisma.estande.create({ data: dados });
            // console.log(newEstande);
            return newEstande;
        } catch (error) {
            console.log(error);
        }
    }

    async updateEstande(idEstande: string, updateEstande: Prisma.EstandeUpdateInput) {
        try {
            const newEstande = await prisma.estande.update({
                where: {
                    idEstande
                },
                data: updateEstande
            });

            return newEstande;
        } catch (error) {
            console.log(error);
        }
    }

    async listEstandes(idEstande?: string) {
        try {
            // se não existe esse id
            if (!idEstande) {
                // return await prisma.user.findMany();
                // ou
                const estandes = await prisma.estande.findMany();
                return estandes;
            } else {
                const estande = await prisma.estande.findUnique({
                    where: {
                        idEstande
                    }
                });
                return estande;
            }
        } catch (error) {
            console.log(error);
            return null;
        }
    }

    async deleteEstande(idEstande: string) {
        try {
            await prisma.estande.delete({
                where: {
                    idEstande
                }
            });
        } catch (error) {
            console.log(error);
        }
    }
}

export default new EstandeService();
