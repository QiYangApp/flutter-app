import 'package:QiYang/servers/splash_screen/splash_screen_const.dart';
import 'package:QiYang/util/sp_util.dart';

class GuidePageServer {
  //获取是否已读引导页
  static bool getReadStatus() {
    return SpUtil.getBool(GuidePageConst.key_read_status);
  }

  //更改已读状态
  static changeForReadStatus() {
    SpUtil.putBool(GuidePageConst.key_read_status, true);
  }
}