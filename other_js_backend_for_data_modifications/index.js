const express = require('express');
const cors = require('cors');
require('dotenv').config();

const authRouter = require('./routes/auth')
const savesRouter = require('./routes/saves');

const app = express();
app.use(express.json());
app.use(express.urlencoded({extended:true}));
app.use(cors());

app.use('/api/auth',authRouter);
app.use('/api/save',savesRouter);

app.listen(3000,()=>{console.log('Running')});