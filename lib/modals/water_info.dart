import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WaterInfo {
  final double waterAmount;
  final String date;

  WaterInfo({
    required this.waterAmount,
    required this.date,
  });
}

class WaterInfoList with ChangeNotifier {
  List<WaterInfo> _waterInfoList = [];
  double _drankWater = 0.0;

  List<WaterInfo> get waterInfoList {
    return [..._waterInfoList];
  }

  void addToList(double waterAmount) {
    _waterInfoList.insert(
      0,
      WaterInfo(
        waterAmount: waterAmount,
        date: DateFormat.jm().format(DateTime.now()),
      ),
    );
  }

  double get waterDrank {
    return _drankWater;
  }

  void deleteFromList(index) {
    _waterInfoList.removeAt(index);
  }

  Future<void> addToDatabase(String date, double waterAmount) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc('abcxyz')
        .collection("${DateFormat.yMMMMd('en_US').format(DateTime.now())}")
        .doc()
        .set({
      'date': date,
      'waterAmount': waterAmount,
    });
  }

  Future<void> deleteFromDatabase(
      AsyncSnapshot<QuerySnapshot> snapshot, int index) async {
    FirebaseFirestore.instance
        .collection('users')
        .doc('abcxyz')
        .collection('${DateFormat.yMMMMd('en_US').format(DateTime.now())}')
        .doc(snapshot.data!.docs[index].id)
        .delete();
  }

  String result(double amountOfWaterDrank) {
    if (amountOfWaterDrank < 3.7) {
      return "Target Not\nReached😔";
    } else {
      return "Congrats!|You have\nreached your target🥳";
    }
  }
}
