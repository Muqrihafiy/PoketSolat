import 'dart:math';

import 'package:flame/components.dart';

import 'package:flame/game.dart';
import 'package:flame/input.dart';




import 'box_stack.dart';
import 'ground.dart';
import 'player.dart';
import 'score.dart';
import 'sky.dart';

enum GameState { playing, intro, gameOver }

class FlappyEmberGame extends FlameGame
    with HasCollisionDetection, TapDetector {
  static const initialSpeed = 200.0;
  late Player player;
  final _random = Random();
  double speed = FlappyEmberGame.initialSpeed;
  final _boxInterval = 2.0;
  bool _gameOver = false;
  bool get isGameOver => _gameOver;


  @override
  Future<void>? onLoad() async {
    await images.loadAllImages();
    restart();
  }

  @override
  void update(double dt) {
    super.update(dt);
    if (_gameOver) {
      return;
    }
    speed += 10 * dt;
  }

  void gameOver() {
    _gameOver = true;
    speed = 0;
    add(
      TextComponent(
        text: 'Game over!',
        position: size/3,
        anchor: Anchor.centerLeft,
        priority: 10,
      ),
    );
    overlays.add('menu');
  }

  @override
  void onTap() {
    if (_gameOver) {
      restart();
    }
    player.fly();
  }

  void endGame(){
    removeAll(children);
    overlays.remove('menu');
  }

  void restart() {
    overlays.remove('menu');
    removeAll(children);
    _gameOver = false;
    speed = initialSpeed;
    removeAll(children);
    addAll([
      Sky(),
      Ground(),
      ScoreComponent(),
      player = Player(),
      ScreenHitbox(),
      TimerComponent(
        repeat: true,
        period: _boxInterval,
        onTick: () => add(BoxStack(isBottom: _random.nextBool())),
      )
    ]);
  }
}


