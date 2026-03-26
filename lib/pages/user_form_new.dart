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
      appBar: AppBar(title: const Text('Formulário')),
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
                    onSaved: (newValue) => _formData['plate'] = newValue!,
                  ),
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
                  const SizedBox(height: 10),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black54,
                      shape: const RoundedRectangleBorder(),
                      backgroundColor: Colors.grey.shade200,
                      elevation: 5,
                    ),
                    onPressed: () {
                      final bool isValid = _form.currentState!.validate();
                      if (isValid) {
                        _form.currentState!.save();
                        Provider.of<Users>(context, listen: false).editTruck(
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
                            date: _formData['date'],
                          ),
                        );
                        Navigator.of(context).pop();
                      }
                      // Provider.of<Users>(context, listen: false).loadTrucks();
                    },
                    child: Text(
                      'SALVAR',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ),
    );
  }
}
