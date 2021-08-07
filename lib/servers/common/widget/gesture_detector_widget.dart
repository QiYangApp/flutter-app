import 'package:flutter/cupertino.dart';

class GestureDetectorWidget extends StatelessWidget {
  final Widget child;

  const GestureDetectorWidget({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()  {
        FocusScope.of(context).requestFocus(FocusNode());


        // // 点击空白区域，回收键盘
        // _focusNodePassWord.unfocus();
        // _focusNodeUserName.unfocus();
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus.unfocus();
        }
      },
      child: child,
    );
  }

}