import { PrismaClient } from '@prisma/client'
import express from 'express';
import path from 'path';
import ProfessorRouter from './routes/ProfessorRoutes';


const prisma = new PrismaClient()

const app = express();
app.use(express.json());
app.use(ProfessorRouter)

const port = 3001;


app.listen(port, function(){
    console.log('Serve working on port -> ' + port);
    console.log("Servidor funcionando normalmente...");
})


//toda a requisicao que receber na raiz vai responder
app.get("/", async function(req, res){ //get pegar as coisas no servido

    // const users = await UserService.listUsers();
    // return res.json(users);
    
    res.sendFile(path.join(__dirname) + '/src/views/index.html');


    return res.send("Tudo ok ...");

})

app.post("/", async function(req, res){ // inserir as informações
    res.send("Uma requisição POST");

    const professor = req.body;
    
    const newProfessor = await prisma.professor.create({
        data:professor
    })
    
    console.log(newProfessor);

    res.send("Usuario criado com sucesso");
})



app.put("/", function(req, res){ // serve para atualizar as informações
    res.send("Uma requisição PUT");
})

app.delete("/", function(req, res){ // serve para deletar  as informações
    res.send("Uma requisição DELETE");
})

//import MainRouter from './routes/MainRouter';
//import UserRouter from './routes/UserRoutes';

const app = express();
const port = 3000;

app.use(express.json());
app.set('view engine', 'ejs');
app.set('views', './src/views');

//app.use(UserRouter);
//app.use(MainRouter);

app.listen(port, function(){
    console.log(`Server running on port ${port}`);
})