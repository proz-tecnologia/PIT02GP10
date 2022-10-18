import 'package:uuid/uuid.dart';

class Ganho {
  final String _id = Uuid().v1();
  final String titulo;
  final double valor;

  Ganho({
    required this.titulo,
    required this.valor,
  });

  String get id => _id;
}
