import 'package:carregamento_conectado/components/container_animated_custom.dart';
import 'package:carregamento_conectado/components/phone/container_animated_custom_phone.dart';
import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueueOfTrucks extends StatefulWidget {
  final bool isAdm;
  final bool load;
  final int indexWindow;

  const QueueOfTrucks(
      {required this.isAdm,
      required this.load,
      required this.indexWindow,
      super.key});

  @override
  State<QueueOfTrucks> createState() => _QueueOfTrucksState();
}

var alturaAppBar = AppBar().preferredSize; // altura da Appbar

class _QueueOfTrucksState extends State<QueueOfTrucks> {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(
      context,
    );

    List<UserPlate> trucks = [];
    if (widget.indexWindow == 2) {
      users.listNew.forEach(
        (key, value) {
          trucks.add(value);
        },
      );
    } else if (widget.indexWindow == 1) {
      users.listTrucksLoading.forEach(
        (key, value) {
          trucks.add(value);
        },
      );
    } else {
      users.listNew.forEach(
        (key, value) {
          trucks.add(value);
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
    int coluns = 4;
    if (users.listNew.length <= 15) {
      coluns = 4;
    } else if (users.listNew.length >= 30 && users.listNew.length <= 45) {
      coluns = 4;
    } else if (users.listNew.length >= 45 && users.listNew.length <= 60) {
      coluns = 5;
    } else if (users.listNew.length >= 60 && users.listNew.length <= 75) {
      coluns = 6;
    } else if (users.listNew.length >= 75 && users.listNew.length <= 90) {
      coluns = 7;
    } else if (users.listNew.length >= 90 && users.listNew.length <= 105) {
      coluns = 8;
    } else if (users.listNew.length >= 105 && users.listNew.length <= 120) {
      coluns = 9;
    } else if (users.listNew.length > 120) {
      coluns = 11;
    }
    var larguraCard = larguraDaTela / coluns;

    // users.listNew.forEach(
    //   (key, value) {
    //     trucks.add(value);
    //   },
    // );

    return Scaffold(
        backgroundColor: Colors.transparent,
        body: isLandScape
            ? SingleChildScrollView(
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.horizontal,
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: Wrap(
                        direction: Axis.vertical,
                        spacing: 4,
                        runSpacing: 1,
                        children: trucks.map((e) {
                          int index = trucks.indexOf(e);
                          return ContainerAnimatedCustom(
                              load: widget.load,
                              isAdm: widget.isAdm,
                              index: index,
                              user: e,
                              cardHeight: alturaCard,
                              cardWidth: larguraCard);
                        }).toList())))
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
