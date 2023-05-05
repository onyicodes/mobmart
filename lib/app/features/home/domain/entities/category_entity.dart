import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable {
  const CategoryEntity({
    required this.icon,
    required this.label,
  });

  final String icon;
  final String label;

  @override
  List<Object?> get props => [
        icon,
        label,
      ];
}
