import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/user_plate_model.dart';

class Users with ChangeNotifier {
  final indexImage = Random().nextInt(12);
  // var baseUrl = 'https://fila-supercal-default-rtdb.firebaseio.com';
  Map<String, UserPlate> listNewMockUrl = {};

  Map<String, UserPlate> listNew = {
    '123': UserPlate(
      date: DateTime.now(),
      outTime: DateTime.now(),
      enterTime: DateTime.now(),
      plate: 'qwe1212',
      autorized: false,
      brandTruck: '',
      id: '123',
      colorTruck: 'blue',
      name: 'Igor',
    ),
    '234': UserPlate(
      date: DateTime.now(),
      outTime: DateTime.now(),
      enterTime: DateTime.now(),
      plate: 'qwe1212',
      autorized: false,
      brandTruck: '',
      id: '234',
      colorTruck: 'pink',
      name: 'Amanda',
    ),
    '345': UserPlate(
      date: DateTime.now(),
      outTime: DateTime.now(),
      enterTime: DateTime.now(),
      plate: 'qwe1212',
      autorized: false,
      brandTruck: '',
      id: '345',
      colorTruck: 'green',
      name: 'Flávio',
    ),
  };
  Map<String, UserPlate> listNewTwo = {};
  Map<String, UserPlate> listNewThree = {};

  Map<String, UserPlate> listTrucksLoading = {
    '456': UserPlate(
      date: DateTime.now(),
      outTime: DateTime.now(),
      enterTime: DateTime.now(),
      plate: 'qwe1212',
      autorized: false,
      brandTruck: '',
      id: '456',
      colorTruck: 'blue',
      name: 'Igor',
      loading: true,
    ),
    '567': UserPlate(
      date: DateTime.now(),
      outTime: DateTime.now(),
      enterTime: DateTime.now(),
      plate: 'qwe1212',
      autorized: false,
      brandTruck: '',
      id: '567',
      colorTruck: 'pink',
      name: 'Amanda',
      loading: true,
    ),
    '678': UserPlate(
      date: DateTime.now(),
      outTime: DateTime.now(),
      enterTime: DateTime.now(),
      plate: 'qwe1212',
      autorized: false,
      brandTruck: '',
      id: '678',
      colorTruck: 'green',
      name: 'Flávio',
      loading: true,
    ),
  };
  Map<String, UserPlate> listTrucksLoaded = {
    '789': UserPlate(
      date: DateTime.now(),
      outTime: DateTime.now(),
      enterTime: DateTime.now(),
      plate: 'qwe1212',
      autorized: false,
      brandTruck: '',
      id: '789',
      colorTruck: 'blue',
      name: 'Igor',
      loaded: true,
    ),
    '101112': UserPlate(
      date: DateTime.now(),
      outTime: DateTime.now(),
      enterTime: DateTime.now(),
      plate: 'qwe1212',
      autorized: false,
      brandTruck: '',
      id: '101112',
      colorTruck: 'pink',
      name: 'Amanda',
      loaded: true,
    ),
    '111213': UserPlate(
      date: DateTime.now(),
      outTime: DateTime.now(),
      enterTime: DateTime.now(),
      plate: 'qwe1212',
      autorized: false,
      brandTruck: '',
      id: '111213',
      colorTruck: 'green',
      name: 'Flávio',
      loaded: true,
    ),
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

  //////////////////////// ADD AVISO IMAGEM URL //////////////////////////////////////////
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
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          'assets/images/logo_unitins_2021.png',
                          width: 500,
                        ),
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
