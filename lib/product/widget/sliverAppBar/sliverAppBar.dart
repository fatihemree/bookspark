import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';

class CustomSliderAppBar extends StatefulWidget {
  CustomSliderAppBar({Key? key}) : super(key: key);
  @override
  _CustomSliderAppBarState createState() => _CustomSliderAppBarState();
}

class _CustomSliderAppBarState extends State<CustomSliderAppBar> {
  late ScrollController? _controller;
  @override
  void initState() {
    _controller = ScrollController();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              Opacity(
                opacity: _controller!.offset / 210 < 1
                    ? (_controller!.offset / 210)
                    : 1,
                child: Text(
                  '${_controller!.offset}',
                  style: context.textTheme.subtitle2,
                ),
              )
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
}
