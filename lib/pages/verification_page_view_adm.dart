import 'dart:async';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmailVerificationPageAdm extends StatefulWidget {
  const EmailVerificationPageAdm({Key? key}) : super(key: key);

  @override
  _EmailVerificationPageAdmState createState() => _EmailVerificationPageAdmState();
}

class _EmailVerificationPageAdmState extends State<EmailVerificationPageAdm> {
  bool loading = true;
  Timer? _timer;
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
    final Users users = Provider.of(
      context,
    );
    return Scaffold(
      body: Container(
       color: Colors.grey,
        width: larguraTela,
        height: alturaTela,
        child: Stack(
          children: [
            Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Card(
                    elevation: 4,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      padding: const EdgeInsets.all(40),
                      width: 500,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: 100,
                              child: Image.asset(
                                'assets/images/supercal_login.png',
                                scale: 20,
                                fit: BoxFit.fill,
                              )),

                          Text(
                            'CONFIRMAR E-MAIL',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w100,
                                color: Colors.grey.shade700),
                          ),

                          const SizedBox(
                            height: 20,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text:
                                      'Um e-mail de confirmação foi enviado para o endereço eletrônico registrado ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                                // TextSpan(
                                //   text: _auth.currentUser!.email, ///////////// arguments
                                //   style: TextStyle(
                                //     fontWeight: FontWeight.w300,
                                //     color: Colors
                                //         .blue.shade800, // Mudar a cor para azul
                                //   ),
                                // ),
                                TextSpan(
                                  text:
                                      '. Por favor, peça para que o usuário cadastrado verifique a caixa de entrada ou spam e clique no link de confirmação para ativar a nova conta, em seguida peça que ele faça login.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              ElevatedButton(
                                onPressed: () {
                                  _auth.signOut();
                                  Navigator.of(context)
                                      .pushNamed(AppRoutes.login_page);
                                  users.isUserAdm = false;
                                  users.authorized = false;
                                  users.setorUarioLogado = '';
                                },
                                style: ElevatedButton.styleFrom(elevation: 8),
                                child: const Text('OK'),
                              ),
                            ],
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
