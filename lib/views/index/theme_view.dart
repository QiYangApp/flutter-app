import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qi_yang/app/bloc/theme/theme_cubit.dart';

class ThemeView extends StatelessWidget {
  const ThemeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
      builder: (BuildContext context, state) {
        if (Platform.isAndroid) {
          SystemChrome.setSystemUIOverlayStyle(
              (state as ThemeInitial).systemUiOverlayStyle);
        }



        return const Text("a");
      },
      listener: (BuildContext context, Object? state) {},
    );
  }
}
