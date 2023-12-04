import express from 'express';
import alunoRoutes from './routes/AlunoRoutes';
import professorRoutes from './routes/ProfessorRoutes';
import estandeRoutes from './routes/EstandeRoutes';
import avaliacaoRoutes from './routes/AvaliacaoRoutes';
import grupoRoutes from './routes/GrupoRoutes';

const app = express();

const port = 3000;

app.use(express.json());

app.use('/', alunoRoutes);
app.use('/', professorRoutes);
app.use('/', estandeRoutes);
app.use('/', avaliacaoRoutes);
app.use('/', grupoRoutes);

app.use(express.static('public'));

app.listen(port, () => {
  console.log(`Servidor está ouvindo na porta ${port}`);
});