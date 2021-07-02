import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:QiYang/generated/l10n.dart';
import 'package:QiYang/util/hex_color.dart';
import 'package:QiYang/util/time_util.dart';

//回调用方法
typedef Function Callback(BuildContext context);

//首屏广告组建
class SplashScreenWidget extends StatefulWidget {
  //定时器
  final int seconds;

  //回调
  final Callback callback;

  final Widget image;

  SplashScreenWidget(this.callback, this.seconds, this.image);

  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends State<SplashScreenWidget> {
  TimerUtil timerUtil;

  //间隔
  int period = 1;

  //定时器
  int seconds;

  @override
  void initState() {
    super.initState();
    setState(() {
      this.seconds = widget.seconds;
    });

    _startTimer();
  }

  @override
  void didUpdateWidget(covariant SplashScreenWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    //开始倒计时
    timerUtil.startCountDown();
  }

  //启动定时器
  void _startTimer() {
    timerUtil = new TimerUtil(
        mInterval: Duration(seconds: 1).inMilliseconds,
        mTotalTime: Duration(seconds: seconds).inMilliseconds)
        .setOnTimerTickCallback((int tick) {
          double _tick = tick / 1000;

          setState(() {
        seconds = _tick.toInt();
      });

      //触发完成事件
      if (_tick.toInt() == 0) {
        _endTimer();
      }
    });
  }


  void _endTimer() {
    widget.callback(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          widget.image,
          Container(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(20),
              vertical: ScreenUtil().setHeight(20),
            ),
            child: InkWell(
              onTap: () {
                _endTimer();
              },
              child: new Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: ScreenUtil().setWidth(12),
                    vertical: ScreenUtil().setHeight(12),
                  ),
                  child: new Text(
                    "${S.of(context).startPage(seconds)}",
                    // IntlUtil.getString(context, Ids.jump_count,
                    //     params: ['$_count']),
                    style: new TextStyle(
                        fontSize: ScreenUtil().setSp(14.0),
                        color: Colors.white),
                  ),
                  decoration: new BoxDecoration(
                      color: HexColor("660000"),
                      borderRadius: BorderRadius.all(
                          Radius.circular(ScreenUtil().setWidth(4))),
                      border: new Border.all(
                          width: ScreenUtil().setWidth(0.33),
                          color: Colors.red))),
            ),
          )
        ],
      ),
    );
  }
}
