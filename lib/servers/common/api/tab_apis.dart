import 'package:share_dream/servers/common/api/base_api.dart';
import 'package:share_dream/servers/common/api/base_api_server.dart';
import 'package:share_dream/servers/common/const/TabSelectorConst.dart';
import 'package:share_dream/servers/common/model/tab_model.dart';

class TabApis extends BaseApis {
  static Future<TabModel> getAllTabs() async {
    return TabModel(updatedAt: "2020-03-12 00:00:00", index: 1, tabs: [
      Tabs(title: '1'),
      Tabs(title: '1'),
      Tabs(title: '1'),
      Tabs(title: '1'),
    ]);
  }
}

class TabServer extends BaseApiServer {
  static TabModel getCacheAllTabs() {
    TabModel tabModel = TabSelectorConst.tabs;

    TabApis.getAllTabs().then((value) => tabModel = value);

    return tabModel;
  }
}
