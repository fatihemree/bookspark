import 'dart:async';

import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';

class CustomSliderAppBar extends StatefulWidget {
  CustomSliderAppBar({Key? key}) : super(key: key);
  @override
  _CustomSliderAppBarState createState() => _CustomSliderAppBarState();
}

class _CustomSliderAppBarState extends State<CustomSliderAppBar> {
  late final _controller;
  double opacity = 1;
  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener(() => setState(() {
          var scrollSetting = _controller.offset / 220;
          opacity = scrollSetting.isNegative
              ? 0
              : scrollSetting > 1
                  ? 1
                  : scrollSetting;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // print('fa');
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: 210.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              height: 210,
              child: Text("Background"),
              color: Colors.grey,
            ),
            centerTitle: true,
            title: Column(mainAxisSize: MainAxisSize.min, children: [
              Text(
                'İçimizdeki Şeytan',
                style: context.textTheme.subtitle1,
              ),
              AnimatedOpacity(
                opacity: (1 - opacity),
                duration: Duration(milliseconds: 300),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: opacity > 0.7 ? 0 : 20,
                  decoration: BoxDecoration(),
                  child: Text('emre'),
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
