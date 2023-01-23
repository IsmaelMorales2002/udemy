import { Router } from "express";
import { getUsuarios, getUsuario, postUsaurio, putUsaurio, deleteUsaurio } from '../controllers/usuarios';


const router = Router();


router.get('/',getUsuarios);
router.get('/:id',getUsuario);
router.post('/',postUsaurio);
router.put('/:id',putUsaurio);
router.delete('/:id',deleteUsaurio);



export default router;