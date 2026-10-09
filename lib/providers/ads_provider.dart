import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carregamento_conectado/models/ads_image_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class ProviderAdsItem with ChangeNotifier {
  List<AdsImageModel> listPromptsFirestore = [];
  String adSupercal = '';
  bool masculino = true;
  bool feminino = false;
  List<AdsImageModel> listPromptsFiltrada = [];

  Future<List<AdsImageModel>> getPromptImages() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('promptImages')
          .get();
      List<AdsImageModel> promptImages = querySnapshot.docs.map((doc) {
        return AdsImageModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      listPromptsFirestore = promptImages;
      if (promptImages.isNotEmpty) {
        adSupercal =
            promptImages.first.imageUrl; // .first é mais elegante que [0]
      } else {
        // Opcional: definir um valor padrão caso não tenha imagens
        adSupercal = '';
      }

      // if (masculino) {
      //   filtrarLista(PromptImageType.man, true);
      // } else {
      //   filtrarLista(PromptImageType.woman, true);
      // }
      return promptImages;
    } catch (e) {
      debugPrint('Erro ao recuperar PromptImages: $e');
      return [];
    }
  }

  Future<void> excluirTodasAsImagens(BuildContext context, Uint8List? _arquivoImagemSelecionado) async {
    try {
      // 1. Busca todos os documentos da coleção
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('promptImages')
          .get();

      List<AdsImageModel> promptImages = querySnapshot.docs.map((doc) {
        return AdsImageModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();

      // Se a tela não estiver mais ativa após o 'await', interrompe
      if (!context.mounted) return;

      // Caso a lista já esteja vazia
      if (promptImages.isEmpty) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Aviso'),
            content: const Text('Não há nenhuma imagem para excluir.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
        );
        return;
      }

      // 2. Apaga todas as imagens do Storage em PARALELO
      List<Future<void>> tarefasStorage = [];
      for (AdsImageModel imagem in promptImages) {
        if (imagem.imageUrl.isNotEmpty) {
          tarefasStorage.add(
            FirebaseStorage.instance
                .refFromURL(imagem.imageUrl)
                .delete()
                .catchError((e) => debugPrint('Erro Storage: $e')),
          );
        }
      }
      await Future.wait(tarefasStorage);

      // 3. Apaga os registros do Firestore em LOTE (Batch)
      WriteBatch batch = FirebaseFirestore.instance.batch();
      for (AdsImageModel imagem in promptImages) {
        DocumentReference docRef = FirebaseFirestore.instance
            .collection('promptImages')
            .doc(imagem.id);
        batch.delete(docRef);
      }
      await batch.commit();

      // 4. Reseta as variáveis da classe/controller
      listPromptsFirestore.clear();
      // _arquivoImagemSelecionado = null;
      notifyListeners();
      adSupercal = '';

      debugPrint('Todas as imagens foram excluídas com sucesso!');

      // 5. Exibe Dialog de SUCESSO
      if (!context.mounted) return;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sucesso!'),
            content: const Text(
              'Todas as imagens foram excluídas com sucesso.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  listPromptsFirestore.clear();
                  getPromptImages();
                  // _arquivoImagemSelecionado!.clear();
                  adSupercal = '';
                  notifyListeners();
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      debugPrint('Erro ao tentar excluir as PromptImages: $e');

      // Exibe Dialog de ERRO
      if (!context.mounted) return;

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Erro!'),
            content: const Text(
              'Ocorreu um erro ao tentar excluir as imagens. Tente novamente.',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void showAlertToChauffeur(BuildContext context) {
    {
      Future.delayed(Duration(milliseconds: 100)).then((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  // Container(
                  //   child: Padding(
                  //       padding: const EdgeInsets.all(8.0),
                  //       child: ClipRRect(
                  //         borderRadius: BorderRadius.circular(20),
                  //         child: Image.network(
                  //           adSupercal,
                  //           width: 400,
                  //         ),
                  //       )),
                  // ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Opacity(
                      opacity: 0.9,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: adSupercal,
                        placeholder: (context, url) => SizedBox(
                          width: 50,
                          height: 50,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black54,
                      // shape: const RoundedRectangleBorder(),
                      backgroundColor: Colors.grey.shade200,
                    ),
                    child: const Text(
                      'ENTENDI',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      });
    }
  }
}
