import {query} from '../config/db.js';

export const usuarioRepository = {
  async getByLogin(email,senha){
    const sql= "SELECT * FROM tb_usuario WHERE email = $1 AND SENHA = $2;"
    const res = await query(sql, [email, senha]);

    
  }
}