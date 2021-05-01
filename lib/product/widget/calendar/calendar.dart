import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../core/extension/context_extension.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime _selectedDay = null;
  static DateTime kNow = DateTime.now();
  static DateTime kFirstDay = DateTime(kNow.year, kNow.month - 3, kNow.day);
  static DateTime kLastDay = DateTime(kNow.year, kNow.month + 3, kNow.day);
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: kFirstDay,
      lastDay: kLastDay,
      focusedDay: _focusedDay,
      calendarFormat: _calendarFormat,
      calendarStyle: CalendarStyle(
        todayTextStyle: context.textTheme.subtitle1.copyWith(
          color: context.colors.primaryVariant,
          fontWeight: FontWeight.bold,
        ),
        todayDecoration: BoxDecoration(
          color: context.colors.primary,
          border: Border.all(
            width: 1.0,
            color: context.colors.primaryVariant,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        selectedDecoration: BoxDecoration(
          color: context.colors.primaryVariant,
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        defaultDecoration: boxDecorationBorderRadius,
        weekendDecoration: boxDecorationBorderRadius,
        disabledDecoration: boxDecorationBorderRadius,
        outsideDecoration: boxDecorationBorderRadius,
      ),
      selectedDayPredicate: (day) {
        // Use `selectedDayPredicate` to determine which day is currently selected.
        // If this returns true, then `day` will be marked as selected.

        // Using `isSameDay` is recommended to disregard
        // the time-part of compared DateTime objects.
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focusedDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          // Call `setState()` when updating the selected day
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
        }
      },
      onFormatChanged: (format) {
        if (_calendarFormat != format) {
          // Call `setState()` when updating calendar format
          setState(() {
            _calendarFormat = format;
          });
        }
      },
      onPageChanged: (focusedDay) {
        // No need to call `setState()` here
        _focusedDay = focusedDay;
      },
    );
  }

  BoxDecoration get boxDecorationBorderRadius {
    return BoxDecoration(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }
}
