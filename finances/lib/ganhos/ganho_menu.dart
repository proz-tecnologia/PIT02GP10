import 'dart:io';

import 'package:finances/ganhos/ganho_controller.dart';

import 'ganho.dart';

class GanhoMenu {
  final ControllerGanho controllerGanho;

  GanhoMenu({
    required this.controllerGanho,
  });

  void iniciarGanhos() {
    String menu = "";

    do {
      print('''
 ------ Menu------
Escolha uma das opções a seguir:
1) Cadastrar um novo ganho;
2) Buscar um ganho por ID;
3) Buscar um ganho por título;
4) Mostrar todas os ganhos; 
0) Sair;
''');

      menu = (stdin.readLineSync()!);

      switch (menu) {
        case '1':
          print('Digite o título do ganho:');
          String titulo = stdin.readLineSync()!;
          print('Digite o valor do novo ganho:');
          String valor = stdin.readLineSync()!;
          final ganho = Ganho(
            titulo: titulo,
            valor: double.parse(valor),
            criadoPor: "",
          );
          controllerGanho.adicionarGanho(ganho);
          break;

        case '2':
          print('Digite o ID do ganho:');
          String id = stdin.readLineSync()!;
          controllerGanho.buscarGanhoId(id);
          break;

        case '3':
          print('Digite o Titulo do ganho:');
          String titulo = stdin.readLineSync()!;
          controllerGanho.buscarGanhoTitulo(titulo);
          break;

        case '4':
          controllerGanho.registroDeGanhos();
          break;

        case '0':
          print('saindo do Menu de Ganhos');
          break;
      }
    } while (menu != '0');
  }
}
