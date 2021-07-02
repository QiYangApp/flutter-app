import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MePage extends StatelessWidget {

  final int state;

  MePage(this.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:SafeArea(child: Text("qwqqqqqq $state")));
  }

}