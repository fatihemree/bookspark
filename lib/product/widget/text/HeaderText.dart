import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';

class HeaderText extends StatelessWidget {
  final String text;
  final Widget? rightArea;
  final bool isIcon;
  const HeaderText({
    Key? key,
    required this.text,
    this.isIcon = true,
    this.rightArea,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return buildHeadlineWithIcon(context, text);
  }

  Padding buildHeadlineWithIcon(BuildContext context, String text,
      {Icon? icon}) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * .075, vertical: context.width * .035),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        // width: double.infinity,
        children: [
          Text(
            text,
            style: context.textTheme.headline6!.copyWith(
                fontWeight: FontWeight.bold, fontSize: context.width * .05),
            textAlign: TextAlign.left,
          ),
          rightArea == null
              ? isIcon
                  ? Icon(
                      icon as IconData? ?? Icons.chevron_right_sharp,
                      color: context.colors.secondaryVariant,
                    )
                  : SizedBox()
              : rightArea!
        ],
      ),
    );
  }
}
