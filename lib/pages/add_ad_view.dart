import 'dart:typed_data';
import 'package:carregamento_conectado/models/ads_image_model.dart';
import 'package:carregamento_conectado/providers/ads_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddAds extends StatefulWidget {
  const AddAds({super.key});

  @override
  State<AddAds> createState() => _AddAdsState();
}

class _AddAdsState extends State<AddAds> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  List<AdsImageModel> promptImagesItem = [];
  final formTitulo = GlobalKey<FormState>();
  final formPrompt = GlobalKey<FormState>();
  final Map<String, Object> formData = {};
  Uint8List? _arquivoImagemSelecionado;
  bool _isSaving = false;

  _selecionarImagem() async {
    final ImagePicker picker = ImagePicker();
    XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Uint8List bytes = await image.readAsBytes();
      setState(() {
        _arquivoImagemSelecionado = bytes;
      });
    }
  }

  Future<void> _salvarPromptImage() async {
    if (_arquivoImagemSelecionado == null) return;

    setState(() {
      _isSaving = true;
    });

    try {
      final firestore = FirebaseFirestore.instance;

      final snapshot = await firestore.collection('promptImages').get();
      for (var doc in snapshot.docs) {
        await firestore.collection('promptImages').doc(doc.id).delete();
      }

      final Reference reference = storage.ref().child(
        'imagens/${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      final SettableMetadata metadata = SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'maxUploadSize': '100MB'},
      );

      await reference.putData(_arquivoImagemSelecionado!, metadata);

      final String downloadUrl = await reference.getDownloadURL();

      AdsImageModel promptImage = AdsImageModel(
        id: firestore.collection('promptImages').doc().id,
        imageUrl: downloadUrl,
      );

      await firestore
          .collection('promptImages')
          .doc(promptImage.id)
          .set(promptImage.toJson());

      debugPrint('PromptImage antigo substituído e novo salvo com sucesso!');

      if (!mounted) return;

      setState(() {
        _arquivoImagemSelecionado = null;
        _isSaving = false;
      });

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Sucesso!'),
            content: const Text('Arquivo salvo com sucesso!'),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.of(dialogContext).pop();

                  await Provider.of<ProviderAdsItem>(
                    context,
                    listen: false,
                  ).getPromptImages();

                  if (!mounted) return;
                  Navigator.of(context).pushReplacementNamed(AppRoutes.home);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (error) {
      debugPrint('Erro ao salvar imagem: $error');

      if (!mounted) return;

      setState(() {
        _isSaving = false;
      });

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erro!'),
            content: const Text('Erro ao salvar o arquivo! Tente novamente.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;
    double alturaTela = MediaQuery.of(context).size.height;
    double larguraTela = MediaQuery.of(context).size.width;
    final provider = Provider.of<ProviderAdsItem>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade300,
        title: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: isPortraitPhoneSize ? 18 : 35,
                child: Image.asset(
                  'assets/images/supercal_login.png',
                  fit: BoxFit.contain,
                ),
              ),
              const Expanded(child: SizedBox()),
            ],
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                _arquivoImagemSelecionado != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: _isSaving
                            ? SizedBox(
                                width: larguraTela * 0.5,
                                height: alturaTela * 0.4,
                                child: const Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : Image.memory(
                                _arquivoImagemSelecionado!,
                                height: alturaTela * 0.4,
                                fit: BoxFit.contain,
                              ),
                      )
                    : Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: Colors.grey, width: 4),
                        ),
                        height: alturaTela * 0.4,
                        width: larguraTela * 0.5,
                        child: provider.listPromptsFirestore.isEmpty
                            ? const Center(
                                child: Text(
                                  'Adicione a imagem de aviso aqui',
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Center(
                                child: Image.network(
                                  provider.listPromptsFirestore[0].imageUrl,
                                  fit: BoxFit.cover,
                                ),
                              ),
                      ),
                const SizedBox(height: 24),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(),
                  onPressed: _selecionarImagem,
                  child: const Text('Selecionar imagem'),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.list,
                        size: 40,
                        color: Colors.transparent,
                      ),
                    ),
                    const SizedBox(width: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(),
                      onPressed: () {
                        _salvarPromptImage();
                      },
                      child: const Text('Salvar imagem'),
                    ),
                    const SizedBox(width: 24),
                    IconButton(
                      onPressed: () {
                        provider.excluirTodasAsImagens(
                          context,
                          _arquivoImagemSelecionado,
                        );
                      },
                      icon: const Icon(Icons.delete, size: 40),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
