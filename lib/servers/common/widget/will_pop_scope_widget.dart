import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

// ignore: must_be_immutable
class WillPopScopeWidget extends StatelessWidget {

  final Widget child;

  DateTime _lastPressedAt; //上次点击时间

  WillPopScopeWidget({this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child: child, onWillPop: _onWillPop);
  }

  Future<bool> _onWillPop() async {
    if (_lastPressedAt == null ||
        DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
      _lastPressedAt = DateTime.now();

      toast();

      return false;
    }

    // if (Platform.isAndroid) {
    //   await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    // } else {
    //   exit(0);
    // }

    await SystemNavigator.pop();

    return true;
  }

  void toast() {
    Fluttertoast.showToast(
        msg: "再按一次退出",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black12,
        textColor: Colors.black,
        fontSize: 16.0,
    );
  }

}

