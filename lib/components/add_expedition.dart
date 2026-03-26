import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddExpedition extends StatefulWidget {
  const AddExpedition({super.key});

  @override
  State<AddExpedition> createState() => _AddExpeditionState();
}

class _AddExpeditionState extends State<AddExpedition> {
  @override
  void initState() {
    super.initState();
    Provider.of<Users>(context, listen: false).loadExpedition();
  }

  final form = GlobalKey<FormState>();
  String formData = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'EXPEDIDO'),
            validator: (value) {
              if (value!.trim().length > 100) {
                return 'máximo 20 dígitos';
              }

              return null;
            },
            onSaved: (newValue) => formData = newValue!,
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                    ).addExpedition(formData);

                    Provider.of<Users>(context, listen: false).loadExpedition();

                    Navigator.of(context).pop();
                  }
                  Provider.of<Users>(context, listen: false).loadExpedition();
                },
                child: Text(
                  'SALVAR',
                  style: TextStyle(color: Colors.grey.shade700, fontSize: 25),
                ),
              ),
              IconButton(
                onPressed: () {
                  Provider.of<Users>(
                    context,
                    listen: false,
                  ).addExpeditionInit();
                  Provider.of<Users>(context, listen: false).loadExpedition();
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () {
                  Provider.of<Users>(context, listen: false).clearExpedition();
                  Provider.of<Users>(context, listen: false).loadExpedition();
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
