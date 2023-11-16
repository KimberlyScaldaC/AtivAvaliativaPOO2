import { Prisma, PrismaClient } from '@prisma/client'

const prisma = new PrismaClient()



//metodos para acessa o usuario
class ProfessorService{

    constructor(){

    }

    async createProfessor(dados: Prisma.ProfessorCreateInput){
        try{

            const newuser = await prisma.professor.create({data: dados});
            return newuser;

        }catch(error){
            console.log(error);
        }

    }

    async updateProfessor(idProfessor: string, updateUser: Prisma.ProfessorUpdateInput){
        try{

            const newuser = await prisma.professor.update({
                where: {
                    idProfessor
                }, data: updateUser
                 
            })

            return newuser;

        }catch(error){
            console.log(error);
        }
    }

    async listProfessores(idProfessor?: string){
        try{
            // se nao axiste esse id
            if(!idProfessor){
                //return await prisma.user.findMany();
                //ou
                const professores = await prisma.professor.findMany();
                return professores;
            }else{
                const professor = await prisma.professor.findUnique({
                    where: {
                        idProfessor
                    }
                })
                return professor;
            }
        }catch(error){
            console.log(error);
            return null;
        }
        
    }

    async deleteProfessor(idProfessor: string){
        try{
            await prisma.professor.delete({
                where: {
                    idProfessor
                }
            })   
        }catch(error){
            console.log(error);
        }
    }
}

export default new ProfessorService();
//export default UserService;