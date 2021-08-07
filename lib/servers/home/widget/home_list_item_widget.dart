import 'package:QiYang/generated/l10n.dart';
import 'package:QiYang/model/const/article_classify_const.dart';
import 'package:QiYang/model/response/article_classify_response_model.dart';
import 'package:QiYang/servers/home/bloc/home_list_bloc.dart';
import 'package:QiYang/util/hex_color.dart';
import 'package:QiYang/util/image_util.dart';
import 'package:QiYang/util/log_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListItemWidget extends StatefulWidget {
  @override
  _HomeListItemWidgetState createState() => _HomeListItemWidgetState();
}

class _HomeListItemWidgetState extends State<HomeListItemWidget> {
  //默认数据
  List<ArticleClassifyResponseData> _data = [];

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeListBloc, HomeListState>(
      bloc: context.read<HomeListBloc>(),
      listener: (context, state) {
        if (state is HomeListLoadSuccess) {
          if (mounted)
            setState(() {
              _data.addAll(state.articleClassifyHotModel.data);
            });
        }
      },
      child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          //为true可以解决子控件必须设置高度的问题
          physics: NeverScrollableScrollPhysics(),
          itemCount: _data.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
                onTap: () {
                  Log.v(_data[index].title);
                },
                child: _HomeListItemChildWidget(
                  data: _data[index],
                ));
          }),
    );
  }
}

class _HomeListItemChildWidget extends StatelessWidget {
  //默认数据
  final ArticleClassifyResponseData data;

  const _HomeListItemChildWidget({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().scaleWidth,
      padding: EdgeInsets.only(
        top: ScreenUtil().setHeight(8),
      ),
      child: ArticleCardShared(data: data),
    );
  }

  getCard() {}
}

//头像+名称
class _ArticleAuthor extends StatelessWidget {
  //头像
  final String avatar;

  //名称
  final String nickname;

  const _ArticleAuthor({Key key, this.avatar, this.nickname}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(6)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: ScreenUtil().setHeight(25),
            width: ScreenUtil().setHeight(25),
            child: CircleAvatar(
              radius: 60,
              backgroundImage: ImageUtil(avatar).gen().image,
            ),
          ),
          SizedBox(
            width: ScreenUtil().setWidth(4),
          ),
          Text(
            nickname,
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(color: Colors.black87),
          )
        ],
      ),
    );
  }
}

//文章卡片
class ArticleCardShared extends StatelessWidget {
  //默认数据
  final ArticleClassifyResponseData data;

  const ArticleCardShared({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child;
    if (data.articleClassify == ArticleClassifyConst.article.val) {
      child = ArticleCard(data: data);
    } else if (data.articleClassify == ArticleClassifyConst.articleVideo.val) {
      child = ArticleCard(data: data);
    } else if (data.articleClassify == ArticleClassifyConst.articleImage.val) {
      child = ArticleImageCard(data: data);
    }

    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "asdfasdfasdfasdeqwrqwerqwerqwerdsfasfasfasdsafasdfasdfasdfasdfasdfasfasfasfasfasdfasfasfasgqwasdfasffxbvxvfasd",
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: ScreenUtil().setSp(20)),
            ),
            //头像 + 名称
            child,
            Padding(
              padding: EdgeInsets.only(top: ScreenUtil().setHeight(6)),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        "111" + " ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.grey),
                      ),
                      Text(
                        S.of(context).home_item_agree_with,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.grey),
                      )
                    ],
                  ),
                  Text("  -  "),
                  Row(
                    children: [
                      Text(
                        "222" + " ",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.grey),
                      ),
                      Text(
                        S.of(context).home_item_see,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(color: Colors.grey),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//文章图片卡片类型
class ArticleImageCard extends StatelessWidget {
  //默认数据
  final ArticleClassifyResponseData data;

  const ArticleImageCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        // width: ScreenUtil().scaleWidth,
        child: Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
            flex: 3,
            child: Column(
              children: [
                _ArticleAuthor(
                  nickname: data.authorName,
                  avatar: data.avatar,
                ),
                Text(
                  data.desc,
                  maxLines: 2,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontSize: ScreenUtil().setSp(15), color: Colors.black),
                )
              ],
            )),
        Expanded(
            flex: 1,
            child: Padding(
              padding:
                  EdgeInsets.symmetric(vertical: ScreenUtil().setHeight(6)),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(7),
                  child: ImageUtil(data.resource,
                          height: ScreenUtil().setHeight(65),
                          width: ScreenUtil().setWidth(120),
                          fit: BoxFit.fitWidth)
                      .gen()),
            ))
      ],
    ));
  }
}

//文章类型卡片
class ArticleCard extends StatelessWidget {
  //默认数据
  final ArticleClassifyResponseData data;

  const ArticleCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ArticleAuthor(
          nickname: data.authorName,
          avatar: data.avatar,
        ),
        SizedBox(
          // width: ScreenUtil().scaleWidth,
          child: Text(
            data.desc,
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                fontSize: ScreenUtil().setSp(15), color: Colors.black),
          ),
        )
      ],
    );
  }
}

//视频类型卡片
class ArticleVideoCard extends StatelessWidget {
  //默认数据
  final ArticleClassifyResponseData data;

  const ArticleVideoCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //todo 视频模块代码开发
    return Container();
  }

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
              begin: Offset(0.5, -0),
              end: Offset.zero,
            ).animate(animation),
            child: Padding(
              padding: padding,
              child: child(index),
            ),
          ),
        );
