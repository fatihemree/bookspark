import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import '../../../core/extension/context_extension.dart';

class TextBottomLine extends StatelessWidget {
  final title, value, styleTitle, styleValue;
  const TextBottomLine(
      {Key? key,
      required this.title,
      required this.value,
      this.styleTitle,
      this.styleValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: textButton(context, title, value),
    );
  }

  Widget textButton(BuildContext context, String title, String value) {
    return Container(
      width: context.width * .3,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              AutoLocaleText(
                value: title,
                style: styleTitle ?? context.textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              AutoLocaleText(
                value: value,
                style: styleValue ??
                    context.textTheme.subtitle2!
                        .copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
          // Icon(
          //   Icons.chevron_right_rounded,
          //   color: context.colors.secondaryVariant,
          // )
        ],
      ),
    );
  }
}
