import { Prisma } from "@prisma/client";
import { Request, Response } from 'express';
import AlunoService from "../service/AlunoService";

class AlunoController {
    constructor() {

    }

    async listAlunos(req: Request, res: Response) {

        // const alunos = await prisma.aluno.findMany();

        const alunos = await AlunoService.listAlunos() as Prisma.AlunoCreateInput[];

        const filteredAlunos = alunos.filter((aluno: Prisma.AlunoCreateInput) => aluno.idAluno != null)

        return res.status(200).json({
            status: 'ok',
            users: filteredAlunos
        })
    }

    async createAluno(req: Request, res: Response) {
        const dados: Prisma.AlunoCreateInput = req.body;
        //console.log(dados)
        if (dados) {
            console.log("aaaa");
            const newAluno = await AlunoService.createAluno(dados);
            console.log("bbbbb");
            res.status(200).json({
                status: '20',
                newAluno: newAluno
            });
            console.log(newAluno)
        } else {
            res.status(400).json({
                status: 'error',
                mensage: 'tem que colocar os dados'
            });
        }


        res.end('Incluir Usuarios');
    }

    async deleteAluno(req: Request, res: Response) {
        const { idAluno } = req.body;

        if (idAluno) {
            await AlunoService.deleteAluno(idAluno);
            res.status(200).json({
                status: 'ok',
                message: 'Aluno deletado com sucesso',
            });
        } else {
            res.status(400).json({
                status: 'error',
                message: 'É necessário fornecer o idAluno para deletar',
            });
        }
    }

    async updateAluno(req: Request, res: Response) {
        // serve para atualizar as informações
        res.send('Atualizar Usuarios');
    }
}

export default new AlunoController;
