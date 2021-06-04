import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttermvvmtemplate/product/widget/bottomSheet/bottomSheet.dart';
import 'package:fluttermvvmtemplate/product/widget/sliverAppBar/sliverAppBar.dart';
import '../../core/extension/context_extension.dart';

class BookDetail extends StatelessWidget {
  const BookDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: false,
      bottomNavigationBar: Wrap(
        children: [
          Center(
            child: Padding(
              padding: context.paddingLow,
              child: BottomSheetWidget(
                headerTitle: 'Okuma Listesi',
                heightPercent: .4,
                child: Container(
                  width: context.width * .9,
                  padding: context.paddingNormal,
                  decoration: BoxDecoration(
                      color: context.colors.primaryVariant.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(context.lowValue)),
                  child: Text(
                    'Kitap Ekle',
                    textAlign: TextAlign.center,
                    style: context.textTheme.subtitle1!.copyWith(
                        color: context.colors.onPrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                bottomSheet: Container(
                  child: Column(
                    children: [
                      ListTile(
                        title: Text('Okudum'),
                      ),
                      ListTile(
                        title: Text('Okuyacağım'),
                      ),
                      ListTile(
                        title: Text('Şimdi Başla'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: CustomSliderAppBar(),
      ),
    );
  }
}
