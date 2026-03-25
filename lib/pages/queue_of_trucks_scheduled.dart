import 'package:carregamento_conectado/components/container_animated_custom.dart';
import 'package:carregamento_conectado/components/phone/container_animated_custom_phone_window.dart';
import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueueOfTrucksScheduled extends StatefulWidget {
  final bool isAdm;
  final bool load;
  final int indexWindow;

  const QueueOfTrucksScheduled(
      {required this.isAdm,
      required this.load,
      required this.indexWindow,
      super.key});

  @override
  State<QueueOfTrucksScheduled> createState() => _QueueOfTrucksScheduledState();
}

var alturaAppBar = AppBar().preferredSize; // altura da Appbar

class _QueueOfTrucksScheduledState extends State<QueueOfTrucksScheduled> {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(
      context,
    );
    final ScrollController _firstController = ScrollController();
    // final ScrollbarOrientation? scrollbarOrientation =
    //     ScrollbarOrientation.right;DragStartBehavior dragStartBehavior = DragStartBehavior.start
    Map<String, UserPlate> listNewAll = {};
    final DragStartBehavior dragStartBehavior = DragStartBehavior.down;
    var colorColumnWindow = Colors.grey.shade600;

    List<UserPlate> trucks = [];
    List<UserPlate> trucks1 = [];
    List<UserPlate> trucks2 = [];
    List<UserPlate> trucks3 = [];
    List<UserPlate> trucks4 = [];
    List<UserPlate> trucks5 = [];

    // int lengthListApi = users.listNew.length;
    if (widget.indexWindow == 2) {
      listNewAll = {};
      trucks = [];
      trucks1 = [];
      trucks2 = [];
      trucks3 = [];
      trucks4 = [];
      trucks5 = [];

      colorColumnWindow = Colors.orange;
      listNewAll = users.listNewThree;
      listNewAll.forEach(
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
    } else if (widget.indexWindow == 1) {
      listNewAll = {};
      trucks = [];
      trucks1 = [];
      trucks2 = [];
      trucks3 = [];
      trucks4 = [];
      trucks5 = [];
      colorColumnWindow = Colors.indigo;
      listNewAll = users.listNewTwo;
      listNewAll.forEach((key, value) {
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
      });
    } else {
      colorColumnWindow = Colors.grey.shade600;
      listNewAll = {};
      trucks = [];
      trucks1 = [];
      trucks2 = [];
      trucks3 = [];
      trucks4 = [];
      trucks5 = [];
      listNewAll = users.listNew;
      listNewAll.forEach(
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
    }

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
            ? Row(
                children: [
                  trucks.isNotEmpty
                      ? Column(
                          children: [
                            Container(
                              height: 30,
                              width: larguraCard - 4,
                              color: colorColumnWindow,
                              child: const Center(
                                  child: Text(
                                '00:00 - 04:00',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              color: Colors.transparent,
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
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 10,
                                color: colorColumnWindow,
                                child: const Center(
                                    child: Text(
                                  '',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ],
                          ),
                        ),
                  trucks1.isNotEmpty
                      ? Column(
                          children: [
                            Container(
                              height: 30,
                              width: larguraCard - 4,
                              color: colorColumnWindow,
                              child: const Center(
                                  child: Text(
                                '04:00 - 08:00',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              color: Colors.transparent,
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
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 10,
                                color: colorColumnWindow,
                                child: const Center(
                                    child: Text(
                                  '',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ],
                          ),
                        ),
                  trucks2.isNotEmpty
                      ? Column(
                          children: [
                            Container(
                              height: 30,
                              width: larguraCard - 4,
                              color: colorColumnWindow,
                              child: const Center(
                                  child: Text(
                                '08:00 - 12:00',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              color: Colors.transparent,
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
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 10,
                                color: colorColumnWindow,
                                child: const Center(
                                    child: Text(
                                  '',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ],
                          ),
                        ),
                  trucks3.isNotEmpty
                      ? Column(
                          children: [
                            Container(
                              height: 30,
                              width: larguraCard - 4,
                              color: colorColumnWindow,
                              child: const Center(
                                  child: Text(
                                '12:00 - 16:00',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              color: Colors.transparent,
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
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 10,
                                color: colorColumnWindow,
                                child: const Center(
                                    child: Text(
                                  '',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ],
                          ),
                        ),
                  trucks4.isNotEmpty
                      ? Column(
                          children: [
                            Container(
                              height: 30,
                              width: larguraCard - 4,
                              color: colorColumnWindow,
                              child: const Center(
                                  child: Text(
                                '16:00 - 20:00',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              color: Colors.transparent,
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
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 10,
                                color: colorColumnWindow,
                                child: const Center(
                                    child: Text(
                                  '',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ],
                          ),
                        ),
                  trucks5.isNotEmpty
                      ? Column(
                          children: [
                            Container(
                              height: 30,
                              width: larguraCard - 4,
                              color: colorColumnWindow,
                              child: const Center(
                                  child: Text(
                                '20:00 - 23:59',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            Container(
                              color: Colors.transparent,
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
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: 30,
                                width: 10,
                                color: colorColumnWindow,
                                child: const Center(
                                    child: Text(
                                  '',
                                  style: TextStyle(color: Colors.white),
                                )),
                              ),
                            ],
                          ),
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
            /////////////////////////////////////////// PHONE ////////////////////////////////////////
            : SingleChildScrollView(
                dragStartBehavior: dragStartBehavior,
                controller: _firstController,

                // padding: const EdgeInsets.only(top: 4, right: 30),
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Column(
                    children: [
                      trucks.length > 0
                          ? Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: colorColumnWindow,
                                  child: const Center(
                                      child: Text(
                                    '00:00 - 04:00',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    height: trucks.length * 60,
                                    child: ListView(
                                      physics:
                                          NeverScrollableScrollPhysics(), /////////
                                      children: trucks.map((e) {
                                        int index = trucks.indexOf(e);
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 4),
                                            child:
                                                ContainerAnimatedCustomPhoneWindow(
                                                    load: widget.load,
                                                    isAdm: widget.isAdm,
                                                    index: index,
                                                    user: e,
                                                    cardHeight: 50,
                                                    cardWidth: larguraCard));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      trucks1.length > 0
                          ? Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: colorColumnWindow,
                                  child: const Center(
                                      child: Text(
                                    '04:00 - 08:00',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    height: trucks1.length * 60,
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: trucks1.map((e) {
                                        int index = trucks1.indexOf(e);
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 4),
                                            child:
                                                ContainerAnimatedCustomPhoneWindow(
                                                    load: widget.load,
                                                    isAdm: widget.isAdm,
                                                    index: index,
                                                    user: e,
                                                    cardHeight: 50,
                                                    cardWidth: larguraCard));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      trucks2.length > 0
                          ? Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: colorColumnWindow,
                                  child: const Center(
                                      child: Text(
                                    '08:00 - 12:00',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    height: trucks2.length * 60,
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: trucks2.map((e) {
                                        int index = trucks2.indexOf(e);
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 4),
                                            child:
                                                ContainerAnimatedCustomPhoneWindow(
                                                    load: widget.load,
                                                    isAdm: widget.isAdm,
                                                    index: index,
                                                    user: e,
                                                    cardHeight: 50,
                                                    cardWidth: larguraCard));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      trucks3.length > 0
                          ? Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: colorColumnWindow,
                                  child: const Center(
                                      child: Text(
                                    '12:00 - 16:00',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    height: trucks3.length * 60,
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: trucks3.map((e) {
                                        int index = trucks3.indexOf(e);
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 4),
                                            child:
                                                ContainerAnimatedCustomPhoneWindow(
                                                    load: widget.load,
                                                    isAdm: widget.isAdm,
                                                    index: index,
                                                    user: e,
                                                    cardHeight: 50,
                                                    cardWidth: larguraCard));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      trucks4.length > 0
                          ? Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: colorColumnWindow,
                                  child: const Center(
                                      child: Text(
                                    '16:00 - 20:00',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    height: trucks4.length * 60,
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: trucks4.map((e) {
                                        int index = trucks4.indexOf(e);
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 4),
                                            child:
                                                ContainerAnimatedCustomPhoneWindow(
                                                    load: widget.load,
                                                    isAdm: widget.isAdm,
                                                    index: index,
                                                    user: e,
                                                    cardHeight: 50,
                                                    cardWidth: larguraCard));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      trucks5.length > 0
                          ? Column(
                              children: [
                                Container(
                                  height: 50,
                                  width: double.infinity,
                                  color: colorColumnWindow,
                                  child: const Center(
                                      child: Text(
                                    '20:00 - 23:59',
                                    style: TextStyle(color: Colors.white),
                                  )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0),
                                  child: Container(
                                    color: Colors.transparent,
                                    width: double.infinity,
                                    height: trucks5.length * 60,
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      children: trucks5.map((e) {
                                        int index = trucks5.indexOf(e);
                                        return Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 4),
                                            child:
                                                ContainerAnimatedCustomPhoneWindow(
                                                    load: widget.load,
                                                    isAdm: widget.isAdm,
                                                    index: index,
                                                    user: e,
                                                    cardHeight: 50,
                                                    cardWidth: larguraCard));
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ));
  }
}
