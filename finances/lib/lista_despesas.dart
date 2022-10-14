import 'despesa.dart';

class ListaDespesas {
  final listaDespesas = <Despesa>[];

  void adicionarDespesa(Despesa despesa) {
    listaDespesas.add(despesa);
  }

  void mostrarDespesas() {
    print("Lista de despesas cadastradas:");
    for (var element in listaDespesas) {
      element.printDespesas();
    }
  }
}
