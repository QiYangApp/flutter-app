import 'package:qi_yang/router/router_path.dart';
import 'package:qi_yang/servers/common/widget/progress_view_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qi_yang/servers/splash_screen/bloc/guide_page_bloc.dart';
import 'package:qi_yang/servers/splash_screen/widget/guide_page_widget.dart';
import 'package:qi_yang/util/fluro_navigator.dart';

class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  void initState() {
    super.initState();

    //触发首屏图片
    context.read<GuidePageBloc>().add(GuidePageStartEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GuidePageBloc, GuidePageState>(
      listener: (BuildContext context, state) {
        //跳转路由
        if (state is GuidePageConfirmBtn) {
          NavigatorUtils.push(
              context, RouterPath.entry);
        }
      },
      builder: (BuildContext context, state) {
        if (state is GuidePageLoading) {
          return GuidePageWidget(state.guidePageModel, () {
            BlocProvider.of<GuidePageBloc>(context)
                .add(GuidePageJumpPageEvent(state.guidePageModel.jumpPage));
          });
        }

        //进度条
        return ProgressViewWidget();
      },
    );
  }
}
