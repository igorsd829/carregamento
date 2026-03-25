import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class QueueOfTrucksLoaded extends StatefulWidget {
  final bool isAdm;

  const QueueOfTrucksLoaded({required this.isAdm, super.key});

  @override
  State<QueueOfTrucksLoaded> createState() => _QueueOfTrucksLoadedState();
}

var alturaAppBar = AppBar().preferredSize; // altura da Appbar

class _QueueOfTrucksLoadedState extends State<QueueOfTrucksLoaded> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   Provider.of<Users>(context, listen: false).loadAllTrucks();
  //   // Provider.of<Users>(context, listen: false).loadAllTrucksLoaded();
  // }

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(
      context,
    );
    double textScale = MediaQuery.of(context).textScaler.scale(1);
    bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;
    var larguraDaTela = MediaQuery.of(context).size.width;
    var alturaDaTela = MediaQuery.of(context).size.height;

    bool isLandScape = MediaQuery.of(context).size.width > 900;
    bool isLitlle = MediaQuery.of(context).size.width > 100;

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
    users.listTrucksLoaded.forEach(
      (key, value) {
        trucksLoaded.add(value);
      },
    );

    return SelectionArea(
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey.shade400,
            title: SingleChildScrollView(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                  height: isPortraitPhoneSize ? 25 : 40,
                  child: Image.network(
                    'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/logo.png?alt=media&token=2688f229-9396-4ca2-bbb8-8a346e066a10',
                    fit: BoxFit.contain,
                  )),
              SizedBox(
                  height: isPortraitPhoneSize ? 15 : 30,
                  child: Image.network(
                      'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/supercal.png?alt=media&token=477281d7-558d-4206-b6d6-cbe46de6d018',
                      fit: BoxFit.contain)),
              const Expanded(
                child: SizedBox(),
              ),
              isLitlle
                  ? Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                DateFormat('dd/MM/y').format(
                                  DateTime.now(),
                                ),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isPortraitPhoneSize
                                        ? textScale * 8
                                        : textScale * 9,
                                    color: Colors.black54),
                              ),
                              Text(
                                DateFormat('HH:mm').format(
                                  DateTime.now(),
                                ),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: isPortraitPhoneSize
                                        ? textScale * 8
                                        : textScale * 9,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 1),
                          child: ElevatedButton(
                              onPressed: () {
                                Provider.of<Users>(context, listen: false)
                                    .loadAllTrucks();
                              },
                              style: ElevatedButton.styleFrom(
                                  padding: const EdgeInsets.all(1),
                                  foregroundColor: Colors.black54,
                                  shape: const RoundedRectangleBorder(),
                                  backgroundColor: Colors.grey.shade200),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'TOTAL DO TURNO: ${users.countTrucksLoaded}º',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize:
                                              isPortraitPhoneSize ? 8 : 12),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        // IconButton(
                        //     padding: EdgeInsets.all(1),
                        //     onPressed: () {
                        //       // logado
                        //       //     ? Navigator.of(
                        //       //         context,
                        //       //       ).pushNamed(AppRoutes.data_truks_adm)
                        //       //     : Navigator.of(
                        //       //         context,
                        //       //       ).pushNamed(AppRoutes.data_truks);
                        //     },
                        //     icon: Icon(
                        //       Icons.insert_chart_outlined_sharp,
                        //       size: 25,
                        //       color: Colors.grey.shade300,
                        //     ))
                      ],
                    )
                  : const SizedBox()
            ]))),
        // backgroundColor: Colors.transparent,
        body: isLandScape
            ? Padding(
                padding: const EdgeInsets.all(20),
                child: ListView(
                    children: trucksLoaded.map((e) {
                  int index = trucksLoaded.indexOf(e);
                  return Container(
                      // color: Colors.transparent,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Colors.grey.shade300)),
                      height: 20,
                      width: larguraCard,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 21,
                              width: 42,
                              decoration: BoxDecoration(
                                  border: Border.symmetric(
                                      vertical: BorderSide(
                                          width: 1,
                                          color: Colors.grey.shade300))),
                              child: Padding(
                                padding: const EdgeInsets.all(2),
                                child: Text(
                                  '${index + 1}º',
                                  style: TextStyle(
                                      fontSize: textScale * 8,
                                      color: Colors.black87),
                                ),
                              ),
                            ),
                            // const SizedBox(
                            //   width: 2,
                            // ),
                            // Container(
                            //   height: 20,
                            //   width: 1,
                            //   color: Colors.grey.shade300,
                            // ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              'PLACA: ${e.plate.substring(0, 3).toUpperCase()}-${e.plate.substring(3, 7).toUpperCase()}',
                              style: TextStyle(
                                  fontSize: textScale * 8,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            e.name.length > 24
                                ? Text(
                                    'MOTORISTA: ${e.name.substring(0, 24).toUpperCase()}...',
                                    style: TextStyle(
                                        fontSize: textScale * 8,
                                        color: Colors.black87),
                                  )
                                : Text(
                                    'MOTORISTA: ${e.name.toUpperCase()}',
                                    style: TextStyle(
                                        fontSize: textScale * 8,
                                        color: Colors.black87),
                                  ),
                            const SizedBox(
                              width: 2,
                            ),
                            e.client.isNotEmpty
                                ? Text(
                                    'CLIENTE: ${e.client.toUpperCase()}',
                                    style: TextStyle(
                                        fontSize: textScale * 8,
                                        color: Colors.black87),
                                  )
                                : const SizedBox(),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              // ignore: unnecessary_null_comparison
                              'CHEGADA: ${DateFormat('dd/MM/y, HH:mm').format(
                                      e.date,
                                    )}',
                              style: TextStyle(
                                  fontSize: textScale * 8,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              // ignore: unnecessary_null_comparison
                              e.enterTime == null
                                  ? ''
                                  : 'ENTRADA: ${DateFormat('dd/MM/y, HH:mm').format(
                                      e.enterTime!,
                                    )}',
                              style: TextStyle(
                                  fontSize: textScale * 8,
                                  color: Colors.black87),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            Text(
                              // ignore: unnecessary_null_comparison
                              e.outTime == null
                                  ? ''
                                  : 'SAÍDA: ${DateFormat('dd/MM/y, HH:mm').format(
                                      e.outTime!,
                                    )}',
                              style: TextStyle(
                                fontSize: textScale * 8,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'PESO: ${e.weight.toUpperCase()} kg',
                              style: TextStyle(
                                  fontSize: textScale * 8,
                                  color: Colors.black87),
                            ),
                            const Expanded(child: SizedBox()),
                            Text(
                              '${index + 1}/${users.countTrucksLoaded}',
                              style: TextStyle(
                                fontSize: textScale * 8,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ));

                  // ContainerAnimatedCustomloaded(
                  //     isAdm: widget.isAdm,
                  //     index: index,
                  //     user: e,
                  //     cardHeight: alturaCard,
                  //     cardWidth: larguraCard);
                }).toList()),
              )
            : Padding(
                padding: const EdgeInsets.all(4),
                child: ListView(
                    children: trucksLoaded.map((e) {
                  int index = trucksLoaded.indexOf(e);
                  return Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: Colors.grey.shade300)),
                      height: alturaCard + 20,
                      width: larguraCard,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              // ? Text(
                              //     '${widget.user.name.substring(0, 15).toUpperCase()}...',
                              //     style: TextStyle(fontSize: textScale * 14))
                              // : Text('${widget.user.name.toUpperCase()}...',
                              //
                              //    style: TextStyle(fontSize: textScale * 14)),
                              Text(
                                '${index + 1}º',
                                style: TextStyle(
                                    fontSize: textScale * 8,
                                    color: Colors.black87),
                              ),
                              const SizedBox(
                                width: 2,
                              ),
                              Text(
                                'PLACA: ${e.plate.substring(0, 3).toUpperCase()}-${e.plate.substring(3, 7).toUpperCase()}',
                                style: TextStyle(
                                    fontSize: textScale * 8,
                                    color: Colors.black87),
                              ),
                              const SizedBox(
                                width: 2,
                              ),

                              const SizedBox(
                                width: 2,
                              ),
                              e.name.length > 24
                                  ? Text(
                                      'MOTORISTA: ${e.name.substring(0, 24).toUpperCase()}...',
                                      style: TextStyle(
                                          fontSize: textScale * 8,
                                          color: Colors.black87),
                                    )
                                  : Text(
                                      'MOTORISTA: ${e.name.toUpperCase()}',
                                      style: TextStyle(
                                          fontSize: textScale * 8,
                                          color: Colors.black87),
                                    ),
                              const SizedBox(
                                width: 2,
                              ),
                              e.client.isNotEmpty
                                  ? Text(
                                      'CLIENTE: ${e.client.toUpperCase()}',
                                      style: TextStyle(
                                          fontSize: textScale * 8,
                                          color: Colors.black87),
                                    )
                                  : const SizedBox(),
                              const Expanded(child: SizedBox()),
                              Text(
                                '${index + 1}/${users.countTrucksLoaded}',
                                style: TextStyle(
                                  fontSize: textScale * 8,
                                  color: Colors.black87,
                                ),
                              ),
                            ]),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  // ignore: unnecessary_null_comparison
                                  'CHEGADA: ${DateFormat('dd/MM/y, HH:mm').format(
                                          e.date,
                                        )}',
                                  style: TextStyle(
                                      fontSize: textScale * 8,
                                      color: Colors.black87),
                                ),
                                Text(
                                  // ignore: unnecessary_null_comparison
                                  e.enterTime == null
                                      ? ''
                                      : 'ENTRADA: ${DateFormat('dd/MM/y, HH:mm').format(
                                          e.enterTime!,
                                        )}',
                                  style: TextStyle(
                                      fontSize: textScale * 8,
                                      color: Colors.black87),
                                ),
                                Text(
                                  // ignore: unnecessary_null_comparison
                                  e.outTime == null
                                      ? ''
                                      : 'SAÍDA: ${DateFormat('dd/MM/y, HH:mm').format(
                                          e.outTime!,
                                        )}',
                                  style: TextStyle(
                                    fontSize: textScale * 8,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(
                                  width: 2,
                                ),
                                Text(
                                  'PESO: ${e.weight.toUpperCase()} kg',
                                  style: TextStyle(
                                      fontSize: textScale * 8,
                                      color: Colors.black87),
                                ),
                              ],
                            )
                          ],
                        ),
                      ));

                  // ContainerAnimatedCustomloaded(
                  //     isAdm: widget.isAdm,
                  //     index: index,
                  //     user: e,
                  //     cardHeight: alturaCard,
                  //     cardWidth: larguraCard);
                }).toList()),
              ),
      ),
    );
  }
}
