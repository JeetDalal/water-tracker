import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:water_tracker/modals/water_info.dart';

class WaterInfo extends StatefulWidget {
  const WaterInfo({Key? key}) : super(key: key);

  @override
  State<WaterInfo> createState() => _WaterInfoState();
}

class _WaterInfoState extends State<WaterInfo> {
  final TextEditingController _amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final waterInfoList = Provider.of<WaterInfoList>(context);
    return AlertDialog(
      title: const Text(
        'Record Water Amount',
        style: TextStyle(
          color: Color(
            0xff439A97,
          ),
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
      backgroundColor: const Color(0xff97DECE),
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        height: 120,
        decoration: const BoxDecoration(
          color: Color(0xff97DECE),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50,
                width: 150,
                decoration: BoxDecoration(
                  color: const Color(0xff439A97),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      spreadRadius: 5,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: _amount,
                    decoration: const InputDecoration(
                      hintText: "Enter Amount",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const Text(
                "  ml",
                style: TextStyle(
                  color: Color(0xff439A97),
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(
              color: Color(0xff439A97),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
        TextButton(
          onPressed: () async {
            final amount = _amount.text;
            await waterInfoList
                .addToDatabase(DateFormat.jm().format(DateTime.now()),
                    double.parse(amount))
                .then(
                  (value) => Navigator.of(context).pop(),
                );
            waterInfoList.addToList(
              double.parse(amount),
            );
          },
          child: const Text(
            'Add',
            style: TextStyle(
              color: Color(0xff439A97),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ),
      ],
    );
  }
}
