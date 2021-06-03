import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttermvvmtemplate/core/components/text/auto_locale_text.dart';
import 'package:fluttermvvmtemplate/product/widget/chart/circularProgressBar.dart';
import '../../../core/extension/context_extension.dart';

class CustomSliderAppBar extends StatefulWidget {
  CustomSliderAppBar({Key? key}) : super(key: key);
  @override
  _CustomSliderAppBarState createState() => _CustomSliderAppBarState();
}

class _CustomSliderAppBarState extends State<CustomSliderAppBar> {
  late final _controller;
  final _imgUrl =
      'https://yeni.1000kitap.com/_next/image?url=https%3A%2F%2Fcdn.1000kitap.com%2Fresimler%2Fkitaplar%2F12903_uzgun_Kediler_Gazeli-Haydar_Ergulen915.jpg&w=1920&q=75';
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
    return CustomScrollView(
      controller: _controller,
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          expandedHeight: context.height * 0.35,
          backgroundColor: context.colors.surface,
          leading: IconButton(
            icon: Icon(
              Icons.chevron_left_outlined,
              color: opacity < .7 ? context.colors.surface : Colors.black,
            ),
            onPressed: () {},
          ),
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(_imgUrl),
                  fit: BoxFit.cover,
                ),
              ),
              height: context.height * 0.20,
              child: ClipRRect(
                // borderRadius: BorderRadius.all(Radius.circular(40)),
                // clipBehavior: Clip.antiAlias,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
                  child: Container(
                    color: Colors.black.withOpacity(0.1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: context.paddingMedium,
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.circular(context.lowValue),
                            child: Image.network(
                              _imgUrl,
                              fit: BoxFit.cover,
                              // width: context.width * .25,
                              height: context.height * .2,
                              isAntiAlias: true,
                              loadingBuilder:
                                  (context, child, loadingProgress) {
                                if (loadingProgress == null) return child;
                                return Center(
                                    child: CircularProgressIndicator());
                              },
                              errorBuilder: (context, error, stackTrace) =>
                                  Text('Some errors occurred!'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            titlePadding: EdgeInsetsDirectional.only(
                bottom: opacity == -1 ? 0 : opacity * 18),
            title: Column(mainAxisSize: MainAxisSize.min, children: [
              AutoLocaleText(
                value: 'İçimizdeki Şeytan',
                style: context.textTheme.bodyText1!.copyWith(
                  color: opacity < 0.7
                      ? context.colors.surface
                      : context.colors.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              AnimatedOpacity(
                opacity: opacity == -1 ? 1 : (1 - opacity),
                duration: Duration(milliseconds: 300),
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 500),
                  height: opacity > 0.5 ? 0 : context.width * 0.05,
                  padding: EdgeInsets.only(bottom: 0),
                  curve: Curves.bounceInOut,
                  child: AutoLocaleText(
                    value: 'by Sabahattin Ali',
                    minFontSize: 6,
                    style: context.textTheme.caption!.copyWith(
                        color: context.colors.surface,
                        fontSize: context.normalValue * .8),
                  ),
                ),
              ),
            ]),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            <Widget>[
              Container(color: Colors.red, height: 500),
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
