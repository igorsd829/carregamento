import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DataTrucksAdm extends StatefulWidget {
  const DataTrucksAdm({super.key});

  @override
  State<DataTrucksAdm> createState() => _DataTrucksAdmState();
}

class _DataTrucksAdmState extends State<DataTrucksAdm> {
  // void initState() {
  //   super.initState();
  //   Provider.of<Users>(context, listen: false).loadTrucks();
  // }

  bool one = false;
  bool two = false;
  bool three = false;
  bool showNumbers = false;

  Color active = Colors.grey;
  Color disable = Colors.grey.shade200;
  bool adm = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Users>(context, listen: false).loadAllTrucks();
    Provider.of<Users>(context, listen: false).loadExpedition();
  }

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    double textScale = MediaQuery.of(context).textScaler.scale(1);
    bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;
    var larguraDaTela = MediaQuery.of(context).size.width;
    var alturaDaTela = MediaQuery.of(context).size.height;
    double widthScreen = MediaQuery.of(context).size.width;
    bool isLandScape = MediaQuery.of(context).size.width > 900;

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

    return SelectionArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey.shade100,
          title: Row(
            children: [
              SizedBox(
                height: isPortraitPhoneSize ? 18 : 35,
                child: Image.asset(
                  'assets/images/supercal_login.png',
                  fit: BoxFit.contain,
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 15,
                        foregroundColor: Colors.black54,
                        shape: const LinearBorder(),
                        backgroundColor: Colors.grey.shade200,
                      ),
                      child: Text(
                        'TOTAL: ${users.countTrucksLoaded}º',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: widthScreen * 0.20,
                    child: Image.asset(
                      'assets/images/supercal_login.png',

                      fit: BoxFit.contain,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            isLandScape
                ? Padding(
                    padding: const EdgeInsets.all(20),
                    child: ListView(
                      children: trucksLoaded.map((e) {
                        int index = trucksLoaded.indexOf(e);
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.black),
                          ),
                          height: 20,
                          width: larguraCard,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 21,
                                  width: 42,
                                  decoration: BoxDecoration(
                                    border: Border.symmetric(
                                      vertical: BorderSide(
                                        width: 1,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(2),
                                    child: Text(
                                      '${index + 1}º',
                                      style: TextStyle(
                                        fontSize: textScale * 8,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  'PLACA: ${e.plate.substring(0, 3).toUpperCase()}-${e.plate.substring(3, 7).toUpperCase()}',
                                  style: TextStyle(
                                    fontSize: textScale * 8,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                e.name.length > 24
                                    ? Text(
                                        'MOTORISTA: ${e.name.substring(0, 24).toUpperCase()}...',
                                        style: TextStyle(
                                          fontSize: textScale * 8,
                                          color: Colors.black87,
                                        ),
                                      )
                                    : Text(
                                        'MOTORISTA: ${e.name.toUpperCase()}',
                                        style: TextStyle(
                                          fontSize: textScale * 8,
                                          color: Colors.black87,
                                        ),
                                      ),
                                const SizedBox(width: 2),
                                e.client.isNotEmpty
                                    ? Text(
                                        'CLIENTE: ${e.client.toUpperCase()}',
                                        style: TextStyle(
                                          fontSize: textScale * 8,
                                          color: Colors.black87,
                                        ),
                                      )
                                    : const SizedBox(),
                                const SizedBox(width: 2),
                                Text(
                                  // ignore: unnecessary_null_comparison
                                  'CHEGADA: ${DateFormat('dd/MM/y, HH:mm').format(e.date)}',
                                  style: TextStyle(
                                    fontSize: textScale * 8,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  // ignore: unnecessary_null_comparison
                                  e.enterTime == null
                                      ? ''
                                      : 'ENTRADA: ${DateFormat('dd/MM/y, HH:mm').format(e.enterTime!)}',
                                  style: TextStyle(
                                    fontSize: textScale * 8,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  // ignore: unnecessary_null_comparison
                                  e.outTime == null
                                      ? ''
                                      : 'SAÍDA: ${DateFormat('dd/MM/y, HH:mm').format(e.outTime!)}',
                                  style: TextStyle(
                                    fontSize: textScale * 8,
                                    color: Colors.black87,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );

                        // ContainerAnimatedCustomloaded(
                        //     isAdm: widget.isAdm,
                        //     index: index,
                        //     user: e,
                        //     cardHeight: alturaCard,
                        //     cardWidth: larguraCard);
                      }).toList(),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(4),
                    child: ListView(
                      children: trucksLoaded.map((e) {
                        int index = trucksLoaded.indexOf(e);
                        return Container(
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.black),
                          ),
                          height: alturaCard + 20,
                          width: larguraCard,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
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
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(width: 2),
                                    Text(
                                      'PLACA: ${e.plate.substring(0, 3).toUpperCase()}-${e.plate.substring(3, 7).toUpperCase()}',
                                      style: TextStyle(
                                        fontSize: textScale * 8,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    const SizedBox(width: 2),

                                    const SizedBox(width: 2),
                                    e.name.length > 24
                                        ? Text(
                                            'MOTORISTA: ${e.name.substring(0, 24).toUpperCase()}...',
                                            style: TextStyle(
                                              fontSize: textScale * 8,
                                              color: Colors.black87,
                                            ),
                                          )
                                        : Text(
                                            'MOTORISTA: ${e.name.toUpperCase()}',
                                            style: TextStyle(
                                              fontSize: textScale * 8,
                                              color: Colors.black87,
                                            ),
                                          ),
                                    const SizedBox(width: 2),
                                    e.client.isNotEmpty
                                        ? Text(
                                            'CLIENTE: ${e.client.toUpperCase()}',
                                            style: TextStyle(
                                              fontSize: textScale * 8,
                                              color: Colors.black87,
                                            ),
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
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      // ignore: unnecessary_null_comparison
                                      'CHEGADA: ${DateFormat('dd/MM/y, HH:mm').format(e.date)}',
                                      style: TextStyle(
                                        fontSize: textScale * 8,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      // ignore: unnecessary_null_comparison
                                      e.enterTime == null
                                          ? ''
                                          : 'ENTRADA: ${DateFormat('dd/MM/y, HH:mm').format(e.enterTime!)}',
                                      style: TextStyle(
                                        fontSize: textScale * 8,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Text(
                                      // ignore: unnecessary_null_comparison
                                      e.outTime == null
                                          ? ''
                                          : 'SAÍDA: ${DateFormat('dd/MM/y, HH:mm').format(e.outTime!)}',
                                      style: TextStyle(
                                        fontSize: textScale * 8,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
          ],
        ),
        floatingActionButton: ElevatedButton(
          onPressed: () {},
          child: Text('DOWNLOAD', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }
}
