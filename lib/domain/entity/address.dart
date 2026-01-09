import 'package:uuid/uuid.dart';

class Address {
  final Uuid id = Uuid();
  final String title;
  final String description;
  final bool isDefault;

  Address({
    required this.title,
    required this.description,
    required this.isDefault,
  });
}
