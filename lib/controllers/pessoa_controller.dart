class PessoaController {
  PessoaController();

  //verificar para alterar para static
  Future listAllPessoas(final connect) async{
    
    var res = await connect.select().from('teste_pessoa').exec();
    print(res);
  }

  Future insertPessoa(final connect, String nome, int idade) async {
    final ins = await connect.insert().into('teste_pessoa').set('nome', nome).set('idade', idade).exec();
    print(ins);
  }

  //exemplo de busca por codigo sql
  Future pesquisaPessoa(final connect) async {
    final res = await connect.raw('select nome from teste_pessoa').exec();
    print(res);
  }

  Future deletePessoaByNome(final connect, String nome) async {
    try{
    final del = await connect.delete().from('teste_pessoa').where('nome', nome).exec().then((result) => print('deletado: $result'));
    print(del);
    }catch(e){
      print(e);
    }
  }
}