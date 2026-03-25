import 'dart:async';
import 'package:carregamento_conectado/components/row_colors_trucks.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  final StreamController<bool> _checkBoxController = StreamController();
  Stream<bool> get _checkBoxStream => _checkBoxController.stream;
  //
  final StreamController<bool> _checkBoxController2 = StreamController();
  Stream<bool> get _checkBoxStream2 => _checkBoxController2.stream;
  //
  final StreamController<bool> _checkBoxController3 = StreamController();
  Stream<bool> get _checkBoxStream3 => _checkBoxController3.stream;
  //
  final StreamController<bool> _checkBoxController4 = StreamController();
  Stream<bool> get _checkBoxStream4 => _checkBoxController4.stream;
  //
  final StreamController<bool> _checkBoxController5 = StreamController();
  Stream<bool> get _checkBoxStream5 => _checkBoxController5.stream;
  //
  final StreamController<bool> _checkBoxController6 = StreamController();
  Stream<bool> get _checkBoxStream6 => _checkBoxController6.stream;

  final StreamController<bool> _checkBoxController7 = StreamController();
  Stream<bool> get _checkBoxStream7 => _checkBoxController7.stream;
  //
  final StreamController<bool> _checkBoxController8 = StreamController();
  Stream<bool> get _checkBoxStream8 => _checkBoxController8.stream;
  //
  final StreamController<bool> _checkBoxController9 = StreamController();
  Stream<bool> get _checkBoxStream9 => _checkBoxController9.stream;
  //
  final StreamController<bool> _checkBoxController10 = StreamController();
  Stream<bool> get _checkBoxStream10 => _checkBoxController10.stream;
  //
  final StreamController<bool> _checkBoxController11 = StreamController();
  Stream<bool> get _checkBoxStream11 => _checkBoxController11.stream;
  //
  final StreamController<bool> _checkBoxController12 = StreamController();
  Stream<bool> get _checkBoxStream12 => _checkBoxController12.stream;

  final StreamController<bool> _checkBoxController13 = StreamController();
  Stream<bool> get _checkBoxStream13 => _checkBoxController13.stream;
  //
  final StreamController<bool> _checkBoxController14 = StreamController();
  Stream<bool> get _checkBoxStream14 => _checkBoxController14.stream;
  //
  final StreamController<bool> _checkBoxController15 = StreamController();
  Stream<bool> get _checkBoxStream15 => _checkBoxController15.stream;
  //
  final StreamController<bool> _checkBoxController16 = StreamController();
  Stream<bool> get _checkBoxStream16 => _checkBoxController16.stream;
  //
  final StreamController<bool> _checkBoxController17 = StreamController();
  Stream<bool> get _checkBoxStream17 => _checkBoxController17.stream;
  //
  final StreamController<bool> _checkBoxController18 = StreamController();
  Stream<bool> get _checkBoxStream18 => _checkBoxController18.stream;

  @override
  void dispose() {
    _checkBoxController.close();
    _checkBoxController2.close();
    _checkBoxController3.close();
    _checkBoxController4.close();
    _checkBoxController5.close();
    _checkBoxController6.close();
    _checkBoxController7.close();
    _checkBoxController8.close();
    _checkBoxController9.close();
    _checkBoxController10.close();
    _checkBoxController11.close();
    _checkBoxController12.close();
    _checkBoxController13.close();
    _checkBoxController14.close();
    _checkBoxController15.close();
    _checkBoxController16.close();
    _checkBoxController17.close();
    _checkBoxController18.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context, listen: false);
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
                      // else if (value.trim().length == 7 &&
                      //     value != value.toLowerCase()) {
                      //   return 'Somente letras minúsculas';
                      // }
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
                      // if (value!.trim().isEmpty) {
                      //   return 'Não pode ser vazio';
                      // } else if (value.trim().length > 50) {
                      //   return 'máximo 50 dígitos';
                      // }

                      return null;
                    },
                    onSaved: (newValue) => formData['name'] = newValue!,
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.start,
            //   children: [
            //     Flexible(
            //       child: TextFormField(
            //         decoration: const InputDecoration(labelText: 'Nome'),
            //         validator: (value) {
            //           // if (value!.trim().isEmpty) {
            //           //   return 'Não pode ser vazio';
            //           // } else if (value.trim().length > 50) {
            //           //   return 'máximo 50 dígitos';
            //           // }

            //           return null;
            //         },
            //         onSaved: (newValue) => formData['name'] = newValue!,
            //       ),
            //     ),
            //   ],
            // ),
            Row(
              children: [
                Flexible(
                  child: TextFormField(
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
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: TextFormField(
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
                ),
              ],
            ),

            TextFormField(
              decoration: const InputDecoration(labelText: 'ID'),
              validator: (value) {
                if (value!.trim().length > 50) {
                  return 'máximo 50 dígitos';
                }

                // else if (value != value.toLowerCase()) {
                //   return 'somente letras minúsculas';
                // }
                return null;
              },
              onSaved: (newValue) => formData['idTruck'] = newValue!,
            ),
            const SizedBox(height: 10),

            users.indexOne
                ? Container(
                    color: Colors.grey.shade400,
                    child: Column(
                      children: [
                        Text(
                          DateFormat('dd/MM/y').format(DateTime.now()),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '00:00-04:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 0;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '04:00-08:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream2,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);

                                          numberWindow = 1;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '08:00-12:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream3,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 2;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '12:00-16:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream4,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);

                                          numberWindow = 3;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '16:00-20:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream5,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);

                                          numberWindow = 4;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '20:00-23:59',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream6,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);

                                          numberWindow = 5;
                                        },
                                      );
                                    },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 10),
            users.indexTwo
                ? Container(
                    color: Colors.blueAccent.withOpacity(0.5),
                    child: Column(
                      children: [
                        Text(
                          DateFormat(
                            'dd/MM/y',
                          ).format(DateTime.now().add(Duration(days: 1))),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '00:00-04:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream7,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);

                                          numberWindow = 0;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '04:00-08:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream8,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 1;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '08:00-12:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream9,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 2;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '12:00-16:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream10,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 3;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '16:00-20:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream11,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 4;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '20:00-23:59',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream12,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 5;
                                        },
                                      );
                                    },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
            const SizedBox(height: 10),
            users.indexThree
                ? Container(
                    color: Colors.orangeAccent.withOpacity(0.5),
                    child: Column(
                      children: [
                        Text(
                          DateFormat(
                            'dd/MM/y',
                          ).format(DateTime.now().add(Duration(days: 2))),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                '00:00-04:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream13,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 0;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '04:00-08:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream14,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 1;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '08:00-12:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream15,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 2;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '12:00-16:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream16,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController17.sink.add(false);
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 3;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '16:00-20:00',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream17,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(
                                            changedValue!,
                                          );
                                          _checkBoxController18.sink.add(false);
                                          numberWindow = 4;
                                        },
                                      );
                                    },
                              ),
                              const Text(
                                '20:00-23:59',
                                style: TextStyle(fontSize: 12),
                              ),
                              StreamBuilder(
                                stream: _checkBoxStream18,
                                initialData: false,
                                builder:
                                    (
                                      BuildContext context,
                                      AsyncSnapshot<bool> snapshot,
                                    ) {
                                      return Checkbox(
                                        value: snapshot.data,
                                        onChanged: (changedValue) {
                                          _checkBoxController.sink.add(false);
                                          _checkBoxController2.sink.add(false);
                                          _checkBoxController3.sink.add(false);
                                          _checkBoxController4.sink.add(false);
                                          _checkBoxController5.sink.add(false);
                                          _checkBoxController6.sink.add(false);
                                          _checkBoxController7.sink.add(false);
                                          _checkBoxController8.sink.add(false);
                                          _checkBoxController9.sink.add(false);
                                          _checkBoxController10.sink.add(false);
                                          _checkBoxController11.sink.add(false);
                                          _checkBoxController12.sink.add(false);
                                          _checkBoxController13.sink.add(false);
                                          _checkBoxController14.sink.add(false);
                                          _checkBoxController15.sink.add(false);
                                          _checkBoxController16.sink.add(false);
                                          _checkBoxController17.sink.add(false);

                                          _checkBoxController18.sink.add(
                                            changedValue!,
                                          );
                                          numberWindow = 5;
                                        },
                                      );
                                    },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
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
                  Provider.of<Users>(
                    context,
                    listen: false,
                  ).putNew(
                    
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
