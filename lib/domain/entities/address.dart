import 'package:uuid/uuid.dart';

class Address {
  final String id = Uuid().v4();
  final String title;
  final String description;
  final bool isDefault;

  Address({
    required this.title,
    required this.description,
    required this.isDefault,
  });
}
