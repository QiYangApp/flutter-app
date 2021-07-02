import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:QiYang/generated/l10n.dart';

class HomeHeaderWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: _LeadingBarWidget(),
        title: _SearchBarWidget(),
        actions: [
          _MailBarWidget(),
        ]);
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _MailBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _BarWidget(
      child: new IconButton(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.mail_solid,
            color: Colors.black,
          )),
    );
  }
}

class _BarWidget extends StatelessWidget {
  final Widget child;

  const _BarWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: ScreenUtil().setWidth(50),
        height: ScreenUtil().setHeight(50),
        child: child,
      ),
    );
  }
}

class _LeadingBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _BarWidget(
      child: TextButton(
        onPressed: () {},
        child: Text(S.of(context).nav_login,
            style: TextStyle(
                fontSize: ScreenUtil().setSp(14),
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        style: TextButton.styleFrom(
          // primary: Colors.transparent,
          // onSurface: Colors.transparent,
          // shadowColor: Colors.transparent,
          // backgroundColor: Colors.transparent,
          // shape: CircleBorder(
          //     side: BorderSide(
          //         width: 0, style: BorderStyle.none, color: Colors.transparent)),
          padding: EdgeInsets.zero,
        ),
      ),
    );
  }
}

//顶部搜索框
class _SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
          maxHeight: ScreenUtil().setHeight(40),
          maxWidth: ScreenUtil().setWidth(340)),
      child: Center(
        child: TextField(
          decoration: InputDecoration(
            hintText: '请输入手机号',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
                Radius.circular(10),
              ),
            ),
            contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
            prefixStyle: TextStyle(color: Colors.black),
            labelStyle: TextStyle(
              color: Colors.black,
              fontSize: ScreenUtil().setSp(10),
            ),
          ),
          keyboardType: TextInputType.text,
          // enabled: false,
          onTap: () {
            Fluttertoast.showToast(msg: '点击事件');
          },
        ),
      ),
    );
  }
}
