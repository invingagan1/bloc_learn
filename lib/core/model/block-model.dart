import 'package:bloc_learn/core/enums/enums.dart';
import 'package:equatable/equatable.dart';

class BlockModel extends Equatable {
  final int row;
  final int col;
  final BlockTypeEnum blockType;
  BlockModel({this.row, this.col, this.blockType});

  @override
  List<Object> get props => [row, col, blockType];
}
