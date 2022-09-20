import 'package:finances/models/object_id.dart';

class TransactionModel extends ObjectId {
  final TransactionType type;
  final double value;
  final DateTime referenceDate;

  TransactionModel({
    required super.id,
    required this.type,
    required this.value,
    required this.referenceDate,
    required super.createdAt,
  });
}

enum TransactionType {
  withdraw,
  deposit,
}
