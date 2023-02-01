import 'package:flutter/material.dart';

class KeepAlive extends StatefulWidget {
  const KeepAlive({Key? key, required this.widget}) : super(key: key);

  final Widget widget;

  @override
  _KeepAliveState createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAlive>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.widget;
  }
}
