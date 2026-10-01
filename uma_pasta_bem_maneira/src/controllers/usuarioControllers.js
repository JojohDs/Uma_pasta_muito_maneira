import { usuarioRepository } from "../repositories/usuarioRepository.js";

export const usuarioController = {
  async getByLogin(req,res){
    try{  
        const {email, senha} = req.body;
        if(!email){
            return res.status(400).json({
                error: 'E-mail vazio'
            })
        }if(!senha){
            return res.status(400).json({
                error: 'Senha vazia'
            })
        } const usuario = await usuarioRepository.getByLogin(req.body);
           if(!usuario){
            returnres.status(404).json ({
                error: 'usuário não encontrado ou dados incorretos'
            })
           } else {
            return res.status(200).json({
                id: usuario.id,
                nome: usuario.nome
            })
           }
 
    }catch (error){}

}
}