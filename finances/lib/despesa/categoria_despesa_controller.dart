import 'categoria_despesa_model.dart';

class ControllerCategoriasDespesa {
  final listaCategorias = <CategoriaDespesaModel>[];

  void adicionarCategoria(String nomeCategoria) {
    final categoria = CategoriaDespesaModel(nomeCategoria: nomeCategoria);
    listaCategorias.add(categoria);
  }

  void mostrarCategorias() {
    print("Lista de Categorias cadastradas:");
    for (var categoriaDespesa in listaCategorias) {
      categoriaDespesa.printCategoria();
    }
  }

  /* void excluirCategoria(String nomeCategoria) {
    for (var element in listaCategorias) {
      if (element.nomeCategoria == nomeCategoria) {
        final indice = listaCategorias
            .indexWhere((element) => element.nomeCategoria == nomeCategoria);
        listaCategorias.removeAt(indice);
        break;
      }
    }
  }
  */
  void excluirCategoria(String nomeCategoria) {
    bool isfound = false;
    for (var categoria in listaCategorias) {
      if (categoria.nomeCategoria == nomeCategoria) {
        listaCategorias.remove(categoria);
        print("${categoria.nomeCategoria} removida.");
        isfound = true;
        break;
      }
    }
    if (!isfound) print("Categoria não encontrada.");
  }
}
