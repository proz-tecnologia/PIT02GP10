import 'package:uuid/uuid.dart';

class Ganho {
  final String _id = Uuid().v1();
  final String titulo;
  final double valor;
  final String criadoPor;

  Ganho({
    required this.titulo,
    required this.valor,
    required this.criadoPor,
  });

  String get id => _id;
}
