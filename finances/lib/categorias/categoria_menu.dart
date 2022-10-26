import 'dart:io';
import 'package:finances/categorias/categoria_controller.dart';
import 'categoria_modelo.dart';

class CategoriaMenu {
  final CategoriaController categoriaController;

  CategoriaMenu({
    required this.categoriaController,
  });

  void iniciarCategorias() {
    String menu = "";

    do {
      print('''
        ------ Menu------
        Escolha uma das opções a seguir:
        1) Adicionar categoria;
        2) Buscar uma categoria;
        3) Excluir categoria;
        4) Mostrar todas as categorias;
        0) Sair;
        ''');

      menu = (stdin.readLineSync()!);

      switch (menu) {
        case '1':
          print('Digite uma categoria para seus ganhos:');
          String nomeCategoria = stdin.readLineSync()!;
          final categoria = Categoria(nomeCategoria: nomeCategoria);
          categoriaController.adicionarCategoria(categoria);
          break;

        case '2':
          print('Digite a categoria que deseja:');
          String nomeCategoria = stdin.readLineSync()!;
          categoriaController.buscarCategoria(nomeCategoria);
          break;

        case '3':
          print('Digite a categoria que deseja excluir');
          String nomeCategoria = stdin.readLineSync()!;
          categoriaController.excluirCategoria(nomeCategoria);
          break;

        case '4':
          categoriaController.registroDeCategorias();
          break;

        case '0':
          print('saindo do Menu de Categorias');
          break;
      }
    } while (menu != '0');
  }
}
