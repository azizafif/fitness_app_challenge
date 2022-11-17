import 'package:equatable/equatable.dart';

class FilterOptionModel extends Equatable {
  String? title;
  FilterOptionModel({required this.title});

  @override
  List<Object> get props => [title!];
}
