import 'package:equatable/equatable.dart';

class ProductDetailsParams extends Equatable {
  final int productId;

  const ProductDetailsParams(
      {required this.productId});

  @override
  List<Object?> get props => [];
}
