import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddWarnigCardAds extends StatefulWidget {
  const AddWarnigCardAds({super.key});

  @override
  State<AddWarnigCardAds> createState() => _AddWarnigCardAdsState();
}

class _AddWarnigCardAdsState extends State<AddWarnigCardAds> {
  final form = GlobalKey<FormState>();
  String formData = '';
  @override
  Widget build(BuildContext context) {
    return Form(
      key: form,
      child: Column(
        children: [
          TextFormField(
              decoration: const InputDecoration(labelText: 'LINK DA IMAGEM'),
              validator: (value) {
                // if (value!.trim().length > 300) {
                //   return 'máximo 100 dígitos';
                // }

                return null;
              },
              onSaved: (newValue) => formData = newValue!),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                      Provider.of<Users>(context, listen: false)
                          .addNewAds(formData);

                      Provider.of<Users>(context, listen: false)
                          .loadAdSupercal();

                      Navigator.of(context).pop();
                    }
                    Provider.of<Users>(context, listen: false).loadAdSupercal();
                  },
                  child: Text(
                    'SALVAR',
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 25),
                  )),
              IconButton(
                  onPressed: () {
                    // Provider.of<Users>(context, listen: false).clearWarnig();
                    Provider.of<Users>(context, listen: false).adsInit();
                    Provider.of<Users>(context, listen: false).loadAdSupercal();
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.refresh)),
              IconButton(
                  onPressed: () {
                    Provider.of<Users>(context, listen: false)
                        .clearAdsSupercal();
                    Provider.of<Users>(context, listen: false).loadAdSupercal();
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.delete))
            ],
          )
        ],
      ),
    );
  }
}
