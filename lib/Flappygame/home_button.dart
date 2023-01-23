

import 'package:daily5/models/bottomnavbar.dart';
import 'package:flutter/material.dart' hide Image, Gradient;
import 'package:get/get.dart';
import 'game.dart';
import 'home_card.dart';


class Menu extends StatelessWidget {
  const Menu(this.game, {super.key});

  final FlappyEmberGame game;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Center(
        child: Wrap(
          children: [
            Column(
              children: [
                MenuCard(
                  children: [

                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text('Restart'),
                      onPressed: () {
                         game.restart();

                      },
                    ),

                    const SizedBox(height: 10),
                    ElevatedButton(
                      child: const Text('Home'),
                      onPressed: () {
                        game.endGame();
                        Get.to(() => bottomnavbar());

                      },
                    ),

                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}