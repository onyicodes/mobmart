import 'package:equatable/equatable.dart';

class CategoryEntity extends Equatable{
   const CategoryEntity({
        required this.name,
    });

    final String name;

     @override
  List<Object?> get props => [name];
}
