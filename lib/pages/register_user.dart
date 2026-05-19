import 'package:carregamento_conectado/models/colaborador.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool loading = false;

  TextEditingController _controllerNome = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool _cadastroUsuario = true;
  bool userLogado = false;
  String unidade = 'supercal';

  FirebaseAuth _auth = FirebaseAuth.instance;

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

    int numberWindow = 0;
    String setorUser = '';
    String nome = _controllerNome.text;
    String email = _controllerEmail.text;
    String senha = _controllerSenha.text;

    // 1. Validação básica de Formato
    if (email.isEmpty || !email.contains("@")) {
      _pararLoadingEExibirErro("E-mail inválido");
      return;
    }

    if (senha.isEmpty || senha.length <= 1) {
      _pararLoadingEExibirErro("Senha muito curta");
      return;
    }

    // 2. Fluxo de CADASTRO
    if (_cadastroUsuario) {
      if (nome.isEmpty || nome.length < 3) {
        _pararLoadingEExibirErro("Nome deve ter pelo menos 3 caracteres");
        return;
      }
      try {
        // Tenta criar no Auth
        UserCredential auth = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: senha,
        );

        // Envia verificação
        await auth.user?.sendEmailVerification();

        String? idUsuario = auth.user?.uid;
        if (idUsuario != null) {
          // Salva no Firestore
          final usuarioRef = _firestore.collection('colaboradores');
          Colaborador colaborador = Colaborador(
            authorized: false,
            setorUser: setorUser,
            idUsuario,
            nome,
            email,
            unidade,
            numberWindow,
            false,
          );

          await usuarioRef.doc(idUsuario).set(colaborador.toMap());
          await auth.user?.updateDisplayName(nome);

          if (!mounted) return;
          setState(() => loading = false);
          Navigator.of(
            context,
          ).pushReplacementNamed(AppRoutes.email_verification_page);
        }
      } on FirebaseAuthException catch (e) {
        setState(() => loading = false);
        String mensagem = "Erro no cadastro";

        if (e.code == 'email-already-in-use') {
          mensagem =
              "Este e-mail já está cadastrado. Que tal fazer login ou recuperar sua senha?";
        } else if (e.code == 'weak-password') {
          mensagem = "A senha é muito fraca.";
        } else if (e.code == 'invalid-email') {
          mensagem = "O e-mail digitado é inválido.";
        }

        _showErrorDialog(mensagem);
      }
    }
    // 3. Fluxo de LOGIN
    else {
      try {
        UserCredential auth = await _auth.signInWithEmailAndPassword(
          email: email,
          password: senha,
        );

        setState(() => loading = false);

        if (auth.user!.emailVerified) {
          Navigator.of(context).pushReplacementNamed(AppRoutes.home);
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
                                            children: [
                                              SizedBox(height: 8),

                                              //Caixa de texto nome
                                              TextField(
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: _controllerNome,
                                                decoration: InputDecoration(
                                                  hintText: "Nome Completo",
                                                  labelText: "Nome Completo",
                                                  suffixIcon: Icon(
                                                    Icons.person_outline,
                                                  ),
                                                ),
                                              ),

                                              //Caixa de texto email
                                              TextField(
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                controller: _controllerEmail,
                                                decoration: InputDecoration(
                                                  hintText: "Email",
                                                  labelText: "Email",
                                                  suffixIcon: Icon(
                                                    Icons.mail_outline,
                                                  ),
                                                ),
                                              ),

                                              //Caixa de texto senha
                                              TextField(
                                                keyboardType:
                                                    TextInputType.text,
                                                controller: _controllerSenha,
                                                obscureText: true,
                                                decoration: InputDecoration(
                                                  hintText: "Senha",
                                                  labelText: "Senha",
                                                  suffixIcon: Icon(
                                                    Icons.lock_outline,
                                                  ),
                                                ),
                                              ),

                                              SizedBox(height: 20),

                                              SizedBox(height: 10),
                                              Row(),
                                              SizedBox(height: 10),
                                              Container(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                                                    foregroundColor:
                                                        Colors.black54,
                                                    shape:
                                                        const RoundedRectangleBorder(),
                                                    backgroundColor:
                                                        Colors.grey.shade200,
                                                  ),
                                                  onPressed: () {
                                                    loading
                                                        ? setState(() {
                                                            loading = false;
                                                          })
                                                        : _validarCampos();
                                                  },
                                                  child: const Text('Cadastrar'),
                                                ),
                                              ),

                                              const SizedBox(height: 20),
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
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('assets/images/logo_unitins_2021.png'),
              ),
            ),
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
