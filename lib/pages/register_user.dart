import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool mostrar = false;
  bool logado = false;
  bool loading = false;
  final TextEditingController _controllerName = TextEditingController(text: '');
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerSenha = TextEditingController();
  //text: 'igoralexandre@gmail.com'
  //text: '1234567'

  @override
  void initState() {
    super.initState();
  }

  bool cor = false;

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaler.scale(1);
    bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: isPortraitPhoneSize ? 18 : 35,
              child: Image.asset(
                'assets/images/supercal_login.png',
                fit: BoxFit.contain,
              ),
            ),
            const Expanded(child: SizedBox()),
          ],
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
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
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    'CADASTRAR',
                                    style: TextStyle(
                                      fontSize: textScale * 30,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                                Visibility(
                                  visible: true,
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
                                          shape: const RoundedRectangleBorder(),
                                          backgroundColor: Colors.grey.shade200,
                                        ),
                                        onPressed: () {
                                          Navigator.of(
                                            context,
                                          ).pushReplacementNamed(
                                            AppRoutes.home,
                                            arguments: true,
                                          );
                                        },
                                        child: const Text('Cadastrar'),
                                      ),
                                      const SizedBox(height: 20),
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

      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 150,
          height: 150,
          child: Center(
            child: SizedBox(
              height: 150,
              child: Image.asset('assets/images/logo_unitins_2021.png'),
            ),
          ),
        ),
      ),
    );
  }
}
