import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  _InitPageState createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
     double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
    double textScale = MediaQuery.of(context).textScaler.scale(1);
     bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;
    final Users users = Provider.of(
      context,
    );

    return Scaffold(
      backgroundColor: Colors.grey,
     appBar:  AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black54,
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.grey.shade200,
              ),
              child: Text(
                'FILA: ${users.countTrucksOne + users.countTrucksTwo + users.countTrucksThree}º',
                style: TextStyle(
                  fontSize: isPortraitPhoneSize
                      ? textScale * 8
                      : textScale * 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black54,
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.grey.shade200,
              ),
              child: Text(
                'CARREGANDO: ${users.countTrucksLoading}º',
                style: TextStyle(
                  fontSize: isPortraitPhoneSize
                      ? textScale * 8
                      : textScale * 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black54,
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.grey.shade200,
              ),
              child: Text(
                'CARREGADOS: ${users.countTrucksLoaded}º',
                style: TextStyle(
                  fontSize: isPortraitPhoneSize
                      ? textScale * 8
                      : textScale * 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        width: larguraTela,
        height: alturaTela,
        child: 
        Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/supercal_login.png'),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300.withOpacity(0.6),
                    ),
                  width: 500,
                          height: 500,
                    child: loading
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 50,
                                  child: const CircularProgressIndicator(),
                                ),
                                const SizedBox(height: 10),
                                TextButton(
                                  onPressed: () {
                                    setState(() {
                                      loading = false;
                                    });
                                  },
                                  child: const Text('CANCELAR'),
                                ),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: 
                                Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          'BEM-VINDO',
                                          style: TextStyle(
                                            fontSize: textScale * 30,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 60,
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(
                                                    context,
                                                  ).pushReplacementNamed(
                                                    AppRoutes.home,
                                                    arguments: false,
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      Colors.black54,
                                                  shape:
                                                      const RoundedRectangleBorder(),
                                                  backgroundColor:
                                                      Colors.grey.shade200,
                                                ),
                                                child: Text(
                                                  'MOTORISTA',
                                                  style: TextStyle(
                                                    fontSize: textScale * 12,
                                                  ),
                                                ),
                                              ),
                                              Center(
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                    8.0,
                                                  ),
                                                  child: Text(
                                                    'OU',
                                                    style: TextStyle(
                                                      fontSize: textScale * 12,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {
                                                  Navigator.of(
                                                    context,
                                                  ).pushReplacementNamed(
                                                    AppRoutes.login_page,
                                                  );
                                                },
                                                style: ElevatedButton.styleFrom(
                                                  foregroundColor:
                                                      Colors.black54,
                                                  shape:
                                                      const RoundedRectangleBorder(),
                                                  backgroundColor:
                                                      Colors.grey.shade200,
                                                ),
                                                child: Text(
                                                  'PORTEIRO',
                                                  style: TextStyle(
                                                    fontSize: textScale * 12,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(height: 10),

                                              const SizedBox(height: 10),
                                              
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Center(
                                        child: Text(
                                          'DATA: ${DateFormat('dd/MM/y').format(DateTime.now())}',
                                          style: TextStyle(
                                            fontSize: textScale * 12,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ],
                                  )
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
        
       
      ),
    );
  }}

  



