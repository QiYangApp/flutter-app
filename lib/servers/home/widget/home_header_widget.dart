import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_dream/generated/l10n.dart';
import 'package:share_dream/r.dart';

class HomeHeaderWidget extends StatelessWidget {
  final Widget widget;

  const HomeHeaderWidget({Key key, this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: _LeadingBarWidget(),
        title: _SearchBarWidget(),
      ),
    );
  }
}

class _LeadingBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ScreenUtil().setWidth(50),
        height: ScreenUtil().setHeight(50),
        child: TextButton(
          onPressed: () {},
          child: Text(S.of(context).nav_login,
              style: TextStyle(
                  fontSize: ScreenUtil().setSp(14),
                  color: Colors.black,
                  fontWeight: FontWeight.bold)),
          style: TextButton.styleFrom(
            backgroundColor: Colors.white,
            shape: CircleBorder(
                side: BorderSide(
                    width: 0, style: BorderStyle.none, color: Colors.black)),
            padding: EdgeInsets.all(0),
          ),
        ),
      ),
    );
  }
}

class _SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextField(
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Colors.black,
            fontSize: 12,
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide(style: BorderStyle.none)),
        ),
        keyboardType: TextInputType.text,
        // enabled: false,
        onTap: () {
          Fluttertoast.showToast(msg: '点击事件');
        },
      ),
    );
  }
}
