import 'dart:io';

import 'package:finances/categorias/categoria_controller.dart';
import 'package:finances/categorias/categoria_menu.dart';
import 'package:finances/ganhos/ganho_controller.dart';
import 'package:finances/ganhos/ganho_menu.dart';
import 'package:finances/ganhos/ganho_controller.dart';

void main(List<String> arguments) {
  final categoriaController = CategoriaController();
  final categoriaMenu = CategoriaMenu(categoriaController: categoriaController);

  final controllerGanho = ControllerGanho();
  final ganhoMenu = GanhoMenu(controllerGanho: controllerGanho);

  String menu = "";
  print('''
Escolha qual Menu acessar:
1)Menu Categorias;
2)Menu Ganhos;
3)sair;
''');

  menu = (stdin.readLineSync()!);
  switch (menu) {
    case '1':
      categoriaMenu.iniciarCategorias();
      break;

    case '2':
      ganhoMenu.iniciarGanhos();
      break;
    case '3':
      print('sair');
      break;
  }
}
