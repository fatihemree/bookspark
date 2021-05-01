import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../core/extension/context_extension.dart';
import 'clipShadowPath.dart';

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipShadowPath(
      clipper: _MyCustomClipper(),
      shadow: Shadow(blurRadius: 5, color: context.colors.secondary),
      child: Container(
        color: Colors.red,
        height: context.height * .25,
        child: SfRadialGauge(
            title: GaugeTitle(
                text: 'Bugün Okuma Hedefin',
                textStyle: context.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colors.secondaryVariant)),
            backgroundColor: context.colors.surface,
            axes: <RadialAxis>[
              RadialAxis(
                  canScaleToFit: true,
                  minimum: 0,
                  maximum: 100,
                  showLabels: false,
                  showTicks: false,
                  startAngle: 180,
                  endAngle: 0,
                  radiusFactor: 1.25,
                  canRotateLabels: false,
                  axisLineStyle: AxisLineStyle(
                    thickness: 0.2,
                    cornerStyle: CornerStyle.startCurve,
                    color: context.colors.background,
                    thicknessUnit: GaugeSizeUnit.factor,
                  ),
                  pointers: <GaugePointer>[
                    RangePointer(
                      color: context.colors.primaryVariant,
                      value: 50,
                      cornerStyle: CornerStyle.endCurve,
                      width: 0.2,
                      sizeUnit: GaugeSizeUnit.factor,
                      enableAnimation: true,
                      animationDuration: 20,
                      animationType: AnimationType.linear,
                    )
                  ],
                  annotations: <GaugeAnnotation>[
                    GaugeAnnotation(
                        positionFactor: 0.1,
                        angle: 90,
                        horizontalAlignment: GaugeAlignment.center,
                        verticalAlignment: GaugeAlignment.far,
                        widget: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                '03:00',
                                style: context.textTheme.headline5
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '30 Dakilalık Hedefin',
                                style: context.textTheme.bodyText2,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text('Devam ediyor...',
                                    style: context.textTheme.subtitle1
                                        .copyWith(fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ))
                  ])
            ]),
      ),
    );
  }
}

class _MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 26);
    path.lineTo(size.width, size.height - 26);
    path.lineTo(size.width, 0.0);
    return path;
  }

  @override
  bool shouldReclip(_MyCustomClipper oldClipper) => false;
}
