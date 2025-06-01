import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rht_mobile_template/app/generic/generic_state.dart';
import 'package:rht_mobile_template/data/exception/error.dart';
import 'package:rht_mobile_template/presentation/components/picker/date_picker.dart';

enum Calendar { startDate, endDate, orderDate }

class DatePickerHelper {
  String _startDate = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 60)));
  String _endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  String _orderDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool canFetchMore = true;

  String get startDate => _startDate;
  String get endDate => _endDate;
  String get orderDate => _orderDate;

  Future<String?> pickDate(
    Calendar calendar,
    BuildContext context,
    String date,
  ) async {
    DateTime initialDate;
    try {
      initialDate = DateFormat('yyyy-MM-dd').parse(date);
    } catch (e) {
      initialDate = DateTime.now();
    }

    final DateTime? selectedDate = await DatePicker.show(
      context,
      selectedDate: initialDate,
      firstDate: DateTime.now(),
      // lastDate: DateTime.now(),
    );

    if (selectedDate != null) {
      final String dateStr = DateFormat('yyyy-MM-dd').format(selectedDate);

      if (calendar == Calendar.startDate) {
        if (DateTime.parse(dateStr).isAfter(DateTime.parse(_endDate))) {
          throw Failure(ErrorMessage(message: "Başlanğıc tarix, son tarixdən böyük ola bilməz."));
        }
        _startDate = dateStr;
      } else if (calendar == Calendar.endDate) {
        if (DateTime.parse(dateStr).isBefore(DateTime.parse(_startDate))) {
          throw Failure(ErrorMessage(message: "Son tarix, başlanğıc tarixdən kiçik ola bilməz."));
        }
        _endDate = dateStr;
      } else if (calendar == Calendar.orderDate) {
        if (DateTime.parse(dateStr).isBefore(DateTime.now())) {
          throw Failure(ErrorMessage(message: "Keçmiş tarixi seçə bilməzsiniz."));
        }
        _orderDate = dateStr;
      }
      return dateStr;
    }
    return null;
  }
}
