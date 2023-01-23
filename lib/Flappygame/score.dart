import 'package:flame/components.dart';
import 'package:flame/input.dart';
import 'package:flutter/widgets.dart';

import 'game.dart';

class ScoreComponent extends HudMarginComponent<FlappyEmberGame> {
  ScoreComponent()
      : super(
    margin: const EdgeInsets.only(left: 20, top: 20),
    priority: 2,
  );

  late final TextComponent textComponent;
  static const baseText = 'Score:';

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(textComponent = TextComponent(text: '$baseText 0'));
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (!gameRef.isGameOver) {
      final score = (gameRef.speed - FlappyEmberGame.initialSpeed).toInt();
      textComponent.text = '$baseText $score';
    }
  }
}