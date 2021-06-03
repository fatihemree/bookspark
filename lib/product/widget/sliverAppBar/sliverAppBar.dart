import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import '../../../core/extension/context_extension.dart';

class CustomSliderAppBar extends StatefulWidget {
  CustomSliderAppBar({Key? key}) : super(key: key);
  @override
  _CustomSliderAppBarState createState() => _CustomSliderAppBarState();
}

class _CustomSliderAppBarState extends State<CustomSliderAppBar> {
  late final _controller;

  double opacity = -1;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() => setState(() {
          final scrollSetting = _controller.offset / (context.height * 0.35);
          opacity = scrollSetting < 0
              ? 0
              : scrollSetting > 1
                  ? 1
                  : scrollSetting;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(opacity);
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 210.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              height: context.height * 0.20,
              child: Column(
                children: [],
              ),
              color: context.colors.background,
            ),
            centerTitle: true,
            title: Column(mainAxisSize: MainAxisSize.min, children: [
              AutoLocaleText(
                value: 'İçimizdeki Şeytan',
                style: context.textTheme.bodyText1,
              ),
              AnimatedOpacity(
                opacity: opacity == -1 ? 1 : (1 - opacity),
                duration: Duration(milliseconds: 300),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: opacity > 0.7 ? 0 : context.width * 0.05,
                  // height: 10,
                  curve: Curves.bounceInOut,
                  child: AutoLocaleText(
                    value: 'Sabahattin Ali',
                    style: context.textTheme.bodyText2!
                        .copyWith(color: context.colors.secondaryVariant),
                  ),
                ),
              ),
            ]),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(color: Colors.green, height: 500),
              Container(color: Colors.red, height: 500),
              Container(color: Colors.red, height: 500),
              Container(color: Colors.red, height: 500)
            ],
          ),
        ),
      ],
    );
  }

  customScrollControllerOffset(
    double setValue,
    double height,
    ScrollController controller,
  ) =>
      {
        if (controller.hasClients)
          {
            print((controller.offset / height).ceilToDouble()),
            setState(
                () => setValue = (controller.offset / height).ceilToDouble())
          }
      };
}
