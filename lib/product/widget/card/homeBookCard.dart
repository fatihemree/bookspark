import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import '../../../core/extension/context_extension.dart';

class HomeBookCard extends StatelessWidget {
  const HomeBookCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: context.height * .18,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: context.width * .025, horizontal: context.width * .075),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
                flex: 2, fit: FlexFit.tight, child: buildClipRRect(context)),
            Flexible(fit: FlexFit.tight, flex: 6, child: buildContent(context)),
            Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: _getThirdProgressBar(context))
          ],
        ),
      ),
    );
  }
}

Widget buildContent(BuildContext context) {
  return Container(
    padding: context.paddingLowHorizontal,
    height: context.height * .15,
    child: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('İçimizdeki Şeytan',
            style: context.textTheme.subtitle1
                .copyWith(fontWeight: FontWeight.bold)),
        Text('Sabahattin Ali',
            style: context.textTheme.subtitle2
                .copyWith(color: context.colors.onSecondary))
      ],
    ),
  );
}

Text buildText(BuildContext context, String text) {
  return Text(text, style: context.textTheme.subtitle1);
}

Widget buildClipRRect(BuildContext context) {
  return Container(
    height: context.height * .15,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      image: DecorationImage(
        image: NetworkImage(
            'https://img.kitapyurdu.com/v1/getImage/fn:1105911/wh:true/miw:200/mih:200'),
        fit: BoxFit.cover,
      ),
      boxShadow: [
        BoxShadow(
          blurRadius: 1,
          color: context.colors.secondaryVariant,
          offset: Offset(0, 0),
        )
      ],
    ),
  );
}

Widget _getThirdProgressBar(BuildContext context) {
  return Container(
    child: SfRadialGauge(axes: <RadialAxis>[
      RadialAxis(
          minimum: 0,
          maximum: 100,
          showLabels: false,
          showTicks: false,
          startAngle: 270,
          endAngle: 270,
          radiusFactor: 1,
          canScaleToFit: true,
          axisLineStyle: AxisLineStyle(
            thickness: 0.1,
            color: context.colors.background,
            thicknessUnit: GaugeSizeUnit.factor,
          ),
          pointers: <GaugePointer>[
            RangePointer(
                color: context.colors.primaryVariant,
                value: 70,
                cornerStyle: CornerStyle.bothCurve,
                width: 0.15,
                sizeUnit: GaugeSizeUnit.factor,
                enableAnimation: true,
                animationDuration: 20,
                animationType: AnimationType.linear)
          ],
          annotations: <GaugeAnnotation>[
            GaugeAnnotation(
                positionFactor: 0.05,
                horizontalAlignment: GaugeAlignment.center,
                verticalAlignment: GaugeAlignment.center,
                widget: Text(
                  '100%',
                  style: context.textTheme.bodyText1
                      .copyWith(fontWeight: FontWeight.bold),
                ))
          ])
    ]),
  );
}
