import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:taiwan_transportation_tracking/model/type_bar.dart';

class OverviewPage extends StatefulWidget {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  State<OverviewPage> createState() => _OverviewPageState();
}

class _OverviewPageState extends State<OverviewPage> {
  List type = <OverViewType>[
    OverViewType(
      name: "Bike",
      typeUi: TypeUi.bike,
      list: <BikeStation>[
        BikeStation('YouBike2.0 東園里稻田公園', 5, 6, 752),
        BikeStation('YouBike2.0 溪南國中', 6, 4, 1100),
        BikeStation('YouBike2.0 永興宮', 7, 3, 1800)
      ],
    ),
    OverViewType(
      name: "Bus",
      typeUi: TypeUi.bus,
      list: <BusStation>[
        BusStation(
          '台中高工(高工路)',
          290,
          '靠近學校',
          '靠近超商',
          [Bus('73', 240), Bus('65', 300), Bus('綠3', 310)],
          [Bus('綠3', 240), Bus('73', 300), Bus('65', 310)],
        ),
      ],
    ),
    OverViewType(
      name: "MRT",
      typeUi: TypeUi.mrt,
      list: <MrtStation>[
        MrtStation('文心森林公園', '綠', 900, '往高鐵台中站', '往北屯總站', 69, 30),
        MrtStation('文心森林公園', '藍', 910, '往你媽', '往你媽的媽', 87, 90)
      ],
    ),
    OverViewType(
      name: "Train",
      typeUi: TypeUi.train,
      list: <BusStation>[
        BusStation(
          '台中高工(高工路)',
          290,
          '靠近學校',
          '靠近超商',
          [Bus('73', 240), Bus('65', 300), Bus('綠3', 310)],
          [Bus('綠3', 240), Bus('73', 300), Bus('65', 310)],
        ),
      ],
    ),
    OverViewType(
      name: "HSR",
      typeUi: TypeUi.bus,
      list: <BusStation>[
        BusStation(
          '台中高工(高工路)',
          290,
          '靠近學校',
          '靠近超商',
          [Bus('73', 240), Bus('65', 300), Bus('綠3', 310)],
          [Bus('綠3', 240), Bus('73', 300), Bus('65', 310)],
        ),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  List typeName = ["Bike", "Bus", "MRT", "Train", "HSR"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 20),
                itemCount: type.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Stack(
                    fit: StackFit.loose,
                    alignment: index & 1 == 1
                        ? AlignmentDirectional.bottomEnd
                        : AlignmentDirectional.bottomStart,
                    children: [
                      Container(
                        width: 80,
                        padding: const EdgeInsets.all(8),
                        margin: index & 1 == 1
                            ? const EdgeInsets.only(right: 16, bottom: 20)
                            : const EdgeInsets.only(left: 16, bottom: 20),
                        child: Center(
                          child: Text(
                            type[index].name,
                            style: const TextStyle(
                              fontSize: 21,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                      ),
                      Container(
                        margin: index & 1 == 1
                            ? const EdgeInsets.fromLTRB(20, 20, 56, 0)
                            : const EdgeInsets.fromLTRB(56, 20, 20, 0),
                        constraints: const BoxConstraints(
                          maxHeight: 200,
                          minWidth: double.infinity,
                        ),
                        decoration: const BoxDecoration(
                          color: Colors.white10,
                          borderRadius: BorderRadius.all(
                            Radius.circular(15),
                          ),
                        ),
                        child: Stack(
                          alignment: index & 1 == 1
                              ? AlignmentDirectional.topEnd
                              : AlignmentDirectional.topStart,
                          children: [
                            Container(
                              margin: index & 1 == 1
                                  ? const EdgeInsets.only(top: 20, right: 20)
                                  : const EdgeInsets.only(top: 20, left: 20),
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.9),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(11),
                                decoration: const BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(5),
                                  ),
                                ),
                              ),
                            ),
                            type[index].getTypeUi(index),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OverViewType {
  String name;
  List list;
  TypeUi typeUi;

  OverViewType({
    required this.name,
    required this.typeUi,
    required this.list,
  });

  Widget trainUi(int typeIndex) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: typeIndex & 1 == 1
              ? const EdgeInsets.only(top: 20, left: 20)
              : const EdgeInsets.only(top: 20, left: 72),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '距離你最近的火車站',
                style: TextStyle(fontSize: 13),
              ),
              Text(
                '${list[0].stationName}    ${list[0].distance} 公尺',
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          margin: typeIndex & 1 == 1
              ? const EdgeInsets.only(top: 8, right: 52, left: 20)
              : const EdgeInsets.only(top: 8, right: 20, left: 52),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 12),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1, color: Colors.white70))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '北上',
                        style: TextStyle(fontSize: 13),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        height: 90,
                        child: ListView.builder(
                          itemCount: list[0].bus1.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '往台北',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '自強號',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      '${list[0].bus1[index].remain} 秒',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '南下',
                        style: TextStyle(fontSize: 13),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        height: 90,
                        child: ListView.builder(
                          itemCount: list[0].bus2.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '往台南',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '自強號',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      '${list[0].bus1[index].remain} 秒',
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget mrtUi(int typeIndex) {
    return Column(
      children: [
        Container(
          height: 36,
          alignment: Alignment.centerLeft,
          margin: typeIndex & 1 == 1
              ? const EdgeInsets.only(top: 20, left: 20)
              : const EdgeInsets.only(top: 20, left: 72),
          child: const Text(
            '距離你最近的捷運站',
            style: TextStyle(fontSize: 13),
          ),
        ),
        Expanded(
          child: Container(
            margin: typeIndex & 1 == 1
                ? const EdgeInsets.fromLTRB(20, 4, 56, 20)
                : const EdgeInsets.fromLTRB(56, 4, 20, 20),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            list[index].stationName,
                            style: const TextStyle(fontSize: 13),
                          ),
                          Text(
                            list[index].stationColor,
                            style: const TextStyle(fontSize: 13),
                          ),
                          Text(
                            '${list[index].distance} 公尺',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${list[index].destination1} :',
                            style: const TextStyle(fontSize: 13),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Text(
                              '${list[index].remain1} 秒',
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${list[index].destination2} :',
                            style: const TextStyle(fontSize: 13),
                          ),
                          Container(
                            margin: const EdgeInsets.only(right: 20),
                            child: Text(
                              '${list[index].remain2} 秒',
                              style: const TextStyle(fontSize: 13),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.white54,
                        width: double.infinity,
                        height: 1,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget busUi(int typeIndex) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          margin: typeIndex & 1 == 1
              ? const EdgeInsets.only(top: 20, left: 20)
              : const EdgeInsets.only(top: 20, left: 72),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '距離你最近的公車站',
                style: TextStyle(fontSize: 13),
              ),
              Text(
                '${list[0].stationName}    ${list[0].distance} 公尺',
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ),
        Container(
          margin: typeIndex & 1 == 1
              ? const EdgeInsets.only(top: 8, right: 52, left: 20)
              : const EdgeInsets.only(top: 8, right: 20, left: 52),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(right: 12),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      border: Border(
                          right: BorderSide(width: 1, color: Colors.white70))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[0].stationHint1,
                        style: const TextStyle(fontSize: 13),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        height: 90,
                        child: ListView.builder(
                          itemCount: list[0].bus1.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  list[0].bus1[index].busNumber,
                                  style: const TextStyle(fontSize: 13),
                                ),
                                Text(
                                  '${list[0].bus1[index].remain} 秒',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[0].stationHint2,
                        style: const TextStyle(fontSize: 13),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        height: 90,
                        child: ListView.builder(
                          itemCount: list[0].bus2.length,
                          itemBuilder: (BuildContext ctx, int index) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  list[0].bus2[index].busNumber,
                                  style: const TextStyle(fontSize: 13),
                                ),
                                Text(
                                  '${list[0].bus2[index].remain} 秒',
                                  style: const TextStyle(fontSize: 13),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget bikeUi(int typeIndex) {
    return Column(
      children: [
        Container(
          height: 36,
          alignment: Alignment.centerLeft,
          margin: typeIndex & 1 == 1
              ? const EdgeInsets.only(top: 20, left: 20)
              : const EdgeInsets.only(top: 20, left: 72),
          child: Text(
            '距離你最近的 ${list.length} 個腳踏車站',
            style: const TextStyle(fontSize: 13),
          ),
        ),
        Expanded(
          child: Container(
            margin: typeIndex & 1 == 1
                ? const EdgeInsets.fromLTRB(20, 0, 56, 20)
                : const EdgeInsets.fromLTRB(56, 0, 20, 20),
            child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext ctx, int index) {
                return Container(
                  margin: const EdgeInsets.all(4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].stationName,
                        style: const TextStyle(fontSize: 13),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '車輛 : ${list[index].vehicles}',
                            style: const TextStyle(fontSize: 13),
                          ),
                          Text(
                            '空位: ${list[index].vacancies}',
                            style: const TextStyle(fontSize: 13),
                          ),
                          Text(
                            '${list[index].distance} 公尺',
                            style: const TextStyle(fontSize: 13),
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.white54,
                        width: double.infinity,
                        height: 1,
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        )
      ],
    );
  }

  Widget getTypeUi(int typeIndex) {
    switch (typeUi) {
      case TypeUi.bike:
        return bikeUi(typeIndex);
      case TypeUi.bus:
        return busUi(typeIndex);
      case TypeUi.mrt:
        return mrtUi(typeIndex);
      case TypeUi.train:
        return trainUi(typeIndex);
      default:
        return Container();
    }
  }
}

class BikeStation {
  String stationName;
  int vehicles;
  int vacancies;
  int distance;

  BikeStation(this.stationName, this.vehicles, this.vacancies, this.distance);
}

class BusStation {
  String stationName;
  int distance;
  String stationHint1;
  String stationHint2;
  List bus1;
  List bus2;

  BusStation(this.stationName, this.distance, this.stationHint1,
      this.stationHint2, this.bus1, this.bus2);
}

class Bus {
  String busNumber;
  int remain;

  Bus(this.busNumber, this.remain);
}

class MrtStation {
  String stationName;
  String stationColor;
  int distance;
  String destination1;
  String destination2;
  int remain1;
  int remain2;

  MrtStation(this.stationName, this.stationColor, this.distance,
      this.destination1, this.destination2, this.remain1, this.remain2);
}

enum TypeUi { bike, bus, mrt, train, hsr }
