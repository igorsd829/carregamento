import 'dart:async';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool mostrar = false;
  bool _cadastroUsuario = false;
  bool _login = true;
  bool logado = false;
  bool loading = false;
  final TextEditingController _controllerName = TextEditingController(text: '');
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  //text: 'igoralexandre@gmail.com'
  //text: '1234567'

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Timer.periodic(const Duration(seconds: 30), (Timer) {
    //   cor = !cor;
    //   Provider.of<Users>(context, listen: false).clearLists();
    //   Provider.of<Users>(context, listen: false).loadAllTrucks();
    //   Provider.of<Users>(context, listen: false).loadStatus();
    //   Provider.of<Users>(context, listen: false).loadWarnig();
    // });
    // Provider.of<Users>(context, listen: false).loadAllTrucks();
    // Provider.of<Users>(context, listen: false).loadStatus();
    // Provider.of<Users>(context, listen: false).loadWarnig();
    // Provider.of<Users>(context, listen: false).loadAdSupercal();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      timer.cancel();
    });
  }

  bool cor = false;

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaler.scale(1);
    bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;
    final Users users = Provider.of(context);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
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
      body: Stack(
        children: [
          // showWallpaper
          //     ? SizedBox(
          //         height: alturaDaTela - 10,
          //         width: widthScreen,
          //         child: Image.asset(
          //           'assets/images/supercal.png',
          //           fit: BoxFit.fill,
          //           width: widthScreen,
          //         ),
          //       )
          //     : Center(
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             SizedBox(
          //               height: widthScreen * 0.10,
          //               child: Image.asset(
          //           'assets/images/supercal.png',
          //                 fit: BoxFit.contain,
          //                 color: Colors.grey.withOpacity(0.8),
          //               ),
          //             ),
          //             SizedBox(
          //               height: widthScreen * 0.10,
          //               child:  Image.asset(
          //           'assets/images/supercal.png',
          //                 fit: BoxFit.contain,
          //                 color: Colors.grey.withOpacity(0.8),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  child: Image.asset(
                    'assets/images/supercal_login.png',
                    
                  ),
                ),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey.shade300.withOpacity(0.6),
                    ),
                    height: 400,
                    width: 400,
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
                            child: _login
                                ? Column(
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
                                                  ///// vai direto para a fila de caminhoes sem poder
                                                  Navigator.of(
                                                    context,
                                                  ).pushReplacementNamed(
                                                    AppRoutes.home,
                                                    arguments: false
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
                                                  setState(() {
                                                    _login = false;
                                                  });
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
                                              users.warning.isEmpty
                                                  ? const SizedBox()
                                                  : Center(
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                20,
                                                              ),
                                                          color: Colors.white,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                10,
                                                              ),
                                                          child: Text(
                                                            users.warning
                                                                .toUpperCase(),
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize:
                                                                  textScale *
                                                                  14,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 60,
                                          vertical: 10,
                                        ),
                                        child: Text(
                                                DateFormat(
                                                  ' dd/MM/y',
                                                ).format(DateTime.now()),
                                                style: TextStyle(
                                                  fontSize: textScale * 10,
                                                  color: Colors.black54,
                                                ),
                                              ),
                                      ),
                                    ],
                                  )
                                : Column(
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
                                      Visibility(
                                        visible: _cadastroUsuario,
                                        child: TextField(
                                          decoration: const InputDecoration(
                                            label: Text('Nome'),
                                          ),
                                          controller: _controllerName,
                                        ),
                                      ),
                                      TextField(
                                        decoration: const InputDecoration(
                                          hintText: 'Digite seu email',
                                          label: Text('Email'),
                                        ),
                                        controller: _controllerEmail,
                                      ),
                                      TextField(
                                        obscureText: true,
                                        decoration: const InputDecoration(
                                          hintText: 'Digite sua senha',
                                          label: Text('Senha'),
                                        ),
                                        controller: _controllerSenha,
                                      ),
                                      const SizedBox(height: 20),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 60,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                foregroundColor: Colors.black54,
                                                shape:
                                                    const RoundedRectangleBorder(),
                                                backgroundColor:
                                                    Colors.grey.shade200,
                                              ),
                                              onPressed: () {

                                                /// define o cara como adm aqui
                                                

                                                Navigator.of(
                                                  context,
                                                ).pushReplacementNamed(
                                                  AppRoutes.home,
                                                  arguments: true
                                                );
                                              },
                                              child: _cadastroUsuario
                                                  ? const Text('Cadastrar')
                                                  : const Text('Entrar'),
                                            ),
                                            const SizedBox(height: 20),
                                            Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  8.0,
                                                ),
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      _login = true;
                                                    });
                                                  },
                                                  child: const Text(
                                                    'MOTORISTA ?',
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
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
                                        ),
                                      ),
                                    ],
                                  ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
