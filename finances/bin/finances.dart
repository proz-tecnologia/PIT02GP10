import "dart:io";
import 'package:finances/controller.dart';
import 'package:finances/categoria_controller.dart';



void main() {
  final Controller controller = Controller();
  String menu = "";

  do {
    print('''
Escolha uma das opções a seguir:
1) Cadastrar um novo ganho;
2) Buscar um ganho por ID;
3) Buscar um ganho por título;
4) Buscar um ganho por categoria;
5) Mostrar todas os ganhos; 
0) Sair;
''');

    menu = (stdin.readLineSync()!);

    switch (menu) {
      case '1':
        controller.adicionarGanho();
        break;

      case '2':
        controller.buscarGanhoId();
        break;

      case '3':
        controller.buscarGanhoTitulo();
        //Não retorna o titulo. Deve retornar todas as informações.
        break;

      case '4':
        //CategoriaController.opcoes();
        //Como relacionar as opções de categoria nesse menu principal?
        //Erro na opção de excluir.
        break;

      case '5':
        controller.registroDeGanhos();
        break;

      case '0':
        print('Obrigada, volte sempre!');
        break;

      default:
        print('Opção inválida!');
        break;
    }
  } while (menu != '0');
}
