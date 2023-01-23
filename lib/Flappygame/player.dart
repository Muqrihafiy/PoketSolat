import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

import 'game.dart';

class Player extends SpriteAnimationComponent
    with CollisionCallbacks, HasGameRef<FlappyEmberGame>{
  Player() : super(position: Vector2.all(100), size: Vector2.all(50));

  final velocity = Vector2(0, 150);
  final _fallingSpeed = 400;
  bool _isDying = false;

  @override
  Future<void> onLoad() async {
    animation = SpriteAnimation.fromFrameData(
      await Flame.images.load('sprites/bluebirdspritesheet.png'),
      SpriteAnimationData.sequenced(
        amount: 4,
        textureSize: Vector2(34,24),
        stepTime: 0.12,
      ),
    );
    add(CircleHitbox());
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.y += dt * _fallingSpeed;

  }

  @override
  void onCollisionStart(Set<Vector2> _, PositionComponent other) {
    super.onCollisionStart(_, other);
    die();

  }
  void die() {
    if (_isDying) {
      return;
    }

    _isDying = true;
    addAll([
      ScaleEffect.to(
        Vector2(0.0, 0.0),
        EffectController(
          duration: 2.0,
          curve: Curves.bounceInOut,
        ),
      ),
      RotateEffect.by(
        9,
        EffectController(duration: 2.0),
      )..onComplete = gameRef.gameOver,
    ]);
  }

  void fly() {
    add(
      MoveByEffect(
        Vector2(0, -200),
        EffectController(
          duration: 0.5,
          curve: Curves.decelerate,
        ),
      ),
    );
  }
}

