import 'dart:ffi';

import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget child;
  final Widget bottomSheet;
  final String? headerTitle;
  final double heightPercent;
  final bool onNavigation;

  bool _isHeader = false;
  BottomSheetWidget({
    Key? key,
    required this.child,
    required this.bottomSheet,
    this.headerTitle,
    this.heightPercent = 0.6,
    this.onNavigation = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: child,
        onTap: () => onNavigation
            ? _buildShowBottomSheetOnNavigation(
                context, bottomSheet, headerTitle, heightPercent)
            : _buildShowBottomSheet(
                context, bottomSheet, headerTitle, heightPercent));
  }

  Future<void> _buildShowBottomSheetOnNavigation(
      BuildContext context, Widget child, String? title, double heightPercent) {
    return showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        // clipBehavior: Clip.hardEdge,
        builder: (context) => Container(
              decoration: boxDecoration(context),
              height: context.height * heightPercent,
              width: double.infinity,
              child: Column(
                children: [
                  touchSwipePointer(context),
                  headerTitle != null
                      ? headerContent(context, title!)
                      : SizedBox(),
                  child,
                ],
              ),
            ));
  }

  PersistentBottomSheetController _buildShowBottomSheet(
      BuildContext context, Widget child, String? title, double heightPercent) {
    return showBottomSheet(
        context: context,
        builder: (context) => Container(
              decoration: boxDecoration(context),
              height: context.height * heightPercent,
              width: double.infinity,
              child: Column(
                children: [
                  touchSwipePointer(context),
                  headerTitle != null
                      ? headerContent(context, title!)
                      : SizedBox(),
                  child,
                ],
              ),
            ));
  }

  Padding touchSwipePointer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.width * .025),
      child: Container(
        height: context.width * .015,
        width: context.width * .2,
        decoration: BoxDecoration(
          color: context.colors.secondary,
          borderRadius: BorderRadius.all(
            Radius.circular(context.width * .01),
          ),
        ),
      ),
    );
  }

  BoxDecoration boxDecoration(BuildContext context) {
    return BoxDecoration(
      color: context.colors.surface,
      borderRadius:
          BorderRadius.vertical(top: Radius.circular(context.width * 0.1)),
    );
  }

  Widget headerContent(BuildContext context, String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.normalValue),
      child: Container(
        alignment: Alignment.centerLeft,
        padding: context.paddingNormal,
        decoration: BoxDecoration(
          color: context.colors.surface,
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(context.width * .03)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.050),
                offset: Offset(0, 10),
                blurRadius: 10,
                spreadRadius: 0.1)
          ],
        ),
        child: Text(
          title,
          style:
              context.textTheme.subtitle1!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
