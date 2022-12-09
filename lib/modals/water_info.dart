import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class WaterInfo {
  final double waterAmount;
  final String date;
  final String id;

  WaterInfo({
    required this.id,
    required this.waterAmount,
    required this.date,
  });
}

class WaterInfoList with ChangeNotifier {
  List<WaterInfo> _waterInfoList = [];

  List<WaterInfo> get waterInfoList {
    return [..._waterInfoList];
  }

  void addToList(double waterAmount, String id) {
    _waterInfoList.insert(
      0,
      WaterInfo(
        id: id,
        waterAmount: waterAmount,
        date: DateFormat.jm().format(DateTime.now()),
      ),
    );
  }

  void deleteFromList(index) {
    _waterInfoList.removeAt(index);
  }

  double totalWaterAmount() {
    double waterAmount = 0;
    for (int i = 0; i < _waterInfoList.length; i++) {
      waterAmount += _waterInfoList[i].waterAmount;
    }
    return waterAmount / 1000;
  }
}
