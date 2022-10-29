class CategoriaDespesaModel {
  final String nomeCategoria;

  CategoriaDespesaModel({
    required this.nomeCategoria,
  });

  void printCategoria() {
    print('''
Categoria: $nomeCategoria
''');
  }
}
