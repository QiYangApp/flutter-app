import 'package:QiYang/servers/common/bloc/tab/tab_selector_bloc.dart';
import 'package:QiYang/servers/common/widget/tab/progress_view_widget.dart';
import 'package:QiYang/servers/common/widget/tab/tab_selector_widget.dart';
import 'package:QiYang/servers/home/bloc/home_banner_cubit.dart';
import 'package:QiYang/servers/home/bloc/home_list_bloc.dart';
import 'package:QiYang/servers/home/widget/home_banner_widget.dart';
import 'package:QiYang/util/log_utils.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:QiYang/servers/home/widget/home_header_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_animated/auto_animated.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  @override
  void initState() {
    super.initState();
  }

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);//要点3

    final TabSelectorBloc tabSelectorBloc =
        BlocProvider.of<TabSelectorBloc>(context);

    return Scaffold(
      bottomNavigationBar: TabSelectorWidget(
          items: tabSelectorBloc.tabItems, currentIndex: tabSelectorBloc.state),
      appBar: new HomeHeaderWidget(),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("上拉加载");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("加载失败！点击重试！");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("松手,加载更多!");
            } else {
              body = Text("没有更多数据了!");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView(
          children: [
            SizedBox(
              width: ScreenUtil().setWidth(375),
              height: ScreenUtil().setHeight(200),
              child: BlocBuilder<HomeBannerCubit, HomeBannerState>(
                builder: (BuildContext context, state) {
                  Log.v(state);
                  if (state is HomeBannerInitial) {
                    context.read<HomeBannerCubit>().loadHomeBanner();
                  }

                  if (state is HomeBannerLoaded) {
                    return HomeBannerWidget(bannerModel: state.bannerModel);
                  }

                  //进度条
                  return ProgressViewWidget();
                },
              ),
            ),
            BlocBuilder<HomeListBloc, HomeListState>(builder: (context, state) {
              return LiveList(
                shrinkWrap: true,
                //为true可以解决子控件必须设置高度的问题
                physics: NeverScrollableScrollPhysics(),
                //禁用滑动事件
                showItemInterval: Duration(milliseconds: 150),
                showItemDuration: Duration(milliseconds: 350),
                padding: EdgeInsets.all(16),
                reAnimateOnVisibility: true,
                scrollDirection: Axis.vertical,
                itemCount: items.length,
                itemBuilder: animationItemBuilder(
                  (index) => Card(child: Center(child: Text(items[index]))),
                  padding: EdgeInsets.symmetric(vertical: 8),
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}

class VerticalItem extends StatelessWidget {
  const VerticalItem({
    @required this.title,
    Key key,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) => Container(
        height: 96,
        child: Card(
          child: Text(
            '$title a long title',
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
          ),
        ),
      );
}

/// Wrap Ui item with animation & padding
Widget Function(
  BuildContext context,
  int index,
  Animation<double> animation,
) animationItemBuilder(
  Widget Function(int index) child, {
  EdgeInsets padding = EdgeInsets.zero,
}) =>
    (
      BuildContext context,
      int index,
      Animation<double> animation,
    ) =>
        FadeTransition(
          opacity: Tween<double>(
            begin: 0,
            end: 1,
          ).animate(animation),
          child: SlideTransition(
            position: Tween<Offset>(
              begin: Offset(0, -0.1),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );
