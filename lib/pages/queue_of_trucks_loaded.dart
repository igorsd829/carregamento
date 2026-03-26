import 'package:carregamento_conectado/components/container_animated_custom_loaded.dart';
import 'package:carregamento_conectado/components/phone/container_animated_custom_phone_loaded.dart';
import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueueOfTrucksLoaded extends StatefulWidget {
  final bool isAdm;
  final bool load;

  const QueueOfTrucksLoaded({
    required this.isAdm,
    required this.load,
    super.key,
  });

  @override
  State<QueueOfTrucksLoaded> createState() => _QueueOfTrucksLoadedState();
}

var alturaAppBar = AppBar().preferredSize; // altura da Appbar

class _QueueOfTrucksLoadedState extends State<QueueOfTrucksLoaded> {
  // @override
  // void initState() {
  //   super.initState();
  //   // Timer.periodic(const Duration(seconds: 10), (Timer) {
  //   //   Provider.of<Users>(context, listen: false).listTrucksLoaded = {};
  //   //   Provider.of<Users>(context, listen: false).loadTrucksLoaded();
  //   // });
  // }

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    var larguraDaTela = MediaQuery.of(context).size.width;
    var alturaDaTela = MediaQuery.of(context).size.height;
    // var alturaDaTelaPhone = alturaDaTela < 200;

    bool isLandScape = MediaQuery.of(context).size.width > 900;
    // bool isLandscapePhone = MediaQuery.of(context).orientation == Orientation.landscape;
    // var alturaBarraStatus =
    //     MediaQuery.of(context).padding.top; // altura da barraStatus
    // List<Widget> listMap =
    // print('index: ${listMap.length}');
    var alturaCard = alturaDaTela / 16;
    int coluns = 4;
    if (users.listTrucksLoaded.length <= 15) {
      coluns = 4;
    } else if (users.listTrucksLoaded.length >= 30 &&
        users.listTrucksLoaded.length <= 45) {
      coluns = 4;
    } else if (users.listTrucksLoaded.length >= 45 &&
        users.listTrucksLoaded.length <= 60) {
      coluns = 5;
    } else if (users.listTrucksLoaded.length >= 60 &&
        users.listTrucksLoaded.length <= 75) {
      coluns = 6;
    } else if (users.listTrucksLoaded.length >= 75 &&
        users.listTrucksLoaded.length <= 90) {
      coluns = 7;
    } else if (users.listTrucksLoaded.length >= 90 &&
        users.listTrucksLoaded.length <= 105) {
      coluns = 8;
    } else if (users.listTrucksLoaded.length >= 105 &&
        users.listTrucksLoaded.length <= 120) {
      coluns = 9;
    } else if (users.listTrucksLoaded.length > 120) {
      coluns = 11;
    }
    var larguraCard = larguraDaTela / coluns;
    List<UserPlate> trucksLoaded = [];
    users.listTrucksLoaded.forEach((key, value) {
      trucksLoaded.add(value);
    });

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
                  spacing: 2,
                  runSpacing: 1,
                  children: trucksLoaded.map((e) {
                    int index = trucksLoaded.indexOf(e);
                    return ContainerAnimatedCustomloaded(
                      isAdm: widget.isAdm,
                      load: widget.load,
                      index: index,
                      user: e,
                      cardHeight: alturaCard,
                      cardWidth: larguraCard,
                    );
                  }).toList(),
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(4),
              child: ListView(
                children: trucksLoaded.map((e) {
                  int index = trucksLoaded.indexOf(e);
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: ContainerAnimatedCustomPhoneLoaded(
                      load: widget.load,
                      isAdm: widget.isAdm,
                      index: index,
                      user: e,
                      cardHeight: 50,
                      cardWidth: 300,
                    ),
                  );
                }).toList(),
              ),
            ),
    );
  }
}
