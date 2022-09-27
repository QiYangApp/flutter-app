import 'package:flutter/material.dart';
import 'package:flutter_ume/flutter_ume.dart';
import 'package:qi_yang/app/config/app_config.dart';
import 'package:qi_yang/init.dart';
import 'package:qi_yang/views/app/app_view.dart'; // UME 框架

void main() async {
  await Init.init(() {
    runApp(
        UMEWidget(enable: AppConfig.hasDevelopmentEnv(), child: const App()));
  });
}
