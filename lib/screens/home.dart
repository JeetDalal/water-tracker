import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:water_tracker/modals/water_info.dart' as water;
import 'package:water_tracker/widgets/water_dark_info.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final waterInfoList = Provider.of<water.WaterInfoList>(context);
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
                  animation: true,
                  percent: 1 - (waterInfoList.totalWaterAmount() / 3.7) >= 0
                      ? (1 - (waterInfoList.totalWaterAmount() / 3.7))
                      : 0,
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
                            children: [
                              Text(
                                "${waterInfoList.totalWaterAmount().toString()}L",
                                style: const TextStyle(
                                  color: Color(0xff439A97),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 35,
                                ),
                              ),
                              const Text(
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
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Today\'s Records',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: waterInfoList.waterInfoList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 5,
                    ),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.timer,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                      left: 15,
                                    ),
                                    child: Text(
                                      waterInfoList.waterInfoList[index].date,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${waterInfoList.waterInfoList[index].waterAmount} ml",
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      waterInfoList.deleteFromList(
                                        index,
                                      );
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
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
