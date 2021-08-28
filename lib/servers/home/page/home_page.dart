import 'package:QiYang/generated/l10n.dart';
import 'package:QiYang/model/response/article_classify_response_model.dart';
import 'package:QiYang/router/router_path.dart';
import 'package:QiYang/servers/common/widget/progress_view_widget.dart';
import 'package:QiYang/servers/home/bloc/home_banner_cubit.dart';
import 'package:QiYang/servers/home/bloc/home_list_bloc.dart';
import 'package:QiYang/servers/home/widget/home_banner_widget.dart';
import 'package:QiYang/servers/home/widget/home_list_head_widget.dart';
import 'package:QiYang/servers/home/widget/home_list_item_widget.dart';
import 'package:QiYang/util/fluro_navigator.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:QiYang/servers/home/widget/home_header_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  ArticleClassifyResponseModel articleClassifyHotModel;

  @override
  void initState() {
    super.initState();

    context.read<HomeBannerCubit>().loadHomeBanner();
    context.read<HomeListBloc>().add(HomeListLoad());
  }

  void _onLoading() async {
    context.read<HomeListBloc>().add(HomeListLoad(page: 1));

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: new HomeHeaderWidget(),
      body: NestedScrollView(
        body: SmartRefresher(
            controller: _refreshController,
            enablePullDown: false,
            enablePullUp: true,
            onLoading: _onLoading,
            child: ListView(
              children: [
                SizedBox(
                  width: ScreenUtil().setWidth(375),
                  height: ScreenUtil().setHeight(200),
                  child: BlocBuilder<HomeBannerCubit, HomeBannerState>(
                    builder: (BuildContext context, state) {
                      if (state is HomeBannerLoaded) {
                        return HomeBannerWidget(bannerModel: state.bannerModel);
                      }

                      //进度条
                      return ProgressViewWidget();
                    },
                  ),
                ),
                ..._buildProjectItem(),
              ],
            )),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [HomeHeaderWidget()],
      ),
    );
  }

  //构建项目文章数据
  List<Widget> _buildProjectItem() {
    List<Widget> items = [];

    items.add(
      HomeListHeadWidget(
        title: S.of(context).homeRecommendedArticle,
        onTap: () {
          NavigatorUtils.push(context, RouterPath.article_classify,
              transition: TransitionType.cupertino, replace: true);
        },
      ),
    );

    items.add(HomeListItemWidget());

    return items;
  }
}
