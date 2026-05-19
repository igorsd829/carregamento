import 'dart:ui';
import 'package:carregamento_conectado/pages/data_trucks.dart';
import 'package:carregamento_conectado/pages/data_trucks_adm.dart';
import 'package:carregamento_conectado/pages/help_page.dart';
import 'package:carregamento_conectado/pages/help_page_adm.dart';
import 'package:carregamento_conectado/pages/home_page_view.dart';
import 'package:carregamento_conectado/pages/login_page.dart';
import 'package:carregamento_conectado/pages/queue_of_trucks_loaded.dart';
import 'package:carregamento_conectado/pages/queue_of_trucks_loaded_all.dart';
import 'package:carregamento_conectado/pages/queue_of_trucks_offline.dart';
import 'package:carregamento_conectado/pages/register_user.dart';
import 'package:carregamento_conectado/pages/trucks_scheduled_page.dart';
import 'package:carregamento_conectado/pages/user_form_new.dart';
import 'package:carregamento_conectado/pages/user_form_view.dart';
import 'package:carregamento_conectado/pages/verification_page_view_ADm.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carregamento_conectado/firebase_options.dart';
import 'package:carregamento_conectado/pages/verification_page_view.dart';
import 'package:carregamento_conectado/pages/init_page.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Users())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        scrollBehavior: const MaterialScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
            PointerDeviceKind.stylus,
            PointerDeviceKind.unknown,
          },
        ),
        title: 'Carregamento Conectado',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
          useMaterial3: true,
        ),
        initialRoute: AppRoutes.init,
        routes: {
          AppRoutes.init: (context) => const InitPage(),
          AppRoutes.home: (context) => const HomePage(),
          AppRoutes.login_page: (context) => const LoginPage(),
          AppRoutes.user_form_new: (context) => const UserFormNew(),
          AppRoutes.user_form_view: (context) => const UserFormView(),
          AppRoutes.help_page: (context) => const HelpPage(),
          AppRoutes.help_page_adm: (context) => const HelpPageAdm(),
          AppRoutes.data_truks: (context) => const DataTrucks(),
          AppRoutes.data_truks_adm: (context) => const DataTrucksAdm(),
          AppRoutes.register_page: (context) => const RegisterPage(),
          AppRoutes.list_offline: (context) =>
              const QueueOfTrucksOffline(isAdm: false, load: false),
          AppRoutes.data_truks_loaded: (context) =>
              const QueueOfTrucksLoaded(isAdm: true, load: false),
          AppRoutes.data_truks_all: (context) =>
              const QueueOfTrucksLoadedAll(isAdm: true),
          AppRoutes.trucks_scheduled: (context) =>
              const TrucksScheduled(isAdm: true),
              AppRoutes.email_verification_page: (context) =>
              const EmailVerificationPage(),
              AppRoutes.email_verification_page_adm: (context) =>
              const EmailVerificationPageAdm(),
        },
      ),
    );
  }
}
