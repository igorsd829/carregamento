import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/components/add_expedition.dart';
import 'package:carregamento_conectado/components/add_warnig_card.dart';
import 'package:carregamento_conectado/components/add_warnig_card_ads_url.dart';

import 'package:carregamento_conectado/utils/app_routs.dart';
// import 'package:carregamento_conectado/utils/app_routs.dart';
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
    Provider.of<Users>(context, listen: false).loadStatus();
    Provider.of<Users>(context, listen: false).loadExpedition();
  }

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaler.scale(1);
    bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;

    final Users users = Provider.of(
      context,
    );

    // double textScale = MediaQuery.of(context).textScaler.scale(1);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
        ),
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      height: isPortraitPhoneSize ? 85 : 100,
                      child: Image.network(
                          'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/SUPERCAL-1.png?alt=media&token=1ac53204-6297-436e-a762-950e30fa5873',
                          fit: BoxFit.contain)),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          one
                              ? Text(
                                  'BOM DIA',
                                  style: TextStyle(
                                    fontSize: isPortraitPhoneSize ? 20 : 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const SizedBox(),
                          two
                              ? Text(
                                  'BOA TARDE',
                                  style: TextStyle(
                                    fontSize: isPortraitPhoneSize ? 20 : 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const SizedBox(),
                          three
                              ? Text(
                                  'BOA NOITE',
                                  style: TextStyle(
                                    fontSize: isPortraitPhoneSize ? 20 : 23,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'CAMINHÕES NA FILA: ${users.countTrucksOne+users.countTrucksTwo+users.countTrucksThree}\nCAMINHÕES CARREGADOS: ${users.countTrucksLoaded}\nDATA: ${DateFormat('dd/MM/y, HH:mm').format(
                        DateTime.now(),
                      )}h',
                      style: TextStyle(
                        fontSize: isPortraitPhoneSize ? 20 : 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Center(
                            child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'CARREGAMENTO: ',
                              style: TextStyle(
                                fontSize: isPortraitPhoneSize ? 20 : 23,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            users.statusOpen
                                ? Stack(
                                    children: <Widget>[
                                      // Stroked text as border.

                                      Text(
                                        users.status.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: isPortraitPhoneSize
                                                ? textScale * 20
                                                : textScale * 23,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 0.2
                                              ..color = Colors.black),
                                      ),
                                      // Solid text as fill.
                                      Text(
                                        users.status.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: isPortraitPhoneSize
                                              ? textScale * 20
                                              : textScale * 23,
                                          color: Colors.greenAccent.shade400,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            users.statusStoped
                                ? Stack(
                                    children: <Widget>[
                                      // Stroked text as border.

                                      Text(
                                        users.status.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: isPortraitPhoneSize
                                                ? textScale * 20
                                                : textScale * 23,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 0.2
                                              ..color = Colors.black),
                                      ),
                                      // Solid text as fill.
                                      Text(
                                        users.status.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: textScale * 23,
                                          color: Colors.yellow,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                            users.statusClosed
                                ? Stack(
                                    children: <Widget>[
                                      // Stroked text as border.

                                      Text(
                                        users.status.toUpperCase(),
                                        style: TextStyle(
                                            fontSize: isPortraitPhoneSize
                                                ? textScale * 20
                                                : textScale * 23,
                                            foreground: Paint()
                                              ..style = PaintingStyle.stroke
                                              ..strokeWidth = 0.2
                                              ..color = Colors.black),
                                      ),
                                      // Solid text as fill.
                                      Text(
                                        users.status.toUpperCase(),
                                        style: TextStyle(
                                          fontSize: isPortraitPhoneSize
                                              ? textScale * 20
                                              : textScale * 23,
                                          color: Colors.redAccent,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ],
                        )),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'TURNO: ',
                          style: TextStyle(
                            fontSize: isPortraitPhoneSize ? 20 : 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                one = !one;
                                two = false;
                                three = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                shape: const RoundedRectangleBorder(),
                                backgroundColor: one ? active : disable),
                            child: Text(
                              '1º',
                              style: TextStyle(
                                fontSize: isPortraitPhoneSize ? 15 : 20,
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                two = !two;
                                one = false;
                                three = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                shape: const RoundedRectangleBorder(),
                                backgroundColor: two ? active : disable),
                            child: Text(
                              '2º',
                              style: TextStyle(
                                fontSize: isPortraitPhoneSize ? 15 : 20,
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                three = !three;
                                two = false;
                                one = false;
                              });
                            },
                            style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.black87,
                                shape: const RoundedRectangleBorder(),
                                backgroundColor: three ? active : disable),
                            child: Text(
                              '3º',
                              style: TextStyle(
                                fontSize: isPortraitPhoneSize ? 15 : 20,
                              ),
                            )),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'EXPEDIDO: ',
                          style: TextStyle(
                            fontSize: isPortraitPhoneSize ? 20 : 23,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        users.expedition.isNotEmpty
                            ? Text(
                                '${users.expedition.toString().toUpperCase()}t',
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const SizedBox(),
                      ],
                    )),
                  ),
                  adm
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ////////////////////////////////////// MÊS
                            // Padding(
                            //   padding:
                            //       const EdgeInsets.symmetric(horizontal: 20),
                            //   child: Center(
                            //       child: Row(
                            //     mainAxisAlignment: MainAxisAlignment.center,
                            //     children: [
                            //       const Text(
                            //         'EXPEDIDO NO MÊS: ',
                            //         style: TextStyle(
                            //           fontSize: 23,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //       users.expedition.isNotEmpty
                            //           ? Text(
                            //               '${users.expedition.toString().toUpperCase()}t',
                            //               style: const TextStyle(
                            //                 fontSize: 23,
                            //                 fontWeight: FontWeight.bold,
                            //               ),
                            //             )
                            //           : const SizedBox(),
                            //     ],
                            //   )),
                            // ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'CAMINHÕES CARREGANDO: ${users.countTrucksLoading}',
                                style: TextStyle(
                                  fontSize: isPortraitPhoneSize ? 20 : 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                'CARREGADOS NO MÊS: ${users.countTrucksAllLoaded + users.countTrucksLoaded}',
                                style: TextStyle(
                                  fontSize: isPortraitPhoneSize ? 20 : 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'LIMPAR LISTA ATUAL',
                                    style: TextStyle(
                                      fontSize: isPortraitPhoneSize ? 20 : 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: Text(
                                                'Deseja Limpar lista atual?',
                                                style: TextStyle(
                                                  fontSize: isPortraitPhoneSize
                                                      ? 20
                                                      : 23,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              content: const Text(''),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        foregroundColor:
                                                            Colors.black54,
                                                        shape:
                                                            const RoundedRectangleBorder(),
                                                        backgroundColor: Colors
                                                            .grey.shade200),
                                                    child: Text(
                                                      'NÂO',
                                                      style: TextStyle(
                                                        fontSize:
                                                            textScale * 12,
                                                      ),
                                                    )),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      // Provider.of<Users>(
                                                      //         context,
                                                      //         listen: false)
                                                      //     .removeTruckLoadedList();
                                                      Provider.of<Users>(
                                                              context,
                                                              listen: false)
                                                          .clearExpedition();
                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        foregroundColor:
                                                            Colors.black54,
                                                        shape:
                                                            const RoundedRectangleBorder(),
                                                        backgroundColor: Colors
                                                            .grey.shade200),
                                                    child: Text(
                                                      'SIM',
                                                      style: TextStyle(
                                                        fontSize:
                                                            textScale * 12,
                                                      ),
                                                    )),
                                                // ElevatedButton(
                                                //     onPressed: () {
                                                //       Navigator.of(context).pop();
                                                //     },
                                                //     child: const Text('não')),
                                                // ElevatedButton(
                                                //     onPressed: () {
                                                //       Provider.of<Users>(context,
                                                //               listen: false)
                                                //           .removeTruckLoadedList();
                                                //       Navigator.of(
                                                //         context,
                                                //       ).pop();
                                                //     },
                                                //     child: const Text('sim'))
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.delete)),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Row(
                                children: [
                                  Text(
                                    'LIMPAR LISTA DO MÊS',
                                    style: TextStyle(
                                      fontSize: isPortraitPhoneSize ? 20 : 23,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text(
                                                  'Deseja Limpar lista do mês?'),
                                              content: const Text(''),
                                              actions: [
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        foregroundColor:
                                                            Colors.black54,
                                                        shape:
                                                            const RoundedRectangleBorder(),
                                                        backgroundColor: Colors
                                                            .grey.shade200),
                                                    child: Text(
                                                      'NÂO',
                                                      style: TextStyle(
                                                        fontSize:
                                                            textScale * 12,
                                                      ),
                                                    )),
                                                ElevatedButton(
                                                    onPressed: () {
                                                      Provider.of<Users>(
                                                              context,
                                                              listen: false)
                                                          .removeTruckAllLoaded();
                                                      Provider.of<Users>(
                                                              context,
                                                              listen: false)
                                                          .clearExpedition();

                                                      Navigator.of(
                                                        context,
                                                      ).pop();
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        foregroundColor:
                                                            Colors.black54,
                                                        shape:
                                                            const RoundedRectangleBorder(),
                                                        backgroundColor: Colors
                                                            .grey.shade200),
                                                    child: Text(
                                                      'SIM',
                                                      style: TextStyle(
                                                        fontSize:
                                                            textScale * 12,
                                                      ),
                                                    )),
                                                // ElevatedButton(
                                                //     onPressed: () {
                                                //       Navigator.of(context).pop();
                                                //     },
                                                //     child: const Text('não')),
                                                // ElevatedButton(
                                                //     onPressed: () {
                                                //       // users
                                                //       //     .removeTruckAllLoaded();
                                                //       Provider.of<Users>(context,
                                                //               listen: false)
                                                //           .removeTruckAllLoaded();

                                                //       Navigator.of(
                                                //         context,
                                                //       ).pop();
                                                //       // users.loadAllTrucks();
                                                //     },
                                                //     child: const Text('sim'))
                                              ],
                                            );
                                          },
                                        );
                                      },
                                      icon: const Icon(Icons.delete)),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: 295,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              AppRoutes.data_truks_loaded);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black54,
                                        shape: const RoundedRectangleBorder(),
                                        backgroundColor: Colors.grey.shade200),
                                    child: const Text(
                                      'RELATÓRIO ATUAL',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: 295,
                                child: ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .pushReplacementNamed(
                                              AppRoutes.data_truks_all);
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black54,
                                        shape: const RoundedRectangleBorder(),
                                        backgroundColor: Colors.grey.shade200),
                                    child: const Text(
                                      'RELATÓRIO DO MÊS',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: 295,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.grey.shade300,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: const SizedBox(
                                              height: 400,
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      AddWarnigCard(),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black54,
                                        shape: const RoundedRectangleBorder(),
                                        backgroundColor: Colors.grey.shade200),
                                    child: const Text(
                                      'ADICIONAR AVISO',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: 295,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.grey.shade300,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: const SizedBox(
                                              height: 400,
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      AddWarnigCardAds(),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black54,
                                        shape: const RoundedRectangleBorder(),
                                        backgroundColor: Colors.grey.shade200),
                                    child: const Text(
                                      'ADICIONAR URL',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: SizedBox(
                                width: 295,
                                child: ElevatedButton(
                                    onPressed: () {
                                      showModalBottomSheet(
                                        backgroundColor: Colors.grey.shade300,
                                        isScrollControlled: true,
                                        context: context,
                                        builder: (context) {
                                          return Padding(
                                            padding: EdgeInsets.only(
                                                bottom: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom),
                                            child: const SizedBox(
                                              height: 400,
                                              width: double.infinity,
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                                  child: Column(
                                                    children: [
                                                      AddExpedition(),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.black54,
                                        shape: const RoundedRectangleBorder(),
                                        backgroundColor: Colors.grey.shade200),
                                    child: const Text(
                                      'TOTAL EXPEDIDO',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        users.setStatusOpen();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation: users.statusOpen ? 15 : 2,
                                          foregroundColor: Colors.black54,
                                          shape: const RoundedRectangleBorder(),
                                          backgroundColor:
                                              Colors.grey.shade200),
                                      child: Text(
                                        'LIBERADO',
                                        style: TextStyle(
                                          fontSize: textScale * 10.5,
                                        ),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        users.setStautsStoped();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation:
                                              users.statusStoped ? 15 : 2,
                                          foregroundColor: Colors.black54,
                                          shape: const RoundedRectangleBorder(),
                                          backgroundColor:
                                              Colors.grey.shade200),
                                      child: Text(
                                        'PARADO',
                                        style: TextStyle(
                                          fontSize: textScale * 10.5,
                                        ),
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        users.setStautsClosed();
                                      },
                                      style: ElevatedButton.styleFrom(
                                          elevation:
                                              users.statusClosed ? 15 : 2,
                                          foregroundColor: Colors.black54,
                                          shape: const RoundedRectangleBorder(),
                                          backgroundColor:
                                              Colors.grey.shade200),
                                      child: Text(
                                        'ENCERRADO',
                                        style: TextStyle(
                                          fontSize: textScale * 10.5,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: IconButton(
                                  padding: const EdgeInsets.all(1),
                                  onPressed: () {
                                    users.StatusInite();
                                  },
                                  icon: Icon(
                                    Icons.wifi_protected_setup_outlined,
                                    size: 40,
                                    color: Colors.grey.shade400,
                                  )),
                            ),
                          ],
                        )
                      : const SizedBox(),
                  adm
                      ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  adm = !adm;
                                });
                              },
                              icon: const Icon(
                                Icons.keyboard_arrow_up,
                                size: 40,
                              )),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: IconButton(
                              onPressed: () {
                                setState(() {
                                  adm = !adm;
                                });
                              },
                              icon: const Icon(
                                Icons.menu,
                                size: 40,
                              )),
                        ),
                ],
              ),
            ],
          ),
        ));
  }
}
