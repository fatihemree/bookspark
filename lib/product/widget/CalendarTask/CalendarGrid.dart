import 'dart:math';
import 'package:flutter_annual_task/flutter_annual_task.dart';
import 'package:flutter/material.dart';
import '../../../core/extension/context_extension.dart';

class CalendarGrid extends StatelessWidget {
  const CalendarGrid({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var taskItems = AnnualTaskItemHelper.generateAnnualTask();
    List<AnnualTaskItem> taskItemsWithColor =
        AnnualTaskItemHelper.generateAnnualTaskColorItem(taskItems);
    return Container(
      padding: context.paddingContainerDefault,
      color: context.colors.surface,
      child: AnnualTaskView(
        taskItems, // List<AnnualTaskItem>
        activateColor: context.colors.primaryVariant,
        labelStyle: TextStyle(
            color: context.colors.onSecondary, fontSize: context.width * 0.03),
        emptyColor: Colors.grey.withAlpha(80),
        cellShape: AnnualTaskCellShape.CIRCLE,
      ),
    );
  }
}

// const List<String> CUSTOM_WEEKDAY_LABEL = ['', 'Mon', '', 'Wed', '', 'Fri', ''];
// const List<String> CUSTOM_MONTH_LABEL = [
//   'Jan',
//   '',
//   'Mar',
//   '',
//   'May',
//   '',
//   'Jul',
//   '',
//   'Sep',
//   '',
//   'Nov',
//   ''
// ];

class AnnualTaskItemHelper {
  static List<AnnualTaskItem> generateAnnualTask({int? year, int? sampleSize}) {
    var rnd = new Random();
    sampleSize = sampleSize ?? max(80, min(365, rnd.nextInt(200)));
    year ??= DateTime.now().year;
    DateTime prevDate = DateTime(year, 1, 1);
    return List.generate(sampleSize, (idx) {
      int maxDiff =
          (365 - prevDate.difference(DateTime(year!, 12, 31)).inDays) ~/
              (sampleSize! - idx);
      prevDate = prevDate.add(Duration(days: rnd.nextInt(maxDiff) + 1));
      return AnnualTaskItem(prevDate, rnd.nextDouble());
    });
  }

  static List<AnnualTaskColorItem> generateAnnualTaskColorItem(
      List<AnnualTaskItem> items) {
    List<Color> colors = [Colors.red, Colors.blue, Colors.orange];
    return items
        .map((e) => AnnualTaskColorItem(
              e.date,
              proceeding: e.proceeding!,
              color: colors[Random().nextInt(colors.length)],
            ))
        .toList();
  }
}
