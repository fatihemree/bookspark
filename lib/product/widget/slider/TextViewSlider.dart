import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart' show NumberFormat;

class SliderTextView extends StatefulWidget {
  SliderTextView({Key? key}) : super(key: key);

  @override
  _SliderTextViewState createState() => _SliderTextViewState();
}

class _SliderTextViewState extends State<SliderTextView> {
  double _thumbValue = 4.0;

  final double _thumbMin = 0.0;

  final double _thumbMax = 10.0;

  double _value = 4.0;

  @override
  Widget build(BuildContext context) {
    return SfSliderTheme(
      data: SfSliderThemeData(
          // labelOffset:
          activeLabelStyle: context.textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold, color: context.colors.onPrimary),
          inactiveLabelStyle: context.textTheme.bodyText2!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.secondaryVariant),
          activeTrackColor: context.colors.primaryVariant,
          inactiveTrackColor: context.colors.primaryVariant.withOpacity(0.24),
          thumbColor: context.colors.primaryVariant,
          tooltipBackgroundColor: context.colors.primaryVariant,
          overlayColor: context.colors.primaryVariant.withOpacity(0.24),
          thumbRadius: 14),
      child: SfSlider(
        showLabels: true,
        enableTooltip: true,
        showDivisors: true,
        numberFormat: NumberFormat('#'),
        interval: 50,
        min: 0.0,
        max: 256.0,
        thumbIcon: Container(
            alignment: Alignment.center,
            child: Text(
              _value.toInt().toString(),
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )),
        value: _value,
        onChanged: (dynamic values) {
          setState(() {
            _value = values;
          });
        },
      ),
    );
  }
}
