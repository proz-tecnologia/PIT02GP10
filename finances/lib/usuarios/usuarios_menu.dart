import 'dart:io';

import 'package:finances/usuarios/usuarios_controller.dart';

class UsuarioMenu {
  final UsuariosController usuarioController;
  UsuarioMenu({
    required this.usuarioController,
  });

  void criarUsuario() {
    final nome = receberStringDoUsuario("Digite o nome");
    final email = receberStringDoUsuario("Digite o email");
    final senha = receberStringDoUsuario("Digite a senha");
    final telefone = receberStringDoUsuario("Digite o telefone");

    final resposta = usuarioController.criarUsuario(
      nome: nome,
      email: email,
      senha: senha,
      telefone: telefone,
    );

    if (resposta == null) {
      print("usuário já cadastrado com o e-mail fornecido, troque o e-mail.");
    } else {
      print("usuário cadastro com sucesso");
    }
  }

  void abrirMenu() {
    String opcao;

    do {
      mostrarMenu();

      opcao = receberStringDoUsuario("digite uma opção");

      switch (opcao) {
        case "1":
          criarUsuario();
          break;
        case "2":
          buscarPorId();
          break;
        case "3":
          buscarPorEmail();
          break;
        case "4":
          usuarioController.mostrarUsuarios();
          break;
        case "0":
          break;

        default:
          print("opção inválida");
          break;
      }
    } while (opcao != "0");
  }

  void buscarPorId() {
    final id = receberStringDoUsuario("Digite o id");

    final resposta = usuarioController.buscarUsuarioPorId(id);

    if (resposta == null) {
      print("usuário não encontrado");
    } else {
      print(resposta.toString());
    }
  }

  void buscarPorEmail() {
    final email = receberStringDoUsuario("Digite o email");

    final resposta = usuarioController.buscarUsuarioPorEmail(email);

    if (resposta == null) {
      print("usuário não encontrado");
    } else {
      print(resposta.toString());
    }
  }

  void mostrarMenu() {
    print("\tMenu Usuários");
    print("1. Criar usuário");
    print("2. Buscar usuário por ID");
    print("3. Buscar usuário por Email");
    print("4. Mostrar usuários");

    print("0. Sair");
  }

  String receberStringDoUsuario(String mensagem) {
    print(mensagem);
    final string = stdin.readLineSync()!;

    return string;
  }
}
