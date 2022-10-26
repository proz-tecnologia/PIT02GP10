import 'package:finances/usuarios/usuarios_controller.dart';
import 'package:finances/usuarios/usuarios_menu.dart';

void main(List<String> arguments) {
  final usuarioController = UsuariosController();
  final usuarioMenu = UsuarioMenu(usuarioController: usuarioController);

  usuarioMenu.abrirMenu();
}
