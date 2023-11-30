import { Prisma, PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()

class AlunoService {
    constructor() {

    }

    async createAluno(dados: Prisma.AlunoCreateInput) {
        try {

            console.log("criar")
            const newAluno = await prisma.aluno.create({ data: dados });
            //console.log(newAluno)
            return newAluno;

        } catch (error) {
            console.log(error);
        }
    }

    async updateAluno(idAluno: string, updateAluno: Prisma.AlunoUpdateInput) {
        try {

            const newAluno = await prisma.aluno.update({
                where: {
                    idAluno
                }, data: updateAluno
            })

            return newAluno;

        } catch (error) {
            console.log(error);
        }
    }

    async listAlunos(idAluno?: string) {
        try {
            // se não existe esse id
            if (!idAluno) {
                //return await prisma.user.findMany();
                //ou
                const alunos = await prisma.aluno.findMany();
                return alunos;
            } else {
                const aluno = await prisma.aluno.findUnique({
                    where: {
                        idAluno
                    }
                })
                return aluno;
            }
        } catch (error) {
            console.log(error);
            return null;
        }

    }

    async deleteAluno(idAluno: string) {
        try {
            await prisma.aluno.delete({
                where: {
                    idAluno
                }
            })
        } catch (error) {
            console.log(error);
        }
    }
}

export default new AlunoService();
