import {Router} from 'express';
import {usuarioController} from "../controller/usuarioControllers.js";

const router = Router();

router.get('/usuario/login', usuarioController.getByLogin);

export default router;