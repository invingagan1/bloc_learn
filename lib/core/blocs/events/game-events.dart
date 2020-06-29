import 'package:bloc_learn/core/enums/enums.dart';
import 'package:bloc_learn/core/model/block-model.dart';

import './base-event.dart';

enum GameEventsEnum { Move }

class MoveEvent implements BaseEvent {
  @override
  var payload;

  @override
  var type;
  MoveEvent(int row, int col, BlockTypeEnum blockType) {
    this.type = GameEventsEnum.Move;
    this.payload = {'row': row, 'col': col, 'blockType': blockType};
  }

  @override
  List<Object> get props => [type, payload];

  @override
  bool get stringify => true;
}
