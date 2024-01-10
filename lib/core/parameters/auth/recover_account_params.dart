import 'package:equatable/equatable.dart';

class RecoverAccountParams extends Equatable {
  final String email;

  const RecoverAccountParams({
    required this.email,
  });

  Map<String, String> toMap() =>
      {"email": email};

  @override
  List<Object?> get props => [];
}
