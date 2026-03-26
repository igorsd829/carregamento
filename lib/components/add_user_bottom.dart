import 'package:carregamento_conectado/components/row_colors_trucks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user_plate_model.dart';
import '../providers/user_plate_provider.dart';

class UserBotoom extends StatefulWidget {
  const UserBotoom({super.key});

  @override
  State<UserBotoom> createState() => _UserBotoomState();
}

class _UserBotoomState extends State<UserBotoom> {
  bool isBlack = false;
  bool isWhite = false;
  bool isGrey = false;
  bool isBlue = false;
  bool isRed = false;
  bool isGreen = false;
  bool isYellow = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final form = GlobalKey<FormState>();
    final Map<String, Object> formData = {};
    int numberWindow = 0;

    // formData['client'] = '';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: Form(
        key: form,
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: TextFormField(
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
                      return null;
                    },
                    onSaved: (newValue) => formData['plate'] = newValue!,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Nome'),
                    validator: (value) {
                      return null;
                    },
                    onSaved: (newValue) => formData['name'] = newValue!,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Cliente'),
                    validator: (value) {
                      if (value!.trim().length > 50) {
                        return 'máximo 50 dígitos';
                      }
                      return null;
                    },
                    onSaved: (newValue) => formData['client'] = newValue!,
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'Observação'),
                    validator: (value) {
                      if (value!.trim().length > 50) {
                        return 'máximo 50 dígitos';
                      }
                      return null;
                    },
                    onSaved: (newValue) => formData['obs'] = newValue!,
                  ),
                ),
              ],
            ),

            TextFormField(
              decoration: const InputDecoration(labelText: 'ID'),
              validator: (value) {
                if (value!.trim().length > 50) {
                  return 'máximo 50 dígitos';
                }
                return null;
              },
              onSaved: (newValue) => formData['idTruck'] = newValue!,
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            const SizedBox(height: 15),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
                ],
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black54,
                shape: const RoundedRectangleBorder(),
                backgroundColor: Colors.grey.shade200,
                elevation: 5,
              ),
              onPressed: () {
                final bool isValid = form.currentState!.validate();
                if (isValid) {
                  form.currentState!.save();
                  Provider.of<Users>(context, listen: false).putNew(
                    UserPlate(
                      window: numberWindow,
                      colorTruck: formData['colorTruck'].toString(),
                      name: formData['name'].toString().toLowerCase(),
                      plate: formData['plate'].toString().toLowerCase(),
                      client: formData['client'].toString().toLowerCase(),
                      obs: formData['obs'].toString().toLowerCase(),
                      idTruck: formData['idTruck'].toString().toLowerCase(),
                      date: DateTime.now(),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: Text(
                'ADICIONAR',
                style: TextStyle(color: Colors.grey.shade700, fontSize: 25),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
