import { Prisma } from "@prisma/client";
import { Request, Response } from 'express';
import EstandeService from "../service/EstandeService";

class EstandeController {
    constructor() {

    }

    async listEstandes(req: Request, res: Response) {

        // const estandes = await prisma.estande.findMany();

        const estandes = await EstandeService.listEstandes() as Prisma.EstandeCreateInput[];

        const filteredEstandes = estandes.filter((estande: Prisma.EstandeCreateInput) => estande.idEstande != null)

        return res.status(200).json({
            status: 'ok',
            users: filteredEstandes
        })
    }

    async createEstande(req: Request, res: Response) {
        const dados: Prisma.EstandeCreateInput = req.body;
        //console.log(dados)
        if (dados) {
            console.log("aaaa");
            const newEstande = await EstandeService.createEstande(dados);
            console.log("bbbbb");
            res.status(200).json({
                status: '20',
                newEstande: newEstande
            });
            console.log(newEstande)
        } else {
            res.status(400).json({
                status: 'error',
                mensage: 'tem que colocar os dados'
            });
        }


        res.end('Incluir Estandes');
    }

    async deleteEstande(req: Request, res: Response) {
        const { idEstande } = req.body;

        if (idEstande) {
            await EstandeService.deleteEstande(idEstande);
            res.status(200).json({
                status: 'ok',
                message: 'Estande deletado com sucesso',
            });
        } else {
            res.status(400).json({
                status: 'error',
                message: 'É necessário fornecer o idEstande para deletar',
            });
        }
    }

    async updateEstande(req: Request, res: Response) {
        // serve para atualizar as informações
        res.send('Atualizar Estandes');
    }
}

export default new EstandeController;
