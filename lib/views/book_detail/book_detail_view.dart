import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/product/widget/sliverAppBar/sliverAppBar.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomSliderAppBar(),
      ),
    );
  }
}
