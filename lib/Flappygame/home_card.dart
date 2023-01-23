import 'package:flutter/material.dart' hide Image, Gradient;


class MenuCard extends StatelessWidget {
  const MenuCard({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green,
      shadowColor: Colors.white,
      elevation: 10,
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}