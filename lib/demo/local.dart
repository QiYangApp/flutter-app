import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_dream/generated/l10n.dart';


class LocalizetionPage extends StatefulWidget {
  @override
  _LocalizetionPageState createState() => _LocalizetionPageState();
}

class _LocalizetionPageState extends State<LocalizetionPage> {
  @override
  Widget build(BuildContext context) {

    return Text(S.of(context).appName);
  }
}
