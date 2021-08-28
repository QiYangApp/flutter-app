import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _UserLoginStatus(),
        ],
      ),
    );
  }
}

class _UserLoginStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text("data"),
          Text("data")
        ],
      ),
    );
  }
}
