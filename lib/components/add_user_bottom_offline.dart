import 'package:carregamento_conectado/components/row_colors_trucks.dart';
import 'package:flutter/material.dart';
class UserBotoomOffline extends StatefulWidget {
  const UserBotoomOffline({super.key});

  @override
  State<UserBotoomOffline> createState() => _UserBotoomOfflineState();
}

class _UserBotoomOfflineState extends State<UserBotoomOffline> {
  bool isBlack = false;
  bool isWhite = false;
  bool isGrey = false;
  bool isBlue = false;
  bool isRed = false;
  bool isGreen = false;
  bool isYellow = false;

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    final Map<String, Object> formData = {};

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Form(
        key: form,
        child: Column(
          children: [
            TextFormField(
                decoration: const InputDecoration(labelText: 'Placa'),
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return 'Não pode ser vazio';
                  } else if (value.trim().length < 7 ||
                      value.trim().length > 7) {
                    return 'Deve conter 7 digitos';
                  } else if (value.trim().isEmpty) {
                    return 'Não pode ser vazio';
                  }
                  // else if (value.trim().length == 7 &&
                  //     value != value.toLowerCase()) {
                  //   return 'Somente letras minúsculas';
                  // }
                  return null;
                },
                onSaved: (newValue) => formData['plate'] = newValue!),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nome'),
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Não pode ser vazio';
                } else if (value.trim().length > 50) {
                  return 'máximo 50 dígitos';
                }
                // else if (value != value.toLowerCase()) {
                //   return 'somente letras minúsculas';
                // }
                return null;
              },
              onSaved: (newValue) => formData['name'] = newValue!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Cliente'),
              validator: (value) {
                if (value!.trim().length > 50) {
                  return 'máximo 50 dígitos';
                }

                // else if (value != value.toLowerCase()) {
                //   return 'somente letras minúsculas';
                // }
                return null;
              },
              onSaved: (newValue) => formData['client'] = newValue!,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Observação'),
              validator: (value) {
                if (value!.trim().length > 50) {
                  return 'máximo 50 dígitos';
                }

                // else if (value != value.toLowerCase()) {
                //   return 'somente letras minúsculas';
                // }
                return null;
              },
              onSaved: (newValue) => formData['obs'] = newValue!,
            ),
            const SizedBox(height: 15),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  RowCardColorsTrucks(
                    selected: isBlack,
                    color: Colors.black,
                    onPressed: () {
                      formData['colorTruck'] = 'black';
                    },
                  ),
                  RowCardColorsTrucks(
                    selected: isWhite,
                    color: Colors.white,
                    onPressed: () {
                      formData['colorTruck'] = 'white';
                    },
                  ),
                  RowCardColorsTrucks(
                    selected: isGrey,
                    color: Colors.grey,
                    onPressed: () {
                      formData['colorTruck'] = 'grey';
                    },
                  ),
                  RowCardColorsTrucks(
                    selected: isBlue,
                    color: Colors.blue,
                    onPressed: () {
                      formData['colorTruck'] = 'blue';
                    },
                  ),
                  RowCardColorsTrucks(
                    selected: isRed,
                    color: Colors.redAccent,
                    onPressed: () {
                      formData['colorTruck'] = 'red';
                    },
                  ),
                  RowCardColorsTrucks(
                    selected: isYellow,
                    color: Colors.yellow,
                    onPressed: () {
                      formData['colorTruck'] = 'yellow';
                    },
                  ),
                  RowCardColorsTrucks(
                    selected: isGreen,
                    color: Colors.green,
                    onPressed: () {
                      formData['colorTruck'] = 'green';
                    },
                  ),
                  RowCardColorsTrucks(
                    selected: isGreen,
                    color: Colors.orangeAccent,
                    onPressed: () {
                      formData['colorTruck'] = 'orange';
                    },
                  ),
                  RowCardColorsTrucks(
                    selected: isGreen,
                    color: Colors.pinkAccent,
                    onPressed: () {
                      formData['colorTruck'] = 'pink';
                    },
                  ),
                ])),
            const SizedBox(height: 15),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black54,
                    shape: const RoundedRectangleBorder(),
                    backgroundColor: Colors.grey.shade200,
                    elevation: 5),
                onPressed: () {
                  final bool isValid = form.currentState!.validate();
                  if (isValid) {
                    form.currentState!.save();
                    // Provider.of<Users>(context, listen: false).putNewOffline(
                    //     UserPlate(
                    //         colorTruck: formData['colorTruck'].toString(),
                    //         name: formData['name'].toString().toLowerCase(),
                    //         plate: formData['plate'].toString().toLowerCase(),
                    //         client: formData['client'].toString().toLowerCase(),
                    //         obs: formData['obs'].toString().toLowerCase(),
                    //         date: DateTime.now()));

                    // Provider.of<Users>(context, listen: false).loadTrucks();

                    Navigator.of(context).pop();
                  }
                  // Provider.of<Users>(context, listen: false).loadTrucks();
                },
                child: Text(
                  'ADICIONAR',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 25),
                ))
          ],
        ),
      ),
    );
  }
}
