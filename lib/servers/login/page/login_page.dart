import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qi_yang/servers/login/bloc/login_bloc.dart';

import 'login_form_page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: BlocProvider(
          create: (context) => LoginBloc(),
          child: LoginFormPage(),
        ));
  }
}
