import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_dream/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:share_dream/servers/splash_screen/model/guide_page_model.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:share_dream/util/hex_color.dart';

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

    List<Images> images = widget.guidePageModel.images;
    images.sort((a,b) => a.order.compareTo(b.order));

    images.forEach((value) {
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
