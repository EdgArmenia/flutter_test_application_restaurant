import 'package:equatable/equatable.dart';

class DeleteItemParams extends Equatable {
  final int id;

  const DeleteItemParams({required this.id});

  @override
  List<Object?> get props => [id];
}
