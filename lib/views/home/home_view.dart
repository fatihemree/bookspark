import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/product/widget/CalendarTask/CalendarGrid.dart';
import 'package:fluttermvvmtemplate/product/widget/text/HeaderText.dart';
// import '../../product/widget/calendar/calendar.dart';
// import '../../product/widget/chart/circularProgressBar.dart';
// import '../../product/widget/card/homeBookCard.dart';
import '../../core/extension/context_extension.dart';
import '../../product/widget/card/homeBookCard.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: ListView(children: [
            buildHeadline(context, 'Okunan Kitap'),
            HomeBookCard(),
            CalendarGrid(),
            // buildHeadline(context, 'Notlar'),
            HeaderText(text: 'Notlar'),
            Padding(
              padding: context.paddingDefaultAppVertical,
              child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.surface,
                  ),
                  padding: EdgeInsets.symmetric(
                      horizontal: context.horizontalDefaultValue,
                      vertical: context.verticalDefaultValue),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'İçimizdeki Şeytan',
                            style: context.textTheme.bodyText1,
                          ),
                          SizedBox(
                            height: context.height * 0.025,
                          ),
                          Text(
                            '30 Mayıs',
                            style: context.textTheme.bodyText2!.copyWith(
                                color: context.colors.secondaryVariant),
                          ),
                        ],
                      ),
                      Text('5 pgs',
                          style: context.textTheme.bodyText1!
                              .copyWith(fontWeight: FontWeight.bold))
                    ],
                  )),
            )
          ]),
        ),
      ),
    );
  }

  Padding buildHeadline(BuildContext context, String text) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * .075, vertical: context.width * .035),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          text,
          style: context.textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold, fontSize: context.width * .05),
          textAlign: TextAlign.left,
        ),
      ),
    );
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
          Icon(
            icon as IconData? ?? Icons.chevron_right_sharp,
            color: context.colors.secondaryVariant,
          )
        ],
      ),
    );
  }
}
