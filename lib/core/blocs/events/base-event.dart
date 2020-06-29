import 'package:equatable/equatable.dart';

class BaseEvent extends Equatable {
  final dynamic payload;
  final dynamic type;
  BaseEvent({this.type, this.payload});

  @override
  List<Object> get props => [payload, type];
}
