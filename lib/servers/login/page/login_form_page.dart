import 'package:qi_yang/bloc/auth/auth_cubit.dart';
import 'package:qi_yang/generated/l10n.dart';
import 'package:qi_yang/servers/common/widget/progress_view_widget.dart';
import 'package:qi_yang/servers/login/bloc/login_bloc.dart';
import 'package:qi_yang/util/fluro_navigator.dart';
import 'package:qi_yang/util/validator/EmailValidator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginFormPage extends StatelessWidget {
  final TextEditingController _nicknameController = new TextEditingController();

  final TextEditingController _passwordController = new TextEditingController();

  final FocusNode _focusNodeNickname = new FocusNode();
  final FocusNode _focusNodePassword = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listenWhen: (p, c) {
          return c is LoginSuccess;
        },
        listener: (context, state) {
          if (state is LoginSuccess) {
            //触发登录事件
            context.read<AuthCubit>().login(state.userModel);

            //跳转
            // NavigatorUtils.push(context, RouterPath.home);
            NavigatorUtils.goBack(context);
          }
        },
        child: GestureDetector(
            onTap: () {
              _focusNodeNickname.unfocus();
              _focusNodePassword.unfocus();
            },
            child: Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: ScreenUtil().setHeight(200),
                        bottom: ScreenUtil().setHeight(40)),
                    child: Text(
                      S.of(context).loginAppBarTitle,
                      style: TextStyle(
                          fontSize: ScreenUtil().setSp(34),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: ScreenUtil().setWidth(300),
                    child: Form(
                      autovalidateMode: AutovalidateMode.always,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _usernameInput(),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                          _passwordInput(),
                          SizedBox(
                            height: ScreenUtil().setHeight(20),
                          ),
                          _loginButton(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )));
  }

  //密码输入框
  Widget _passwordInput() {
    return BlocBuilder<LoginBloc, LoginState>(buildWhen: (previous, current) {
      if (previous is LoginLoadingState && current is LoginLoadingState) {
        return previous.password != current.password;
      }

      return false;
    }, builder: (context, state) {
      return TextFormField(
          focusNode: _focusNodePassword,
          obscureText: true,
          autocorrect: true,
          maxLines: 1,
          textInputAction: TextInputAction.done,
          maxLength: 32,
          onChanged: (v) {
            context.read<LoginBloc>().add(LoginPasswordChanged(v));
          },
          style: TextStyle(color: Colors.black),
          keyboardType: TextInputType.visiblePassword,
          controller: _passwordController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            counterText: '',
            hintText: S.of(context).loginPasswordInputTitle,
            // 未获得焦点下划线设为灰色
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            //获得焦点下划线设为蓝色
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blue),
            ),
          ),
          validator: (v) {
            return v.trim().length > 0 ? null : "不能为空";
          });
    });
  }

  //账号输入框
  Widget _usernameInput() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) {
        if (previous is LoginLoadingState && current is LoginLoadingState) {
          return previous.nickname != current.nickname;
        }

        return false;
      },
      builder: (context, state) {
        return TextFormField(
            focusNode: _focusNodeNickname,
            // obscureText: true,
            autocorrect: true,
            maxLines: 1,
            textInputAction: TextInputAction.next,
            maxLength: 128,
            keyboardType: TextInputType.emailAddress,
            controller: _nicknameController,
            onChanged: (v) {
              context.read<LoginBloc>().add(LoginUsernameChanged(v));
            },
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.email),
              counterText: '',
              hintText: S.of(context).loginNicknameInputTitle,
              // 未获得焦点下划线设为灰色
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              //获得焦点下划线设为蓝色
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
            validator: (v) {
              if (v.isValidEmail()) {
                return "Check your email";
              }

              return v.trim().length > 0 ? null : "不能为空";
            });
      },
    );
  }

  Widget _loginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) {
        if (previous is LoginLoadingState && current is LoginLoadingState) {
          return previous.state != current.state;
        }

        if (current is LoginLoadingState ||
            current is LoginLoadingFailure ||
            current is LoginSubmitted) {
          return true;
        }

        return false;
      },
      builder: (context, state) {
        String text = S.of(context).loginBtnText;
        if (state is LoginSubmitted) {
          text = S.of(context).loginBtnLockText;
        }

        //提交登录状态
        if (state is LoginSubmitted) {
          return ProgressViewWidget();
        }

        return SizedBox(
            width: ScreenUtil().setWidth(300),
            height: ScreenUtil().setHeight(60),
            child: ElevatedButton(
              style: ButtonStyle(),
              onPressed: () {
                _focusNodeNickname.unfocus();
                _focusNodePassword.unfocus();

                //二次检验
                bool status = _verify();
                if (status) {
                  context.read<LoginBloc>().add(LoginSubmitted());
                }

                return status;
              },
              child: Text(
                text,
                style: TextStyle(fontSize: ScreenUtil().setSp(26)),
              ),
            ));
      },
    );
  }

  bool _verify() {
    //todo 登录验证
    if (_nicknameController.text.trim().length < 1) {
      return false;
    }

    if (_nicknameController.text.trim().isValidEmail()) {
      return false;
    }

    if (_passwordController.text.trim().length < 6) {
      return false;
    }

    return true;
  }
}
