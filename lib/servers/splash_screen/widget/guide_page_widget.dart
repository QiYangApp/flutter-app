import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_dream/r.dart';
import 'package:share_dream/servers/home/router/home_route.dart';
import 'package:share_dream/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:share_dream/servers/splash_screen/model/guide_page_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:share_dream/util/fluro_navigator.dart';
import 'package:share_dream/util/hex_color.dart';
import 'package:share_dream/util/log_utils.dart';
import 'package:share_dream/util/sp_util.dart';

class GuidePageWidget extends StatefulWidget {
  GuidePageModel guidePageModel;

  GuidePageWidget(this.guidePageModel);

  @override
  GuidePageWidgetState createState() => GuidePageWidgetState();
}

class GuidePageWidgetState extends State<GuidePageWidget> {
  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      getPageViewModel(),
      showNextButton: true,
      showBackButton: false,
      showSkipButton: false,
      doneText: const Text("跳过"),
      onTapDoneButton: () {
        BlocProvider.of<GuidePageBloc>(context)
            .add(GuidePageJumpPageEvent(widget.guidePageModel.jumpPage));
      },
      pageButtonTextStyles: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }

  List<PageViewModel> getPageViewModel() {
    List<PageViewModel> page = [];

    widget.guidePageModel.images.forEach((value) {
      page.add(PageViewModel(
        pageColor: HexColor("FF03A9F4"),
        bubble: Image.asset(value.url),
        body: Text(
          value.description,
        ),
        title: Text(
          value.title,
        ),
        mainImage: Image.asset(
          value.url,
          // width: ScreenUtil().screenWidth,
          // height: ScreenUtil().screenHeight,
          fit: BoxFit.fill,
          alignment: Alignment.center,
        ),
      ));
    });

    return page;
  }
}
