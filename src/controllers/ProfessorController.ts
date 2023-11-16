import { Prisma } from "@prisma/client";
import {Request, Response} from 'express';
import ProfessorService from "../service/ProfessorService";

class ProfessorController{
    constructor(){

    }

    async listProfessores(req: Request, res: Response){
        
       // const professores = await prisma.professor.findMany();

        const professores = await ProfessorService.listProfessores() as Prisma.ProfessorCreateInput[];

        const filteredProfessores = professores.filter((professor: Prisma.ProfessorCreateInput) => professor.idProfessor != null)

        return res.status(200).json({
            status: 'ok',
            users: filteredProfessores
        })
    }  
    
    async createProfessor(req: Request, res: Response){
        const dados: Prisma.ProfessorCreateInput = req.body;
        console.log(dados)
        if(dados.email){
            const newuser = ProfessorService.createProfessor(dados);
            res.status(200).json({
                status: '20',
                newuser: newuser
            });
        }else{
            res.status(400).json({
                status: 'error',
                mensage: 'tem que colocar os dados'
            });
        }
        
    
        res.end('Incluir Usuarios');
    }

    async deleteProfessor(req: Request, res: Response){
        // serve para deletar  as informações
        res.send('Deleta Usuario');
    }

    async updateProfessor(req: Request, res: Response){
        // serve para atualizar as informações
        res.send('Atualizar Usuarios');
    }
}

export default new ProfessorController;