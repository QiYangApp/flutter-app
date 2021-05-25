import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_dream/servers/home/page/home_page.dart';
import 'package:share_dream/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:share_dream/servers/splash_screen/model/guide_page_model.dart';

class GuidePage extends StatefulWidget {
  final GuidePageModel guidePageModel;

  GuidePage(this.guidePageModel);

  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }

    Widget _build() {
      return Container(child: Text("Guide"),);
    }

}