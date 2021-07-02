import 'package:QiYang/servers/common/model/banner_model.dart';
import 'package:QiYang/servers/common/widget/tab/progress_view_widget.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

//首页banner
class HomeBannerWidget extends StatelessWidget {
  final BannerModel bannerModel;

  const HomeBannerWidget({Key key, this.bannerModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (bannerModel.banners.length == 0) {
      return new Container(height: 0.0);
    }

    List<Banners> images = bannerModel.banners;
    images.sort((a, b) => a.order.compareTo(b.order));

    return new Swiper(
      // duration: Duration(seconds: 5).inMilliseconds,
      autoplayDelay: Duration(seconds: 5).inMilliseconds,
      itemBuilder: (BuildContext context, int index) {
        return ExtendedImage.network(images[index].url,
            fit: BoxFit.cover,
            cache: true,
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            enableLoadState: true,
            loadStateChanged: (ExtendedImageState state) {
              switch (state.extendedImageLoadState) {
                case  LoadState.loading:
                  return ProgressViewWidget();
                case LoadState.completed:
                  return null;
                case LoadState.failed:
                  return ProgressViewWidget();
              }

              return null;
            });
      },
      autoplay: true,
      itemCount: images.length,
      loop: true,
      pagination: new HomeBannerSwiperPagination(),
      // control: new SwiperControl(),
    );
  }
}

class HomeBannerSwiperPagination extends SwiperPagination {
  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    int index = config.activeIndex;

    return Align(
      alignment: Alignment.topRight,
      child: Container(
        alignment: Alignment.center,
        width: ScreenUtil().setWidth(35),
        height: ScreenUtil().setHeight(20),
        decoration: BoxDecoration(
            color: Colors.black45, borderRadius: BorderRadius.circular(20.0)),
        margin: EdgeInsets.only(top: 10.0, right: 5.0),
        padding: EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
        child: Text("${++index}/${config.itemCount}",
            style: TextStyle(color: Colors.white70, fontSize: 11.0)),
      ),
    );
  }
}
