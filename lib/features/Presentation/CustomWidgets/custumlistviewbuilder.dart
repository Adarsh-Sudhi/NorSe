import 'package:flutter/material.dart';

class CustomListViewBuilderwidget extends StatelessWidget {
  const CustomListViewBuilderwidget(
      {super.key,
      required this.length,
      required this.widget,
      required this.physics});
  final int length;
  final Widget? Function(BuildContext, int) widget;
  final ScrollPhysics physics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: physics,
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: length,
      itemBuilder: widget,
    );
  }
}
