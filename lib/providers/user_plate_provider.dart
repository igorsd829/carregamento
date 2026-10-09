import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user_plate_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Users with ChangeNotifier {
  var baseUrl = 'https://projeto-extensionista-28134-default-rtdb.firebaseio.com';
   bool isUserAdm = false;
   bool logado = false;

  bool admMaster = false;
  bool authorized = false;
  String setorUarioLogado = '';
  final indexImage = Random().nextInt(12);
  late String idUsuarioLogado;
  late String nameUarioLogado;
  late String unidadeUser = '';
  late int setorUserLog;
  String setorUserAdm = '';
  FirebaseAuth auth = FirebaseAuth.instance;

  void recuperarDadosUsuarioLogado() {
    User? usuarioAtual = auth.currentUser;
    if (usuarioAtual != null) {
      idUsuarioLogado = usuarioAtual.uid.toString();
      logado = true;
      notifyListeners();
    } else {
      return;
    }
  }
 
  Map<String, UserPlate> listNewMockUrl = {};

  Map<String, UserPlate> listNew = {
  
  };
  Map<String, UserPlate> listNewTwo = {};
  Map<String, UserPlate> listNewThree = {};

  Map<String, UserPlate> listTrucksLoading = {
   
  };
  Map<String, UserPlate> listTrucksLoaded = {
    
  };
  Map<String, UserPlate> listTrucksAllLoaded = {};
  Map<String, UserPlate> listTrucksOffline = {};

  get convert => null;
  int get countTrucks {
    if (indexThree) {
      return listNewThree.length;
    } else if (indexTwo) {
      return listNewTwo.length;
    } else {
      return listNew.length;
    }
  }

  int get countTrucksTwo {
    return listNewTwo.length;
  }

  int get countTrucksOne {
    return listNew.length;
  }

  int get countTrucksThree {
    return listNewThree.length;
  }

  int get countTrucksLoading {
    return listTrucksLoading.length;
  }

  int get countTrucksLoaded {
    return listTrucksLoaded.length;
  }

  int get countTrucksAllLoaded {
    return listTrucksAllLoaded.length;
  }

  UserPlate byIndexNew(int i) {
    return listNew.values.elementAt(i);
  }

  void loadAllTrucks() {}

  void clearListOffline() {
    listTrucksOffline = {};
  }

  void clearLists() {
    isUserAdm = false;
    admMaster = false;
    authorized = false;
    idUsuarioLogado = '';
    nameUarioLogado = '';
    unidadeUser = '';
    setorUarioLogado = '';
    setorUserAdm = '';
    listNew = {};
    listNewTwo = {};
    listNewThree = {};
    listTrucksLoading = {};
    listTrucksLoaded = {};
  }

  bool indexOne = true;
  bool indexTwo = false;
  bool indexThree = false;

  void indexWindowUpdate(int index) {
    if (index == 2) {
      indexThree = true;
      indexOne = false;
      indexTwo = false;
    } else if (index == 1) {
      indexTwo = true;
      indexThree = false;
      indexOne = false;
    } else {
      indexOne = true;
      indexTwo = false;
      indexThree = false;
    }
    notifyListeners();
  }

  bool timeTurnWindows = false;
  void turnWindows() {
    timeTurnWindows = !timeTurnWindows;
    notifyListeners();
  }

  timeNow(DateTime? time) {
    var hourTime = DateTime.now();
    time = hourTime;
    notifyListeners();
  }

  void isNotFound(UserPlate? user) {
    if (user == null) {
      return;
    } else {
      var idUser = user.id;
      user.ready = true;
      listNew.update(idUser.toString(), (existingUser) {
        existingUser.ready = user.ready;
        existingUser.loading = user.loading;
        existingUser.autorized = user.autorized;
        existingUser.problem = user.problem;
        existingUser.notFound = true;

        notifyListeners();
        return existingUser;
      });
    }
  }

  void isNotFoundLoading(UserPlate? user) {
    if (user == null) {
      return;
    } else {
      var idUser = user.id;
      listNew.update(idUser.toString(), (existingUser) {
        existingUser.ready = user.ready;
        existingUser.loading = user.loading;
        existingUser.autorized = user.autorized;
        existingUser.problem = user.problem;
        existingUser.notFound = false;
        notifyListeners();
        return existingUser;
      });
    }
  }

  void noProblem(UserPlate? user) {
    if (user == null) {
      return;
    } else {
      user.ready = true;
      var idUser = user.id;
      listNew.update(idUser.toString(), (existingUser) {
        existingUser.ready = user.ready;
        existingUser.loading = user.loading;
        existingUser.autorized = user.autorized;
        existingUser.problem = false;
        existingUser.notFound = user.notFound;

        notifyListeners();
        return existingUser;
      });
    }
  }

  String warning = '';
  String status = 'sem internet';
  bool statusOpen = false;
  bool statusStoped = false;
  bool statusClosed = false;
  bool noInternet = true;

  void warnigStatusInite() {}
  void isAutorized(UserPlate? user, bool? send, bool? loading) {
    if (user == null) {
      return;
    } else {
      // send = true;
      user.loading = true;

      var idUser = user.id;
      user.ready = true;
      listNew.update(idUser.toString(), (existingUser) {
        existingUser.ready = user.ready;
        existingUser.loading = user.loading;
        existingUser.autorized = true;
        existingUser.problem = user.problem;
        existingUser.notFound = user.notFound;
        notifyListeners();
        return existingUser;
      });
    }
  }

  Future<void> loadWarnig() async {}

  void addWarnig(String warning) {}

  void clearWarnig() {}

  String expedition = '';
  Future<void> loadExpedition() async {}

  void addExpeditionInit() {}

  void addExpedition(String expedition) {}

  void clearExpedition() {}

  void clearExpeditionAndAddAll(double all) {}

  void editTruck(UserPlate? user) async {
    if (user == null) {
      return;
    } else {
      user.ready = true;
      var idUser = user.id;
      listNew.update(idUser.toString(), (existingUser) {
        existingUser.ready = user.ready;
        existingUser.plate = user.plate;

        existingUser.loading = user.loading;
        existingUser.autorized = user.autorized;
        existingUser.problem = user.problem;
        existingUser.notFound = user.notFound;
        notifyListeners();
        return existingUser;
      });
    }
  }

  void editTruckWeight(UserPlate? user, String peso) {}

  void truckReady(UserPlate? user) {
    if (user == null) {
      return;
    } else {
      user.ready = true;
      var idUser = user.id;
      listNew.update(idUser.toString(), (existingUser) {
        existingUser.ready = true;
        existingUser.loading = false;
        existingUser.loaded = false;
        notifyListeners();
        return existingUser;
      });
    }
  }

  void cancelTruckReady(UserPlate? user) {
    if (user == null) {
      return;
    } else {
      user.ready = true;
      var idUser = user.id;
      listNew.update(idUser.toString(), (existingUser) {
        existingUser.ready = false;
        existingUser.loading = false;
        existingUser.loaded = false;
        notifyListeners();
        return existingUser;
      });
    }
  }

  void removeTruckList(UserPlate? user) {
    listNew.remove(user!.id);
    notifyListeners();
  }

  void removeTruckLoadingList(UserPlate? user) {
    listTrucksLoading.remove(user!.id);
    notifyListeners();
  }

  void removeTruckLoaded(UserPlate? user) {
    listTrucksLoaded.remove(user!.id);
    notifyListeners();
  }

  void allRemove() {
    notifyListeners();
  }

  void removeTruckAllLoaded() {}

  void putNew(UserPlate? user) async {
    var key = Random().nextInt(100).toString();
    listNew.putIfAbsent(
      key,
      () => UserPlate(
        id: key,
        name: user!.name,
        plate: user.plate,
        date: user.date,
        client: user.client,
        colorTruck: user.colorTruck,
        autorized: user.autorized,
        loaded: user.loaded,
        loading: user.loading,
        enterTime: user.enterTime,
        outTime: user.outTime,
        notFound: user.notFound,
        brandTruck: user.brandTruck,
        ready: user.ready,
        weight: user.weight,
        obs: user.obs,
        idTruck: user.idTruck,
        window: user.window,
      ),
    );
    notifyListeners();
  }

  void addTruckListLoading(UserPlate? user) {
    if (user == null) {
      return;
    } else {
      listTrucksLoading.putIfAbsent(
        user.id.toString(),
        () => UserPlate(
          id: user.id,
          name: user.name,
          plate: user.plate,
          date: user.date,
          client: user.client,
          colorTruck: user.colorTruck,
          autorized: user.autorized,
          loaded: user.loaded,
          loading: true,
          enterTime: user.enterTime,
          outTime: user.outTime,
          notFound: user.notFound,
          brandTruck: user.brandTruck,
          ready: false,
          weight: user.weight,
          obs: user.obs,
          idTruck: user.idTruck,
          window: user.window,
        ),
      );
      listNew.remove(user.id);
      notifyListeners();
    }
  }

  void addTruckListLoaded(UserPlate? user) {
    if (user == null) {
      return;
    } else {
      listTrucksLoaded.putIfAbsent(
        user.id.toString(),
        () => UserPlate(
          id: user.id,
          name: user.name,
          plate: user.plate,
          date: DateTime.now(),
          client: user.client,
          colorTruck: user.colorTruck,
          autorized: user.autorized,
          loaded: true,
          loading: false,
          enterTime: DateTime.now(),
          outTime: DateTime.now(),
          notFound: user.notFound,
          brandTruck: user.brandTruck,
          ready: user.ready,
          weight: user.weight,
          obs: user.obs,
          idTruck: user.idTruck,
          window: user.window,
        ),
      );
      listTrucksLoading.remove(user.id);
      notifyListeners();
    }
  }

  // v
  void addTruckListAllLoaded() async {
    listTrucksLoaded.forEach((key, user) async {
      listTrucksLoaded.putIfAbsent(
        Random().nextInt(100).toString(),
        () => UserPlate(
          id: Random().nextInt(100).toString(),
          name: user.name,
          plate: user.plate,
          date: user.date,
          client: user.client,
          colorTruck: user.colorTruck,
          autorized: user.autorized,
          loaded: user.loaded,
          loading: user.loading,
          enterTime: user.enterTime,
          outTime: user.outTime,
          notFound: user.notFound,
          brandTruck: user.brandTruck,
          ready: user.ready,
          weight: user.weight,
          obs: user.obs,
          idTruck: user.idTruck,
          window: user.window,
        ),
      );
      notifyListeners();
    });
  }

  void removeNew(UserPlate user) {
    // ignore: unnecessary_null_comparison
    if (user != null && user.id != null) {
      listNew.remove(user.id);
      notifyListeners();
    }
  }

  void autorizated(UserPlate user) {
    // ignore: unnecessary_null_comparison
    if (user != null && user.id != null) {
      user.loading = true;
      notifyListeners();
    }
  }

  void notAutorizated(UserPlate user) {
    // ignore: unnecessary_null_comparison
    if (user != null && user.id != null) {
      user.notFound = true;
      notifyListeners();
      UserPlate(name: 'seu nome', plate: 'abc1d23', date: DateTime.now());
    }
    return;
  }
String adSupercal =
      'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/Imagem%20do%20WhatsApp%20de%202024-05-18%20%C3%A0(s)%2008.48.29_8f51f0a0.jpg?alt=media&token=58a80f49-8abd-4f61-8250-8d28eccf03c6';
  //////////////////////// ADD AVISO IMAGEM URL //////////////////////////////////////////
  void showAlertToChauffeur(
    BuildContext context, String adSupercal,
  ) {
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
                      opacity:  0.9,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: adSupercal,
                        placeholder:
                            (context, url) => SizedBox(
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
                          Navigator.of(
                            context,
                          ).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black54,
                            // shape: const RoundedRectangleBorder(),
                            backgroundColor: Colors.grey.shade200),
                        child: const Text(
                          'ENTENDI',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ))
                  ],
                ),
              );
            });
      });
    }
  }


  //////////////////////// ADD AVISO IMAGEM URL //////////////////////////////////////////
  

  void loadAdSupercal() async {
    await http.get(Uri.parse('$baseUrl/adsupercal.json')).then((response) {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data['adsupercal'] == '') {
        adSupercal =
            'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/Imagem%20do%20WhatsApp%20de%202024-05-18%20%C3%A0(s)%2008.48.29_8f51f0a0.jpg?alt=media&token=58a80f49-8abd-4f61-8250-8d28eccf03c6';
        return;
      } else {
        adSupercal = data['adsupercal'];
        notifyListeners();
      }
    });
  }

  void adsInit() {
    http
        .put(Uri.parse('$baseUrl/adsupercal.json'),
            body: jsonEncode({
              'adsupercal':
                  'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/Imagem%20do%20WhatsApp%20de%202024-05-18%20%C3%A0(s)%2008.48.29_8f51f0a0.jpg?alt=media&token=58a80f49-8abd-4f61-8250-8d28eccf03c6',
            }))
        .then((value) {
      loadExpedition();
      notifyListeners();
    });
  }

  void addNewAds(String ads) {
    http
        .put(Uri.parse('$baseUrl/adsupercal.json'),
            body: jsonEncode({
              'adsupercal': ads,
            }))
        .then((value) {
      loadExpedition();
      notifyListeners();
    });
  }

  void clearAdsSupercal() {
    http
        .put(Uri.parse('$baseUrl/adsupercal.json'),
            body: jsonEncode({
              'adsupercal': '',
            }))
        .then((value) {
      loadExpedition();
      notifyListeners();
    });
  }
  
}
