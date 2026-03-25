import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserFormView extends StatefulWidget {
  final bool loading;
  const UserFormView({this.loading = false, super.key});

  @override
  State<UserFormView> createState() => _UserFormViewState();
}

class _UserFormViewState extends State<UserFormView> {
 
  @override
  Widget build(BuildContext context) {
    UserPlate userPlate =
        ModalRoute.of(context)!.settings.arguments as UserPlate;
    return Scaffold(
        appBar: AppBar(
          title: const Text('SOBRE'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
                'PLACA: ${userPlate.plate.substring(0, 3).toUpperCase()}-${userPlate.plate.substring(3, 7).toUpperCase()}',
                style: const TextStyle(fontSize: 25)),
            userPlate.name != ''
                ? Text(
                    'MOTORISTA: ${userPlate.name.toUpperCase()}',
                    style: TextStyle(fontSize: 25, color: Colors.black87),
                  )
                : const SizedBox(),
                 userPlate.client != ''
                ? Text(
                    'CLIENTE: ${userPlate.client.toUpperCase()}',
                    style: TextStyle(fontSize: 25, color: Colors.black87),
                  )
                : const SizedBox(),
            // Text(
            //   'MOTORISTA: ${userPlate.name.toUpperCase()}',
            //   style: const TextStyle(fontSize: 25, color: Colors.black87),
            // ),
            Text(
              // ignore: unnecessary_null_comparison
              'CHEGADA: ${DateFormat('dd/MM/y, HH:mm').format(
                      userPlate.date,
                    )}',
              style: const TextStyle(fontSize: 25, color: Colors.black87),
            ),
            userPlate.obs != ''
                ? Text(
                    'OBSERVAÇÃO: ${userPlate.obs.toUpperCase()}',
                    style: const TextStyle(fontSize: 25, color: Colors.black87),
                  )
                : const SizedBox(),
          ]),
        ));
  }
}
