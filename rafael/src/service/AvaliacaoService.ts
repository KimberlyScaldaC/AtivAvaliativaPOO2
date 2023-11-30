import { Prisma, PrismaClient } from '@prisma/client';

const prisma = new PrismaClient();

class AvaliacaoService {
    constructor() {}

    async createAvaliacao(dados: Prisma.AvaliacaoCreateInput) {
        try {
            console.log("criar");
            const newAvaliacao = await prisma.avaliacao.create({ data: dados });
            //console.log(newAvaliacao)
            return newAvaliacao;
        } catch (error) {
            console.log(error);
        }
    }

    async updateAvaliacao(idAvaliacao: string, updateAvaliacao: Prisma.AvaliacaoUpdateInput) {
        try {
            const newAvaliacao = await prisma.avaliacao.update({
                where: {
                    idAvaliacao
                },
                data: updateAvaliacao
            });

            return newAvaliacao;
        } catch (error) {
            console.log(error);
        }
    }

    async listAvaliacoes(idAvaliacao?: string) {
        try {
            // se não existe esse id
            if (!idAvaliacao) {
                //return await prisma.user.findMany();
                //ou
                const avaliacoes = await prisma.avaliacao.findMany();
                return avaliacoes;
            } else {
                const avaliacao = await prisma.avaliacao.findUnique({
                    where: {
                        idAvaliacao
                    }
                });
                return avaliacao;
            }
        } catch (error) {
            console.log(error);
            return null;
        }
    }

    async deleteAvaliacao(idAvaliacao: string) {
        try {
            await prisma.avaliacao.delete({
                where: {
                    idAvaliacao
                }
            });
        } catch (error) {
            console.log(error);
        }
    }
}

export default new AvaliacaoService();
