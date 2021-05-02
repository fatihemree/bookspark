import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';

class BottomSheeet extends StatelessWidget {
  final Widget child;
  final Widget bottomSheet;
  BottomSheeet({
    Key key,
    @required this.child,
    @required this.bottomSheet,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: child,
      onTap: () => _buildShowBottomSheet(context, bottomSheet),
    );
  }

  PersistentBottomSheetController _buildShowBottomSheet(
      BuildContext context, Widget child) {
    return showBottomSheet(
        context: context,
        builder: (context) => Container(
              decoration: boxDecoration(context),
              height: context.height * .6,
              width: double.infinity,
              child: Column(
                children: [
                  touchSwipePointer(context),
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
}
