import 'package:carregamento_conectado/components/container_animated_custom.dart';
import 'package:carregamento_conectado/components/phone/container_animated_custom_phone.dart';
import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueueOfTrucksScheduledPhone extends StatefulWidget {
  final bool isAdm;
  final bool load;

  const QueueOfTrucksScheduledPhone(
      {required this.isAdm, required this.load, super.key});

  @override
  State<QueueOfTrucksScheduledPhone> createState() =>
      _QueueOfTrucksScheduledPhoneState();
}

var alturaAppBar = AppBar().preferredSize; // altura da Appbar

class _QueueOfTrucksScheduledPhoneState
    extends State<QueueOfTrucksScheduledPhone> {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(
      context,
    );

    List<UserPlate> trucks = [];
    List<UserPlate> trucks1 = [];
    List<UserPlate> trucks2 = [];
    List<UserPlate> trucks3 = [];
    List<UserPlate> trucks4 = [];
    List<UserPlate> trucks5 = [];
    users.listNew.forEach(
      (key, value) {
        if (value.window == 0) {
          trucks.add(value);
        } else if (value.window == 1) {
          trucks1.add(value);
        } else if (value.window == 2) {
          trucks2.add(value);
        } else if (value.window == 3) {
          trucks3.add(value);
        } else if (value.window == 4) {
          trucks4.add(value);
        } else if (value.window == 5) {
          trucks5.add(value);
        }
      },
    );
    // users.addTrucksList(trucks);
    var larguraDaTela = MediaQuery.of(context).size.width;
    var alturaDaTela = MediaQuery.of(context).size.height;
    // var alturaDaTelaPhone = alturaDaTela < 200;

    bool isLandScape = MediaQuery.of(context).size.width > 900;
    // bool isLandscapePhone = MediaQuery.of(context).orientation == Orientation.landscape;
    // var alturaBarraStatus =
    //     MediaQuery.of(context).padding.top; // altura da barraStatus
    // List<Widget> listMap =
    // print('index: ${listMap.length}');
    var alturaCard = alturaDaTela / 17;
    int coluns = 6;
    // if (users.listNew.length <= 15) {
    //   coluns = 4;
    // } else if (users.listNew.length >= 30 && users.listNew.length <= 45) {
    //   coluns = 4;
    // } else if (users.listNew.length >= 45 && users.listNew.length <= 60) {
    //   coluns = 5;
    // } else if (users.listNew.length >= 60 && users.listNew.length <= 75) {
    //   coluns = 6;
    // } else if (users.listNew.length >= 75 && users.listNew.length <= 90) {
    //   coluns = 7;
    // } else if (users.listNew.length >= 90 && users.listNew.length <= 105) {
    //   coluns = 8;
    // } else if (users.listNew.length >= 105 && users.listNew.length <= 120) {
    //   coluns = 9;
    // } else if (users.listNew.length > 120) {
    //   coluns = 11;
    // }
    var larguraCard = larguraDaTela / coluns;

    // users.listNew.forEach(
    //   (key, value) {
    //     trucks.add(value);
    //   },
    // );

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: isLandScape
            ? Column(
                children: [
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: larguraCard - 4,
                        color: Colors.grey.shade600,
                        child: const Center(
                            child: Text(
                          '00:00 - 04:00',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        width: larguraCard,
                        height: alturaDaTela - (alturaCard + 50),
                        child: ListView(
                          children: trucks.map((e) {
                            int index = trucks.indexOf(e);
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                child: ContainerAnimatedCustom(
                                    load: widget.load,
                                    isAdm: widget.isAdm,
                                    index: index,
                                    user: e,
                                    cardHeight: alturaCard,
                                    cardWidth: larguraCard));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: larguraCard - 4,
                        color: Colors.grey.shade600,
                        child: const Center(
                            child: Text(
                          '04:00 - 08:00',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        width: larguraCard,
                        height: alturaDaTela - (alturaCard + 50),
                        child: ListView(
                          children: trucks1.map((e) {
                            int index = trucks1.indexOf(e);
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                child: ContainerAnimatedCustom(
                                    load: widget.load,
                                    isAdm: widget.isAdm,
                                    index: index,
                                    user: e,
                                    cardHeight: alturaCard,
                                    cardWidth: larguraCard));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: larguraCard - 4,
                        color: Colors.grey.shade600,
                        child: const Center(
                            child: Text(
                          '08:00 - 12:00',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        width: larguraCard,
                        height: alturaDaTela - (alturaCard + 50),
                        child: ListView(
                          children: trucks2.map((e) {
                            int index = trucks2.indexOf(e);
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                child: ContainerAnimatedCustom(
                                    load: widget.load,
                                    isAdm: widget.isAdm,
                                    index: index,
                                    user: e,
                                    cardHeight: alturaCard,
                                    cardWidth: larguraCard));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: larguraCard - 4,
                        color: Colors.grey.shade600,
                        child: const Center(
                            child: Text(
                          '12:00 - 16:00',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        width: larguraCard,
                        height: alturaDaTela - (alturaCard + 50),
                        child: ListView(
                          children: trucks3.map((e) {
                            int index = trucks3.indexOf(e);
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                child: ContainerAnimatedCustom(
                                    load: widget.load,
                                    isAdm: widget.isAdm,
                                    index: index,
                                    user: e,
                                    cardHeight: alturaCard,
                                    cardWidth: larguraCard));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: larguraCard - 4,
                        color: Colors.grey.shade600,
                        child: const Center(
                            child: Text(
                          '16:00 - 20:00',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        width: larguraCard,
                        height: alturaDaTela - (alturaCard + 50),
                        child: ListView(
                          children: trucks4.map((e) {
                            int index = trucks4.indexOf(e);
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                child: ContainerAnimatedCustom(
                                    load: widget.load,
                                    isAdm: widget.isAdm,
                                    index: index,
                                    user: e,
                                    cardHeight: alturaCard,
                                    cardWidth: larguraCard));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        height: 30,
                        width: larguraCard - 4,
                        color: Colors.grey.shade600,
                        child: const Center(
                            child: Text(
                          '20:00 - 23:59',
                          style: TextStyle(color: Colors.white),
                        )),
                      ),
                      Container(
                        color: Colors.grey.withOpacity(0.1),
                        width: larguraCard,
                        height: alturaDaTela - (alturaCard + 50),
                        child: ListView(
                          children: trucks5.map((e) {
                            int index = trucks5.indexOf(e);
                            return Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 4),
                                child: ContainerAnimatedCustom(
                                    load: widget.load,
                                    isAdm: widget.isAdm,
                                    index: index,
                                    user: e,
                                    cardHeight: alturaCard,
                                    cardWidth: larguraCard));
                          }).toList(),
                        ),
                      ),
                    ],
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: Container(
                  //     color: Colors.white,
                  //     width: larguraCard,
                  //     height: alturaDaTela,
                  //     child: ListView(
                  //       children: trucks.map((e) {
                  //         int index = trucks.indexOf(e);
                  //         return Padding(
                  //           padding: const EdgeInsets.symmetric(vertical: 2),
                  //           child: ContainerAnimatedCustomPhone(
                  //               load: widget.load,
                  //               isAdm: widget.isAdm,
                  //               index: index,
                  //               user: e,
                  //               cardHeight: alturaCard,
                  //               cardWidth: larguraCard),
                  //         );
                  //       }).toList(),
                  //     ),
                  //   ),
                  // ),
                ],
              )
            : Padding(
                padding: const EdgeInsets.all(4),
                child: ListView(
                  children: trucks.map((e) {
                    int index = trucks.indexOf(e);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: ContainerAnimatedCustomPhone(
                          load: widget.load,
                          isAdm: widget.isAdm,
                          index: index,
                          user: e,
                          cardHeight: 50,
                          cardWidth: 300),
                    );
                  }).toList(),
                ),
              ));
  }
}
