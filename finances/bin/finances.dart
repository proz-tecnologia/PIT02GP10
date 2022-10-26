import 'package:finances/despesa/despesa_menu.dart';
import 'package:finances/despesa/despesa_controller.dart';

void main(List<String> arguments) {
  final listaDespesas = ControllerDespesa();
  final despesaMenu = DespesaMenu(controllerDespesa: listaDespesas);

  despesaMenu.iniciarDespesas();
}
