import 'package:flutter/material.dart';

class IconFont extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return Text('a',
        style: TextStyle(
            color:  Colors.white,
            fontSize: 100,
            fontFamily: 'daily5'
        )
    );
  }
}