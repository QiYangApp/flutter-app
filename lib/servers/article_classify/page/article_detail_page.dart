import 'package:QiYang/generated/l10n.dart';
import 'package:QiYang/servers/article_classify/bloc/article_detail_cubit.dart';
import 'package:QiYang/servers/common/widget/progress_view_widget.dart';
import 'package:QiYang/util/fluro_navigator.dart';
import 'package:QiYang/util/image_util.dart';
import 'package:QiYang/util/log_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ArticleDetailPage extends StatelessWidget {
  //文章id
  final String articleId;

  const ArticleDetailPage({Key key, @required this.articleId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Theme.of(context).iconTheme.color,
          ),
          onPressed: () {
            NavigatorUtils.goBack(context);
          },
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).iconTheme.color,
              ))
        ],
      ),
      body: BlocProvider<ArticleDetailCubit>(
        create: (context) => ArticleDetailCubit(articleId),
        child: _ArticleDetailView(),
      ),
    );
  }
}

//文章页面
class _ArticleDetailView extends StatefulWidget {
  @override
  _ArticleDetailViewState createState() => _ArticleDetailViewState();
}

class _ArticleDetailViewState extends State<_ArticleDetailView> {
  @override
  void initState() {
    super.initState();

    //加载文章
    context.read<ArticleDetailCubit>().load();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ArticleDetailCubit, ArticleDetailState>(
        builder: (context, state) {
      if (state is ArticleDetailLoadedState) {
        Log.v(state.model);
        return Container(
          color: Colors.white,
          child: Column(
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(20)),
                alignment: Alignment.topLeft,
                child: Text(
                  state.model.title,
                  maxLines: 3,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              _ArticleDetailUserInfo(
                avatar: state.model.avatar,
                authorName: state.model.authorName,
                watch: state.model.watch,
                publishTime: state.model.publishTime,
              ),
              Expanded(child: Markdown(data: state.model.content))
            ],
          ),
        );
      }

      return ProgressViewWidget();
    });
  }
}

//用户信息
class _ArticleDetailUserInfo extends StatelessWidget {
  final String authorName;

  final String avatar;

  final String publishTime;

  final int watch;

  const _ArticleDetailUserInfo(
      {Key key, this.authorName, this.avatar, this.watch, this.publishTime})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      transformAlignment: Alignment.center,
      height: ScreenUtil().setHeight(60),
      child: Row(
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(50),
            child: ClipOval(
              child: ImageUtil(avatar).gen(),
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(4),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(authorName),
              SizedBox(
                height: ScreenUtil().setHeight(10),
              ),
              Row(
                children: [
                  Text(publishTime),
                  Text(" - "),
                  Text(watch.toString() + ' ' + S.of(context).home_item_see)
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
