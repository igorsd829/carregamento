import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/user_plate_model.dart';
import '../../providers/user_plate_provider.dart';

class UserFormNew extends StatefulWidget {
  final bool loading;
  const UserFormNew({this.loading = false, super.key});

  @override
  State<UserFormNew> createState() => _UserFormNewState();
}

class _UserFormNewState extends State<UserFormNew> {
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  void _loadFormData(UserPlate? user) {
    if (user != null) {
      _formData['id'] = user.id!;
      _formData['idTruck'] = user.idTruck;
      _formData['obs'] = user.obs;
      _formData['name'] = user.name;
      _formData['plate'] = user.plate;
      _formData['date'] = user.date;
      _formData['enterTime'] = user.enterTime;
      _formData['outTime'] = user.outTime;
      _formData['autorized'] = user.autorized;
      _formData['colorTruck'] = user.colorTruck;
      _formData['client'] = user.client;
      _formData['loading'] = user.loading;
      _formData['loaded'] = user.loaded;
      _formData['notFound'] = user.notFound;
      _formData['brandTruck'] = user.brandTruck;
      _formData['weight'] = user.weight;
      _formData['window'] = user.window;
    }
  }

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

  

  @override
  void dispose() {
    _checkBoxController.close();
    _checkBoxController2.close();
    _checkBoxController3.close();
    _checkBoxController4.close();
    _checkBoxController5.close();
    _checkBoxController6.close();
    
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var user = ModalRoute.of(context)!.settings.arguments as UserPlate;
    // var load = ModalRoute.of(context)!.settings.arguments as bool ;
    // Provider.of<Users>(context, listen: false).upDateTrucks(load);

    _loadFormData(user);
  }

  bool load = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child:
            // Center(child: Text('Users'),)
            Form(
          key: _form,
          child: Column(
            children: [
              TextFormField(
                  initialValue: _formData['plate'].toString(),
                  // _formData['plate'].toString()
                  decoration: const InputDecoration(labelText: 'Placa'),
                  validator: (value) {
                    // if (value!.trim().length < 7 || value.trim().length > 7) /////////// usar esse
                    if (value!.trim().isEmpty) {
                      return 'deve conter 7 digitos meu amigo';
                    }
                    return null;
                  },
                  onSaved: (newValue) => _formData['plate'] = newValue!),
              TextFormField(
                initialValue: _formData['name'].toString(),
                decoration: const InputDecoration(labelText: 'Nome'),
                onSaved: (newValue) => _formData['name'] = newValue!,
              ),
              TextFormField(
                initialValue: _formData['client'].toString(),
                decoration: const InputDecoration(labelText: 'Cliente'),
                onSaved: (newValue) => _formData['client'] = newValue!,
              ),
              TextFormField(
                initialValue: _formData['obs'].toString(),
                decoration: const InputDecoration(labelText: 'Observação'),
                onSaved: (newValue) => _formData['obs'] = newValue!,
              ),
              TextFormField(
                initialValue: _formData['idTruck'].toString(),
                decoration: const InputDecoration(labelText: 'ID'),
                onSaved: (newValue) => _formData['idTruck'] = newValue!,
              ),
              const SizedBox(height: 20),
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
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            return Checkbox(
                                value: snapshot.data,
                                onChanged: (changedValue) {
                                  _checkBoxController.sink.add(changedValue!);
                                  _checkBoxController2.sink.add(false);
                                  _checkBoxController3.sink.add(false);
                                  _checkBoxController4.sink.add(false);
                                  _checkBoxController5.sink.add(false);
                                  _checkBoxController6.sink.add(false);
                                  
                                  _formData['window'] = 0;
                                });
                          }),
                      const Text(
                        '04:00-08:00',
                        style: TextStyle(fontSize: 12),
                      ),
                      StreamBuilder(
                          stream: _checkBoxStream2,
                          initialData: false,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            return Checkbox(
                                value: snapshot.data,
                                onChanged: (changedValue) {
                                  _checkBoxController.sink.add(false);
                                  _checkBoxController2.sink.add(changedValue!);
                                  _checkBoxController3.sink.add(false);
                                  _checkBoxController4.sink.add(false);
                                  _checkBoxController5.sink.add(false);
                                  _checkBoxController6.sink.add(false);
                                  
                                  _formData['window'] = 1;
                                });
                          }),
                      const Text(
                        '08:00-12:00',
                        style: TextStyle(fontSize: 12),
                      ),
                      StreamBuilder(
                          stream: _checkBoxStream3,
                          initialData: false,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            return Checkbox(
                                value: snapshot.data,
                                onChanged: (changedValue) {
                                  _checkBoxController.sink.add(false);
                                  _checkBoxController2.sink.add(false);
                                  _checkBoxController3.sink.add(changedValue!);
                                  _checkBoxController4.sink.add(false);
                                  _checkBoxController5.sink.add(false);
                                  _checkBoxController6.sink.add(false);
                                  
                                  _formData['window'] = 2;
                                });
                          }),
                      const Text(
                        '12:00-16:00',
                        style: TextStyle(fontSize: 12),
                      ),
                      StreamBuilder(
                          stream: _checkBoxStream4,
                          initialData: false,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            return Checkbox(
                                value: snapshot.data,
                                onChanged: (changedValue) {
                                  _checkBoxController.sink.add(false);
                                  _checkBoxController2.sink.add(false);
                                  _checkBoxController3.sink.add(false);
                                  _checkBoxController4.sink.add(changedValue!);
                                  _checkBoxController5.sink.add(false);
                                  _checkBoxController6.sink.add(false);
                                  
                                  _formData['window'] = 3;
                                });
                          }),
                      const Text(
                        '16:00-20:00',
                        style: TextStyle(fontSize: 12),
                      ),
                      StreamBuilder(
                          stream: _checkBoxStream5,
                          initialData: false,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            return Checkbox(
                                value: snapshot.data,
                                onChanged: (changedValue) {
                                  _checkBoxController.sink.add(false);
                                  _checkBoxController2.sink.add(false);
                                  _checkBoxController3.sink.add(false);
                                  _checkBoxController4.sink.add(false);
                                  _checkBoxController5.sink.add(changedValue!);
                                  _checkBoxController6.sink.add(false);
                                  
                                  _formData['window'] = 4;
                                });
                          }),
                      const Text(
                        '20:00-23:59',
                        style: TextStyle(fontSize: 12),
                      ),
                      StreamBuilder(
                          stream: _checkBoxStream6,
                          initialData: false,
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> snapshot) {
                            return Checkbox(
                                value: snapshot.data,
                                onChanged: (changedValue) {
                                  _checkBoxController.sink.add(false);
                                  _checkBoxController2.sink.add(false);
                                  _checkBoxController3.sink.add(false);
                                  _checkBoxController4.sink.add(false);
                                  _checkBoxController5.sink.add(false);
                                  _checkBoxController6.sink.add(changedValue!);
                                  
                                  _formData['window'] = 5;

                                });
                          }),
                    ]),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black54,
                      shape: const RoundedRectangleBorder(),
                      backgroundColor: Colors.grey.shade200,
                      elevation: 5),
                  onPressed: () {
                    final bool isValid = _form.currentState!.validate();
                    if (isValid) {
                      _form.currentState!.save();
                      Provider.of<Users>(context, listen: false).
                      editTruck(
                          UserPlate(
                              id: _formData['id'],
                              obs: _formData['obs'],
                              name: _formData['name'],
                              plate: _formData['plate'],
                              weight: _formData['weight'],
                              autorized: _formData['autorized'],
                              client: _formData['client'],
                              colorTruck: _formData['colorTruck'],
                              enterTime: _formData['enterTime'],
                              loaded: _formData['loaded'],
                              loading: _formData['loading'],
                              notFound: _formData['notFound'],
                              outTime: _formData['outTime'],
                              idTruck: _formData['idTruck'],
                              window: _formData['window'],
                              date: _formData['date']));
                      Navigator.of(context).pop();
                    }
                    // Provider.of<Users>(context, listen: false).loadTrucks();
                  },
                  child: Text(
                    'SALVAR',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 25),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
