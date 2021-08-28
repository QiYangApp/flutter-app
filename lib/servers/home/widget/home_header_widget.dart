import 'package:QiYang/bloc/auth/auth_cubit.dart';
import 'package:QiYang/router/router_path.dart';
import 'package:QiYang/util/fluro_navigator.dart';
import 'package:QiYang/util/image_util.dart';
import 'package:QiYang/util/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:QiYang/generated/l10n.dart';

class HomeHeaderWidget extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: _LeadingBarWidget(),
        title: _SearchTitleWidget(),
        actions: _actionsBarWidget());
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  //按钮
  List<Widget> _actionsBarWidget() {
    return [
      _SearchBarWidget(),
      _MailBarWidget(),
    ];
  }
}

//首页搜索按钮
class _SearchBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(
          CupertinoIcons.search,
          color: Colors.black,
        ),
        onPressed: () {},
      ),
    );
  }
}

//首页邮箱按钮
class _MailBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {
          Log.v('qwwwww');
        },
        icon: Icon(
          CupertinoIcons.mail_solid,
          color: Colors.black,
        ),
      ),
    );
  }
}

class _BarWidget extends StatelessWidget {
  final Widget child;

  final int width;

  final int height;

  const _BarWidget({Key key, this.child, this.width = 50, this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: ScreenUtil().setWidth(width),
        height: ScreenUtil().setHeight(height),
        child: child,
      ),
    );
  }
}

//登录状态
class _LeadingBarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSucceeded) {
          return _BarWidget(
            width: 35,
            child: InkWell(
              onTap: () {
                Log.v("点击头像");
              },
              child: CircleAvatar(
                radius: 60,
                backgroundImage: ImageUtil(state.userInfo.avatar).gen().image,
              ),
            ),
          );
        }

        return _BarWidget(
          child: TextButton(
            onPressed: () {
              NavigatorUtils.push(context, RouterPath.login_mail);
            },
            child: Text(S.of(context).nav_login,
                style: TextStyle(
                    fontSize: ScreenUtil().setSp(14),
                    color: Colors.black,
                    fontWeight: FontWeight.bold)),
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
          ),
        );
      },
    );
  }
}

//顶部搜索框
class _SearchTitleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      S.of(context).home_header_title,
      style: Theme.of(context).textTheme.headline6,
    );
    // return ConstrainedBox(
    //   constraints: BoxConstraints(
    //       maxHeight: ScreenUtil().setHeight(40),
    //       maxWidth: ScreenUtil().setWidth(340)),
    //   child: Center(
    //     child: TextField(
    //       decoration: InputDecoration(
    //         hintText: '请输入手机号',
    //         border: OutlineInputBorder(
    //           borderRadius: BorderRadius.all(
    //             /// 里面的数值尽可能大才是左右半圆形，否则就是普通的圆角形
    //             Radius.circular(10),
    //           ),
    //         ),
    //         contentPadding: EdgeInsets.only(left: ScreenUtil().setWidth(5)),
    //         prefixStyle: TextStyle(color: Colors.black),
    //         labelStyle: TextStyle(
    //           color: Colors.black,
    //           fontSize: ScreenUtil().setSp(10),
    //         ),
    //       ),
    //       keyboardType: TextInputType.text,
    //       // enabled: false,
    //       onTap: () {
    //         Fluttertoast.showToast(msg: '点击事件');
    //       },
    //     ),
    //   ),
    // );
  }
}
