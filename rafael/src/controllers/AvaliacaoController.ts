import { Prisma } from "@prisma/client";
import { Request, Response } from 'express';
import AvaliacaoService from "../service/AvaliacaoService";

class AvaliacaoController {
    constructor() {

    }

    async listAvaliacoes(req: Request, res: Response) {

        // const avaliacoes = await prisma.avaliacao.findMany();

        const avaliacoes = await AvaliacaoService.listAvaliacoes() as Prisma.AvaliacaoCreateInput[];

        const filteredAvaliacoes = avaliacoes.filter((avaliacao: Prisma.AvaliacaoCreateInput) => avaliacao.idAvaliacao != null)

        return res.status(200).json({
            status: 'ok',
            users: filteredAvaliacoes
        })
    }

    async createAvaliacao(req: Request, res: Response) {
        const dados: Prisma.AvaliacaoCreateInput = req.body;
        //console.log(dados)
        if (dados) {
            console.log("aaaa");
            const newAvaliacao = await AvaliacaoService.createAvaliacao(dados);
            console.log("bbbbb");
            res.status(200).json({
                status: '20',
                newAvaliacao: newAvaliacao
            });
            console.log(newAvaliacao)
        } else {
            res.status(400).json({
                status: 'error',
                mensage: 'tem que colocar os dados'
            });
        }


        res.end('Incluir Avaliacoes');
    }

    async deleteAvaliacao(req: Request, res: Response) {
        const { idAvaliacao } = req.body;

        if (idAvaliacao) {
            await AvaliacaoService.deleteAvaliacao(idAvaliacao);
            res.status(200).json({
                status: 'ok',
                message: 'Avaliacao deletada com sucesso',
            });
        } else {
            res.status(400).json({
                status: 'error',
                message: 'É necessário fornecer o idAvaliacao para deletar',
            });
        }
    }

    async updateAvaliacao(req: Request, res: Response) {
        // serve para atualizar as informações
        res.send('Atualizar Avaliacoes');
    }
}

export default new AvaliacaoController;