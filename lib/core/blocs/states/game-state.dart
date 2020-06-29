import 'package:bloc_learn/core/enums/enums.dart';
import 'package:bloc_learn/core/model/block-model.dart';
import 'package:bloc_learn/core/utils/utils.dart';
import 'package:equatable/equatable.dart';

class GameState extends Equatable {
  Map<String, BlockModel> blocks = new Map<String, BlockModel>();
  GameState() {
    for (int row = 0; row < 3; row++) {
      for (int col = 0; col < 3; col++) {
        blocks[getIdFromRowAndCol(row, col)] =
            BlockModel(row: row, col: col, blockType: BlockTypeEnum.None);
      }
    }
  }

  @override
  List<Object> get props => [blocks];
}
