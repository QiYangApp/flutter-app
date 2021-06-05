import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_dream/generated/l10n.dart';
import 'package:share_dream/util/hex_color.dart';
import 'package:share_dream/util/time_util.dart';

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

    this.seconds = widget.seconds;

    _startTimer();
  }

  //启动定时器
  void _startTimer() {
    timerUtil = TimerUtil(
            mInterval: Duration(seconds: 1).inMilliseconds,
            mTotalTime: Duration(seconds: widget.seconds).inMilliseconds)
        .setOnTimerTickCallback((millisUntilFinished) {
      setState(() {
        seconds--;
      });

      //触发完成事件
      if (seconds == 0) {
        _endTimer();
      }
    });

    //开始倒计时
    timerUtil.startCountDown();
  }

  void _endTimer() {
    timerUtil.cancel();
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
                // _goMain();
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
