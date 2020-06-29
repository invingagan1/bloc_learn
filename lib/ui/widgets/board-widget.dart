import 'package:bloc_learn/core/blocs/events/game-events.dart';
import 'package:bloc_learn/core/blocs/game-bloc/game-bloc.dart';
import 'package:bloc_learn/core/enums/enums.dart';
import 'package:bloc_learn/core/model/block-model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoardWidget extends StatelessWidget {
  final Map<String, BlockModel> blocks;
  BoardWidget({this.blocks});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.blueAccent,
      ),
      child: Stack(
        children: this._blockToWidget(),
      ),
    );
  }

  List<Widget> _blockToWidget() {
    List<Widget> _blocks = [];
    blocks.forEach((key, value) {
      _blocks.add(
        Positioned(
          top: (value.row * 100).toDouble(),
          left: (value.col * 100).toDouble(),
          child: BlockWidget(
            blockModel: value,
          ),
        ),
      );
    });
    return _blocks;
  }
}

class BlockWidget extends StatelessWidget {
  final BlockModel blockModel;
  BlockWidget({this.blockModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("send event");
        context.bloc<GameBloc>().add(
              MoveEvent(
                blockModel.row,
                blockModel.col,
                BlockTypeEnum.Cricle,
              ),
            );
      },
      child: Container(
        width: 100,
        height: 100,
        alignment: Alignment.center,
        decoration:
            BoxDecoration(border: Border.all(color: Colors.white70, width: 1)),
        child: Text(
          blockModel.blockType == BlockTypeEnum.Cricle
              ? "O"
              : blockModel.blockType == BlockTypeEnum.Cross ? "X" : "",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
