import 'package:flame/game.dart';
import 'package:flutter/material.dart' hide Image, Gradient;

import 'game.dart';
import 'home_button.dart';



class FlappyAmberGameWidget extends StatelessWidget {
  const FlappyAmberGameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeData(

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: const Size(150, 50),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        hoverColor: Colors.red.shade700,
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade700,
          ),
        ),
      ),
    );

    return MaterialApp(
      title: 'FlappyGame',
      home: GameWidget<FlappyEmberGame>(
        game: FlappyEmberGame(),
        loadingBuilder: (context) => Center(
          child: Text(
            'Loading...',
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        overlayBuilderMap: {
          'menu': (_, game) => Menu(game),

        },
        initialActiveOverlays: const ['menu'],
      ),
      theme: theme,
    );
  }
}