import { Prisma } from "@prisma/client";
import { Request, Response } from 'express';
import GrupoService from "../service/GrupoService";

class GrupoController {
    constructor() {

    }

    async listGrupos(req: Request, res: Response) {

        // const grupos = await prisma.grupo.findMany();

        const grupos = await GrupoService.listGrupos() as Prisma.GrupoCreateInput[];

        const filteredGrupos = grupos.filter((grupo: Prisma.GrupoCreateInput) => grupo.idGrupo != null)

        return res.status(200).json({
            status: 'ok',
            users: filteredGrupos
        })
    }

    async createGrupo(req: Request, res: Response) {
        const dados: Prisma.GrupoCreateInput = req.body;
        //console.log(dados)
        if (dados) {
            console.log("aaaa");
            const newGrupo = await GrupoService.createGrupo(dados);
            console.log("bbbbb");
            res.status(200).json({
                status: '20',
                newGrupo: newGrupo
            });
            console.log(newGrupo)
        } else {
            res.status(400).json({
                status: 'error',
                mensage: 'tem que colocar os dados'
            });
        }


        res.end('Incluir Grupos');
    }

    async deleteGrupo(req: Request, res: Response) {
        const { idGrupo } = req.body;

        if (idGrupo) {
            await GrupoService.deleteGrupo(idGrupo);
            res.status(200).json({
                status: 'ok',
                message: 'Grupo deletado com sucesso',
            });
        } else {
            res.status(400).json({
                status: 'error',
                message: 'É necessário fornecer o idGrupo para deletar',
            });
        }
    }

    async updateGrupo(req: Request, res: Response) {
        // serve para atualizar as informações
        res.send('Atualizar Grupos');
    }
}

export default new GrupoController;
