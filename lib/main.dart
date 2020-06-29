import 'package:bloc_learn/core/blocs/events/game-events.dart';
import 'package:bloc_learn/core/blocs/game-bloc/game-bloc.dart';
import 'package:bloc_learn/core/blocs/states/game-state.dart';
import 'package:bloc_learn/core/enums/enums.dart';
import 'package:bloc_learn/core/utils/utils.dart';
import 'package:bloc_learn/ui/widgets/board-widget.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            brightness: Brightness.dark),
        home: BlocProvider(
          create: (_) => GameBloc(),
          child: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final GameBloc gameBloc = BlocProvider.of<GameBloc>(context);
    // gameBloc.listen((d) {
    //   print(d);
    // });
    return Scaffold(
      appBar: AppBar(
        title: Text("BLOC Demo"),
      ),
      body: BlocBuilder<GameBloc, GameState>(
        condition: (previoisState, state) {
          print(previoisState);
          return true;
        },
        builder: (context, gameState) {
          gameState.blocks.forEach((key, value) {
            print('----> row: ${value.row} col: ${value.col} ');
          });
          return Center(
            child: Column(
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  child: FlareActor(
                    'assets/liquidloader.flr',
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                    animation: "Untitled",
                  ),
                ),
                BoardWidget(
                  blocks: gameState.blocks,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
