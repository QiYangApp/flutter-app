import 'package:QiYang/generated/l10n.dart';
import 'package:QiYang/util/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeListHeadWidget extends StatelessWidget {
  final EdgeInsets margin;

  final GestureTapCallback onTap;

  final IconData leftIcon;

  final Color titleColor;
  final String titleId;
  final String title;
  final String extraId;
  final String extra;
  final IconData rightIcon;

  const HomeListHeadWidget(
      {Key key,
      this.margin,
      this.onTap,
      this.leftIcon,
      this.titleColor,
      this.titleId,
      this.title,
      this.extraId,
      this.extra,
      this.rightIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ScreenUtil().setHeight(56),
      margin: margin ?? EdgeInsets.zero,
      child: new ListTile(
        onTap: onTap,
        title: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Icon(
              leftIcon ?? Icons.whatshot,
              color: titleColor ?? Colors.blueAccent,
            ),
            new SizedBox(width: ScreenUtil().setWidth(10)),
            new Expanded(
                child: new Text(
              title ?? S.of(context).recommendedItems,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: titleColor ?? Colors.blueAccent,
                fontSize: ScreenUtil().setSp(14),
              ),
            ))
          ],
        ),
        trailing: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            new Text(
              extra ?? S.of(context).more,
              style: TextStyle(
                  color: Colors.grey, fontSize: ScreenUtil().setSp(14)),
            ),
            new Icon(
              rightIcon ?? Icons.keyboard_arrow_right,
              color: Colors.grey,
            )
          ],
        ),
      ),
      decoration: new BoxDecoration(
          //new Border.all(width: 0.33, color: Colours.divider)
          border: new Border(
              bottom: new BorderSide(width: 0.33, color: HexColor('ffe5e5e5')))),
    );
  }
}
