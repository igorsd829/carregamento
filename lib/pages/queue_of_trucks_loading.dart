import 'package:carregamento_conectado/components/container_animated_custom_loading.dart';
import 'package:carregamento_conectado/components/phone/container_animated_custom_phone_loading.dart';
import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class QueueOfTrucksLoading extends StatefulWidget {
  final bool isAdm;
  final bool load;

  const QueueOfTrucksLoading(
      {required this.isAdm, required this.load, super.key});

  @override
  State<QueueOfTrucksLoading> createState() => _QueueOfTrucksLoadingState();
}

var alturaAppBar = AppBar().preferredSize; // altura da Appbar

class _QueueOfTrucksLoadingState extends State<QueueOfTrucksLoading> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer.periodic(const Duration(seconds: 10), (Timer) {
  //     Provider.of<Users>(context, listen: false).listTrucksLoading = {};
  //     Provider.of<Users>(context, listen: false).loadTrucksLoading();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    List<UserPlate> trucksLoading = [];
    // List<User> carritosFilter =
    //     carritos.where((element) => element.loading).toList();

    users.listTrucksLoading.forEach(
      (key, value) {
        trucksLoading.add(value);
      },
    );
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
    if (users.listTrucksLoading.length <= 15) {
      coluns = 4;
    } else if (users.listTrucksLoading.length >= 30 &&
        users.listTrucksLoading.length <= 45) {
      coluns = 4;
    } else if (users.listTrucksLoading.length >= 45 &&
        users.listTrucksLoading.length <= 60) {
      coluns = 5;
    } else if (users.listTrucksLoading.length >= 60 &&
        users.listTrucksLoading.length <= 75) {
      coluns = 6;
    } else if (users.listTrucksLoading.length >= 75 &&
        users.listTrucksLoading.length <= 90) {
      coluns = 7;
    } else if (users.listTrucksLoading.length >= 90 &&
        users.listTrucksLoading.length <= 105) {
      coluns = 8;
    } else if (users.listTrucksLoading.length >= 105 &&
        users.listTrucksLoading.length <= 120) {
      coluns = 9;
    } else if (users.listTrucksLoading.length > 120) {
      coluns = 11;
    }
    var larguraCard = larguraDaTela / coluns;

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
                      children: trucksLoading.map((e) {
                        int index = trucksLoading.indexOf(e);
                        return ContainerAnimatedCustomloading(
                            load: widget.load,
                            isAdm: widget.isAdm,
                            index: index,
                            user: e,
                            cardHeight: alturaCard,
                            cardWidth: larguraCard);
                      }).toList()),
                ))
            : Padding(
                padding: const EdgeInsets.all(4),
                child: ListView(
                  children: trucksLoading.map((e) {
                    int index = trucksLoading.indexOf(e);
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 2),
                      child: ContainerAnimatedCustomPhoneLoading(
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
              ));
  }
}
