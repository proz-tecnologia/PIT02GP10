import 'categoria_despesa.dart';

class ListaCategoriasDespesa {
  final listaCategorias = <CategoriaDespesa>[];

  void adicionarCategoria(CategoriaDespesa categoria) {
    listaCategorias.add(categoria);
  }

  void mostrarCategorias() {
    print("Lista de Categorias cadastradas:");
    for (final categoriaDespesa in listaCategorias) {
      print(categoriaDespesa.toString());
    }
  }

  void excluirCategoria(String nomeCategoria) {
    for (var element in listaCategorias) {
      if (element.nomeCategoria == nomeCategoria) {
        final indice = listaCategorias
            .indexWhere((element) => element.nomeCategoria == nomeCategoria);
        listaCategorias.removeAt(indice);
        break;
      }
    }
  }
}
