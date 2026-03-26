import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class DataTrucks extends StatefulWidget {
  const DataTrucks({super.key});

  @override
  State<DataTrucks> createState() => _DataTrucksState();
}

class _DataTrucksState extends State<DataTrucks> {
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
    double textScale = MediaQuery.of(context).textScaler.scale(1);
    bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;

    final Users users = Provider.of(context);

    // double textScale = MediaQuery.of(context).textScaler.scale(1);
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey.shade200),
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
                    fit: BoxFit.contain,
                  ),
                ),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'CAMINHÕES NA FILA: ${users.countTrucksOne + users.countTrucksTwo + users.countTrucksThree}\nCAMINHÕES CARREGADOS: ${users.countTrucksLoaded}\nDATA: ${DateFormat('dd/MM/y, HH:mm').format(DateTime.now())}h',
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
                                            ..color = Colors.black,
                                        ),
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
                                            ..color = Colors.black,
                                        ),
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
                                            ..color = Colors.black,
                                        ),
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
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 0,
                  ),
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
                          backgroundColor: one ? active : disable,
                        ),
                        child: Text(
                          '1º',
                          style: TextStyle(
                            fontSize: isPortraitPhoneSize ? 15 : 20,
                          ),
                        ),
                      ),
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
                          backgroundColor: two ? active : disable,
                        ),
                        child: Text(
                          '2º',
                          style: TextStyle(
                            fontSize: isPortraitPhoneSize ? 15 : 20,
                          ),
                        ),
                      ),
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
                          backgroundColor: three ? active : disable,
                        ),
                        child: Text(
                          '3º',
                          style: TextStyle(
                            fontSize: isPortraitPhoneSize ? 15 : 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
