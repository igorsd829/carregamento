import 'dart:async';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  bool loading = false;


  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  bool userLogado = false;

  FirebaseAuth _auth = FirebaseAuth.instance;
  Future<void> recuperarSenha(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const OutlineInputBorder(),
            title: const Text('Redefinir senha!'),
            content: Text(
              'Enviamos um email de recuperação de senha para ${email}',
            ),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black54,
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.grey.shade200,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      debugPrint("Erro ao enviar e-mail de recuperação de senha: $e");
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: const OutlineInputBorder(),
            title: const Text('Erro ao redefinir senha!'),
            content: const Text('E-mail inválido, erro ao redefinir senha'),
            actionsAlignment: MainAxisAlignment.center,
            actions: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black54,
                  shape: const RoundedRectangleBorder(),
                  backgroundColor: Colors.grey.shade200,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }

  void helpPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const OutlineInputBorder(),
          title: const Text('Redefinir senha!'),
          content: const Text(
            'Adicione seu e-mail em seguida clique aqui denovo',
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black54,
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.grey.shade200,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  _validarCampos() async {
    setState(() {
      loading = true;
    });

    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;
    if (email.isEmpty || !email.contains("@")) {
      _pararLoadingEExibirErro("E-mail inválido");
      return;
    }

    if (senha.isEmpty || senha.length <= 1) {
      _pararLoadingEExibirErro("Senha muito curta");
      return;
    }
    //Fluxo de LOGIN
    else {
      try {
        UserCredential auth = await _auth.signInWithEmailAndPassword(
          email: email,
          password: senha,
        );

        setState(() => loading = false);

        if (auth.user!.emailVerified) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.home, arguments: true);
        
        } else {
          auth.user?.sendEmailVerification();
          Navigator.of(
            context,
          ).pushReplacementNamed(AppRoutes.email_verification_page);
        }
      } catch (e) {
        _pararLoadingEExibirErro("E-mail ou senha incorretos");
      }
    }
  }

  void _pararLoadingEExibirErro(String msg) {
    setState(() => loading = false);
    _showErrorDialog(msg);
  }

  @override
  Widget build(BuildContext context) {
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
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
      body: Container(
        width: larguraTela,
        height: alturaTela,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: Image.asset(
                      'assets/images/supercal_login.png',
                      scale: 20,
                      fit: BoxFit.fill,
                    ),
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
                        : Center(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          width: 500,
                          height: 500,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
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
                                
                                SizedBox(height: 20),
                                
                                SizedBox(height: 8),
                               Padding(
                                  padding: const EdgeInsets.symmetric(
                                          vertical: 10,
                                          horizontal: 60,
                                        ),
                                 child: SingleChildScrollView(
                                   child: Column(
                                    children: [TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _controllerEmail,
                                      decoration: InputDecoration(
                                        hintText: "Email",
                                        labelText: "Email",
                                        
                                      ),
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.text,
                                      controller: _controllerSenha,
                                      obscureText: true,
                                      decoration: InputDecoration(
                                        hintText: "Senha",
                                        labelText: "Senha",
                                        
                                      ),
                                    ),
                                    
                                    SizedBox(height: 10),Row(
                                  children: [
                                    const Expanded(child: SizedBox()),
                                    InkWell(
                                      onTap: () {
                                        _controllerEmail.text.isEmpty
                                            ? setState(() {
                                                helpPassword();
                                              })
                                            : setState(() {
                                                recuperarSenha(
                                                  _controllerEmail.text,
                                                );
                                              });
                                      },
                                      child: const Text('Esqueci a senha'),
                                    ),
                                  ],
                                ),SizedBox(height: 10),
                                    Container(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: Colors.black54,
                                          shape: const RoundedRectangleBorder(),
                                          backgroundColor: Colors.grey.shade200,
                                        ),
                                        onPressed: () {
                                          loading
                                              ? setState(() {
                                                  loading = false;
                                                })
                                              : _validarCampos();
                                        },
                                        child: const Text('Entrar'),
                                      ),
                                    ),
                                    
                                    const SizedBox(height: 20),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: InkWell(
                                          onTap: () {
                                            Navigator.of(
                                              context,
                                            ).pushNamedAndRemoveUntil(
                                              AppRoutes.init,
                                              (Route<dynamic> route) => false,
                                            );
                                          },
                                          child: const Text('MOTORISTA ?'),
                                        ),
                                      ),
                                    ),
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
                                    ),],
                                   ),
                                 ),
                               ),
                                
                                
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),Positioned(
            bottom: 10,
            right: 10,
            child: SizedBox(
              width: 200,
              height: 200,
              child: Image.asset('assets/images/logo_unitins_2021.png')))
          ],
        ),
      ),
    );
  }

  void _showErrorDialog(String mensagem) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        shape: const OutlineInputBorder(),
        title: const Text('Ops! algo deu errado'),
        content: Text(mensagem),
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey.shade200,
            ),
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text('Entendido'),
          ),
        ],
      ),
    );
  }
}

