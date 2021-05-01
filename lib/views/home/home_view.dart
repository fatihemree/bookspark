import 'package:flutter/material.dart';
import '../../product/widget/calendar/calendar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Calendar()),
    );
  }
}
