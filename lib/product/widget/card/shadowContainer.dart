import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';

class ShadowContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final EdgeInsets contentPadding;
  ShadowContainer({
    Key key,
    @required this.child,
    this.padding,
    this.contentPadding,
  }) : assert(padding == null && contentPadding == null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? context.paddingContainerDefault,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, boxShadow: [context.shadowContainerDefault]),
        padding: contentPadding ?? context.paddingContainerContentDefault,
        width: context.width,
        child: child,
      ),
    );
  }
}
