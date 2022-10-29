import 'package:finances/usuarios/usuario_model.dart';

class UsuariosController {
  final List<UsuarioModel> usuarios = [];

  UsuarioModel? criarUsuario({
    required String nome,
    required String email,
    required String senha,
    required String telefone,
  }) {
    final resposta = buscarUsuarioPorEmail(email);

    if (resposta == null) {
      final novoUsuario = UsuarioModel(
        email: email,
        nome: nome,
        senha: senha,
        telefone: telefone,
      );

      usuarios.add(novoUsuario);
      return novoUsuario;
    }

    return null;
  }

  UsuarioModel? buscarUsuarioPorId(String id) {
    final resposta = usuarios.any((element) => element.id == id);

    if (!resposta) return null;

    final usuario = usuarios.firstWhere((element) => element.id == id);

    return usuario;
  }

  UsuarioModel? buscarUsuarioPorEmail(String email) {
    final resposta = usuarios.any((element) => element.email == email);

    if (!resposta) return null;

    final usuario = usuarios.firstWhere((element) => element.email == email);

    return usuario;
  }

  UsuarioModel? autenticarUsuario({
    required String email,
    required String senha,
  }) {
    final usuario = buscarUsuarioPorEmail(email);

    if (usuario != null && usuario.senha == senha) {
      return usuario;
    }
    return null;
  }

  void mostrarUsuarios() {
    for (final usuario in usuarios) {
      print(usuario.toString());
    }
  }
}


//  void deleteUser({required List<Map> listaUsuarios}) {
// if (listaUsuarios.isNotEmpty) {
// exibirLista(listaUsuarios);
// print('Digite o ID do usuário a ser excluído:');

// String removerUsuario = stdin.readLineSync()!;
// id = int.parse(removerUsuario);
 
//  else {
//  print(usuariosCadastrados [id]);
//  print('Remover usuário $user_Id? Digite [s] para confirmar, ou [n] para cancelar:');
 
//  final removerUsuario=
//  stdin.readLineSync()! =='s'? true:false;
//  if (removerUsuario) {
//  usuariosCadastrados.removeAt(usuario-1);
//  print('Usuario removido');
//  }
//  }
//  } 

//  void newUser({required List<Map> usersList}) {
// String id = getStringValueAndValidate ('ID');
// String name = getStringValueAndValidate ('Nome');
// String email = getStringValueAndValidate ('e-mail');
// String phoneNumber = getStringValueAndValidate ('telefone');

// final addUser = <String, dynamic>{
//     'ID': id;
//     'Nome': name;
//     'e-mail': email;
//     'telefone': phoneNumber;
// };
// }

// void userSettings ({requerid List<Map<String, dynamic>>userList}){
// if (userList.isNotEmpty){
//     showList (userList);
//     print ('Para editar um usuário, digite seu ID ou e-mail:');
//     String id = stdin.readLineSync()!;
// return;
// }
// showUser(userList[])


//   exibirCadastro(listaUsuarios[usuario - 1], usuario);
//   print('Digite o número do campo a ser editado:');
//   String adicionar = stdin.readLineSync()!;
//   if (adicionar.trim() == '0') {
//   return;
//   }
//   if (adicionar == '1') {listaUsuarios[usuario - 1]['ID'] = getStringValueAndValidate('ID');} 
//   else if (adicionar == '2') {listaUsuarios[usuario - 2]['email'] = getStringValueAndValidate('email');}
//   else if (adicionar == '3') {listaUsuarios[usuario - 3]['Nome'] = getStringValueAndValidate('Nome');}
//   else if (adicionar == '4') {listaUsuarios[usuario - 5]['Telefone'] = getStringValueAndValidate('Telefone');}
//   exibirCadastro(listaUsuarios);
// }