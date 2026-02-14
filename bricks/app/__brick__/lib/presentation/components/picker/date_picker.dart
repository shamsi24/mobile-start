import 'package:flutter/material.dart';
import 'package:{{name.snakeCase}}/presentation/shared/shared.dart';

class DatePicker {
  static show(
    context, {
    DateTime? firstDate,
    DateTime? selectedDate,
    DateTime? lastDate,
  }) async {
    return await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(2015),
      locale: const Locale('az', 'AZ'),
      lastDate: lastDate ?? DateTime(2100),
      confirmText: 'Təsdiq et',
      barrierColor: UIColor.black.withOpacity(0.3),
      cancelText: 'Ləğv et',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            shadowColor: UIColor.white,
            datePickerTheme: DatePickerThemeData(
              dividerColor: UIColor.black.withOpacity(0.1),
              dayStyle: const TextStyle(fontSize: 13),
              dayShape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
            ),
            colorScheme: ColorScheme.light(
              primary: UIColor.primary,
              onPrimary: UIColor.white,
              surface: UIColor.white,
              onSurface: UIColor.black.withOpacity(0.8),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: UIColor.primary,
              ),
            ),
          ),
          child: Container(
            child: child,
          ),
        );
      },
    );
  }
}
