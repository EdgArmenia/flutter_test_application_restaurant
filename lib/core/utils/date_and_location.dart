import 'package:equatable/equatable.dart';

class DateAndLocation extends Equatable {
  final String date;
  final String location;

  const DateAndLocation({required this.date, required this.location});

  @override
  List<Object?> get props => [date, location];
}
