import 'package:{{name.snakeCase()}}/presentation/components/delegate/selectable.dart';

abstract class Pageable implements Selectable {
  final String imagePath;
  final String? title;
  final String? description;
  final int? id;

  final String? url;

  Pageable({
    required this.imagePath,
    this.title,
    this.description,
    this.id,
    this.url,
  });
}
