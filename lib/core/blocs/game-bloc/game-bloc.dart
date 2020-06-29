import 'package:bloc/bloc.dart';
import 'package:bloc_learn/core/blocs/events/base-event.dart';
import 'package:bloc_learn/core/blocs/events/game-events.dart';
import 'package:bloc_learn/core/blocs/states/game-state.dart';
import 'package:bloc_learn/core/enums/enums.dart';
import 'package:bloc_learn/core/model/block-model.dart';
import 'package:bloc_learn/core/utils/utils.dart';

class GameBloc extends Bloc<BaseEvent, GameState> {
  GameBloc() {
    print("game block is created");
  }
  @override
  GameState get initialState {
    return GameState();
  }

  @override
  Stream<GameState> mapEventToState(BaseEvent event) async* {
    switch (event.type) {
      case GameEventsEnum.Move:
        Map<String, dynamic> payload = event.payload;
        state.blocks[getIdFromRowAndCol(payload["row"], payload["col"])] =
            BlockModel(
                row: payload["row"],
                col: payload["col"],
                blockType: BlockTypeEnum.Cricle);

        yield state;
        break;
    }
  }
}
