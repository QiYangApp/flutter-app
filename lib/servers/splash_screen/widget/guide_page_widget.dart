import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:qi_yang/model/response/guide_page_response_model.dart';
import 'package:qi_yang/servers/common/widget/image_widget.dart';
import 'package:qi_yang/util/hex_color.dart';

class GuidePageWidget extends StatefulWidget {
  final GuidePageResponseModel guidePageModel;

  final VoidCallback tapDoneButton;

  GuidePageWidget(this.guidePageModel, this.tapDoneButton);

  @override
  GuidePageWidgetState createState() => GuidePageWidgetState();
}

class GuidePageWidgetState extends State<GuidePageWidget> {
  List<GuidePageResponseImages> images = [];

  List<ImageWidget> imageWidget = [];

  @override
  void initState() {
    super.initState();

    images = widget.guidePageModel.images;
    images.sort((a, b) => a.order.compareTo(b.order));
    images.forEach((element) {
      imageWidget.add(ImageWidget(element.url,
          fit: BoxFit.fill, alignment: Alignment.center));
    });
  }

  @override
  Widget build(BuildContext context) {
    return IntroViewsFlutter(
      getPageViewModel(),
      showNextButton: false,
      showBackButton: false,
      showSkipButton: false,
      doneText: const Text("跳过"),
      onTapDoneButton: widget.tapDoneButton,
      pageButtonTextStyles: const TextStyle(
        color: Colors.white,
        fontSize: 18.0,
      ),
    );
  }

  List<PageViewModel> getPageViewModel() {
    List<PageViewModel> page = [];

    for (int i = 0; i < images.length; i++) {
      page.add(PageViewModel(
          pageColor: HexColor("FF03A9F4"),
          bubble: imageWidget[i],
          body: Text(
            images[i].description,
          ),
          title: Text(
            images[i].title,
          ),
          mainImage: imageWidget[i]));
    }

    return page;
  }
}
