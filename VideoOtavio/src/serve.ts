import  express  from "express";
import UserRouter from "./routes/UserRoutes";

const app = express();

app.use(express.json());
app.use(UserRouter);

const port = 3000;




app.listen(port, function(){
    console.log('Server running on port ${port}');
})

