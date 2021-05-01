import 'package:flutter/material.dart';
import '../../product/widget/calendar/calendar.dart';
import '../../product/widget/chart/circularProgressBar.dart';
import '../../product/widget/card/homeBookCard.dart';
import '../../core/extension/context_extension.dart';

class HomeView extends StatelessWidget {
  HomeView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Calendar(),
                CircularProgressBar(),
                buildHeadline(context),
                HomeBookCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding buildHeadline(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: context.width * .075, vertical: context.width * .01),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          'Okunan Kitap',
          style:
              context.textTheme.subtitle1.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}
