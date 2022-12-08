import 'package:flutter/material.dart';

class WaterInfo extends StatefulWidget {
  const WaterInfo({Key? key}) : super(key: key);

  @override
  State<WaterInfo> createState() => _WaterInfoState();
}

class _WaterInfoState extends State<WaterInfo> {
  TextEditingController _amount = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        height: 200,
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
          onPressed: () {},
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
