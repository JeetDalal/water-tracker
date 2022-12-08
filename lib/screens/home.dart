import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:water_tracker/widgets/water_dark_info.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context, builder: (context) => const WaterInfo());
        },
        backgroundColor: const Color(0xffCBEDD5),
        child: const Icon(
          Icons.add,
          color: Color(0xff439A97),
          size: 40,
        ),
      ),
      backgroundColor: const Color(0xff62B6B7),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: CircularPercentIndicator(
                  backgroundColor: const Color(0xffCBEDD5),
                  progressColor: const Color(0xff62B6B7),
                  lineWidth: 20,
                  percent: 1.7 / 3.7,
                  radius: MediaQuery.of(context).size.width / 3 + 20,
                  center: Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff439A97),
                          spreadRadius: 10,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "1.7L",
                                style: TextStyle(
                                  color: Color(0xff439A97),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                              Text(
                                "/3.7L",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            "Drink Target",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
