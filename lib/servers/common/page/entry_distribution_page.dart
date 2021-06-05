import 'package:custom_navigation_bar/custom_navigation_bar.dart';import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:flutter_spinkit/flutter_spinkit.dart';import 'package:flutter_svg/svg.dart';import 'package:share_dream/servers/common/bloc/tab/tab_selector_bloc.dart';import 'package:share_dream/servers/common/widget/tab/tab_selector_widget.dart';import 'package:share_dream/servers/home/page/home_page.dart';import 'package:share_dream/servers/home/router/home_route.dart';import 'package:share_dream/util/log_utils.dart';class EntryDistributionPage extends StatelessWidget {  @override  Widget build(BuildContext context) {    TabSelectorBloc tabSelectorBloc = BlocProvider.of<TabSelectorBloc>(context);    return Scaffold(      bottomNavigationBar: BlocBuilder<TabSelectorBloc, int>(        bloc: tabSelectorBloc,        builder: (context, state) {          return TabSelectorWidget(              items: tabSelectorBloc.tabModel.tabs.map((e) {                return CustomNavigationBarItem(                    icon: SvgPicture.asset(e.icon), title: Text(e.title));              }).toList(),              currentIndex: tabSelectorBloc.tabModel.index,              onTap: (int index) {                tabSelectorBloc.add(TabSelectorPageTapped(index));              });        },      ),      body: SafeArea(        child: BlocBuilder<TabSelectorBloc, int>(          bloc: tabSelectorBloc,          builder: (context, state) {            String route = tabSelectorBloc.tabModel.tabs[state].route;            switch (route) {              case HomeRoutePath.home:                return HomePage();                break;            }            //进度条            return SpinKitFadingCircle(              color: Colors.blue,              size: ScreenUtil().setWidth(50),            );          },        ),      ),    );  }}