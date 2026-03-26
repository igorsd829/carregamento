import 'package:carregamento_conectado/components/add_user_bottom.dart';
import 'package:carregamento_conectado/pages/queue_of_trucks.dart';
import 'package:carregamento_conectado/pages/queue_of_trucks_loaded.dart';
import 'package:carregamento_conectado/pages/queue_of_trucks_loading.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int indexBottomNavigatorBar = 0;

  bool logado = false;
  double elevatedListButon = 15;
  double elevatedListLoadingButon = 2;
  double elevatedListLoadedButon = 2;
  int indexWindow = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<Users>(context, listen: false).showAlertToChauffeur(context);
  }

  double indexNavigatorBarOne = 0;
  double indexNavigatorBarTwo = 0;
  double indexNavigatorBarThree = 0;
  double indexNavigatorBarFour = 0;
  var hourTime = DateTime.now();
  bool load = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var IsLogado = ModalRoute.of(context)!.settings.arguments as bool;

    logado = IsLogado;
  }

  @override
  Widget build(BuildContext context) {
    SampleItem? selectedItem;

    bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;
    bool isLandScape = MediaQuery.of(context).size.width > 900;
    double textScale = MediaQuery.of(context).textScaler.scale(1);
    double widthScreen = MediaQuery.of(context).size.width;
    final Users users = Provider.of(context);

    return SelectionArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade400,
        drawer: logado
            ? Drawer(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          Center(
                            child: Center(
                              child: PopupMenuButton<SampleItem>(
                                icon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.grey.shade500,
                                ),
                                color: Colors.white,
                                iconSize: 30,
                                initialValue: selectedItem,
                                onSelected: (SampleItem item) {
                                  setState(() {
                                    selectedItem = item;
                                    if (selectedItem == SampleItem.itemThree) {
                                      indexWindow = 2;
                                      users.indexWindowUpdate(indexWindow);
                                      Navigator.of(context).pop();
                                    } else if (selectedItem ==
                                        SampleItem.itemTwo) {
                                      indexWindow = 1;
                                      users.indexWindowUpdate(indexWindow);
                                      Navigator.of(context).pop();
                                    } else {
                                      indexWindow = 0;
                                      users.indexWindowUpdate(indexWindow);
                                      Navigator.of(context).pop();
                                    }
                                  });
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<SampleItem>>[
                                      PopupMenuItem<SampleItem>(
                                        onTap: () {},
                                        value: SampleItem.itemOne,
                                        child: Text(
                                          '${DateFormat('dd/MM/y').format(DateTime.now())} : ${users.countTrucksOne}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: indexWindow == 0
                                                ? Colors.red
                                                : Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<SampleItem>(
                                        value: SampleItem.itemTwo,
                                        onTap: () {
                                          setState(() {
                                            indexWindow = 1;
                                          });
                                        },
                                        child: Text(
                                          '${DateFormat('dd/MM/y').format(DateTime.now().add(const Duration(days: 1)))} : ${users.countTrucksTwo}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: indexWindow == 1
                                                ? Colors.red
                                                : Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<SampleItem>(
                                        value: SampleItem.itemThree,
                                        onTap: () {
                                          setState(() {
                                            indexWindow = 2;
                                          });
                                        },
                                        child: Text(
                                          '${DateFormat('dd/MM/y').format(DateTime.now().add(const Duration(days: 2)))} : ${users.countTrucksThree}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: indexWindow == 2
                                                ? Colors.red
                                                : Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                    ],
                              ),
                            ),
                          ),
                          const Text('CALENDÁRIO'),
                        ],
                      ),

                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushNamed(AppRoutes.data_truks_adm);
                              // Navigator.of(context).pushReplacementNamed(
                              //   AppRoutes.data_truks_loaded,
                              // );
                            },
                            icon: Icon(
                              Icons.insert_chart_outlined_sharp,
                              size: 35,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const Text('RELATÓRIO'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.help_page_adm);
                            },
                            icon: Icon(
                              Icons.help_center_sharp,
                              size: 35,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const Text('AJUDA'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.login_page);
                              users.indexOne = true;
                              users.indexTwo = false;
                              users.indexThree = false;
                            },
                            icon: Icon(
                              Icons.output,
                              size: 35,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const Text('SAIR'),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : Drawer(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 50),
                      Row(
                        children: [
                          Center(
                            child: Center(
                              child: PopupMenuButton<SampleItem>(
                                icon: Icon(
                                  Icons.date_range_outlined,
                                  color: Colors.grey.shade500,
                                ),
                                color: Colors.white,
                                iconSize: 30,
                                initialValue: selectedItem,
                                onSelected: (SampleItem item) {
                                  setState(() {
                                    selectedItem = item;
                                    if (selectedItem == SampleItem.itemThree) {
                                      indexWindow = 2;
                                      users.indexWindowUpdate(indexWindow);
                                      Navigator.of(context).pop();
                                    } else if (selectedItem ==
                                        SampleItem.itemTwo) {
                                      indexWindow = 1;
                                      users.indexWindowUpdate(indexWindow);
                                      Navigator.of(context).pop();
                                    } else {
                                      indexWindow = 0;
                                      users.indexWindowUpdate(indexWindow);
                                      Navigator.of(context).pop();
                                    }
                                  });
                                },
                                itemBuilder: (BuildContext context) =>
                                    <PopupMenuEntry<SampleItem>>[
                                      PopupMenuItem<SampleItem>(
                                        onTap: () {},
                                        value: SampleItem.itemOne,
                                        child: Text(
                                          '${DateFormat('dd/MM/y').format(DateTime.now())} : ${users.countTrucksOne} ',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: indexWindow == 0
                                                ? Colors.red
                                                : Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<SampleItem>(
                                        value: SampleItem.itemTwo,
                                        onTap: () {
                                          setState(() {
                                            indexWindow = 1;
                                          });
                                        },
                                        child: Text(
                                          '${DateFormat('dd/MM/y').format(DateTime.now().add(const Duration(days: 1)))} : ${users.countTrucksTwo}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: indexWindow == 1
                                                ? Colors.red
                                                : Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                      PopupMenuItem<SampleItem>(
                                        value: SampleItem.itemThree,
                                        onTap: () {
                                          setState(() {
                                            indexWindow = 2;
                                          });
                                        },
                                        child: Text(
                                          '${DateFormat('dd/MM/y').format(DateTime.now().add(const Duration(days: 2)))} : ${users.countTrucksThree}',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: indexWindow == 2
                                                ? Colors.red
                                                : Colors.grey.shade700,
                                          ),
                                        ),
                                      ),
                                    ],
                              ),
                            ),
                          ),
                          const Text('CALENDÁRIO'),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.of(
                                context,
                              ).pushReplacementNamed(AppRoutes.login_page);
                              users.indexOne = true;
                              users.indexTwo = false;
                              users.indexThree = false;
                            },
                            icon: Icon(
                              Icons.output,
                              size: 35,
                              color: Colors.grey.shade500,
                            ),
                          ),
                          const Text('SAIR'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
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
                isLandScape
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: ElevatedButton(
                              onPressed: () {
                                logado
                                    ? setState(() {
                                        elevatedListButon = 15;
                                        elevatedListLoadingButon = 2;
                                        elevatedListLoadedButon = 2;
                                        _pageController.animateToPage(
                                          0,
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve: Curves.easeInCirc,
                                        );
                                      })
                                    : null;
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: elevatedListButon,
                                foregroundColor: Colors.black54,
                                shape: const LinearBorder(),
                                backgroundColor: Colors.grey.shade200,
                              ),
                              child: Text(
                                'FILA: ${users.countTrucks}º',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 2),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: ElevatedButton(
                              onPressed: () {
                                logado
                                    ? setState(() {
                                        elevatedListButon = 2;
                                        elevatedListLoadingButon = 15;
                                        elevatedListLoadedButon = 2;
                                        _pageController.animateToPage(
                                          1,
                                          duration: const Duration(
                                            milliseconds: 300,
                                          ),
                                          curve: Curves.easeInCirc,
                                        );
                                      })
                                    : null;
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: elevatedListLoadingButon,
                                foregroundColor: Colors.black54,
                                shape: const LinearBorder(),
                                backgroundColor: Colors.grey.shade200,
                              ),
                              child: Text(
                                'CARREGANDO: ${users.countTrucksLoading}º',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 2),
                            child: isLandScape
                                ? ElevatedButton(
                                    onPressed: () {
                                      logado
                                          ? setState(() {
                                              elevatedListButon = 2;
                                              elevatedListLoadingButon = 2;
                                              elevatedListLoadedButon = 15;
                                              _pageController.animateToPage(
                                                2,
                                                duration: const Duration(
                                                  milliseconds: 300,
                                                ),
                                                curve: Curves.easeInCirc,
                                              );
                                            })
                                          : null;
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: elevatedListLoadedButon,
                                      foregroundColor: Colors.black54,
                                      shape: const LinearBorder(),
                                      backgroundColor: Colors.grey.shade200,
                                    ),
                                    child: Text(
                                      'CARREGADOS: ${users.countTrucksLoaded}º',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                : const SizedBox(),
                          ),
                          load
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 30,
                                    width: 30,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: CircularProgressIndicator(
                                        strokeWidth: 4,
                                        color: Colors.grey.shade300,
                                      ),
                                    ),
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    Provider.of<Users>(
                                      context,
                                      listen: false,
                                    ).loadAllTrucks();
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                    size: 30,
                                    color: load
                                        ? Colors.red
                                        : Colors.grey.shade100,
                                  ),
                                ),
                        ],
                      )
                    : const SizedBox(),
                isPortraitPhoneSize
                    ? Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 2),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'CARREGAMENTO: ',
                                      style: TextStyle(
                                        fontSize: 8,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    users.statusOpen
                                        ? Stack(
                                            children: <Widget>[
                                              // Stroked text as border.
                                              Text(
                                                users.status.toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: textScale * 8,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 0.4
                                                    ..color = Colors.black,
                                                ),
                                              ),
                                              // Solid text as fill.
                                              Text(
                                                users.status.toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: textScale * 8,
                                                  color: Colors
                                                      .greenAccent
                                                      .shade400,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                    users.statusStoped
                                        ? Stack(
                                            children: <Widget>[
                                              // Stroked text as border.
                                              Text(
                                                users.status.toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: textScale * 8,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 0.2
                                                    ..color = Colors.black,
                                                ),
                                              ),
                                              // Solid text as fill.
                                              Text(
                                                users.status.toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: textScale * 8,
                                                  color: Colors.yellow,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                    users.statusClosed
                                        ? Stack(
                                            children: <Widget>[
                                              // Stroked text as border.
                                              Text(
                                                users.status.toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: textScale * 8,
                                                  foreground: Paint()
                                                    ..style =
                                                        PaintingStyle.stroke
                                                    ..strokeWidth = 0.2
                                                    ..color = Colors.black,
                                                ),
                                              ),
                                              // Solid text as fill.
                                              Text(
                                                users.status.toUpperCase(),
                                                style: TextStyle(
                                                  fontSize: textScale * 8,
                                                  color: Colors.redAccent,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                  ],
                                ),
                                Text(
                                  DateFormat('dd/MM/y').format(DateTime.now()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: textScale * 9,
                                    color: Colors.black54,
                                  ),
                                ),
                                Text(
                                  DateFormat('HH:mm').format(DateTime.now()),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: textScale * 9,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 1),
                            child: ElevatedButton(
                              onPressed: () {
                                Provider.of<Users>(
                                  context,
                                  listen: false,
                                ).loadAllTrucks();
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(1),
                                foregroundColor: Colors.black54,
                                shape: const RoundedRectangleBorder(),
                                backgroundColor: Colors.grey.shade200,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: SizedBox(
                                      height: 22,
                                      width: 22,
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.all(0),
                                          child: load
                                              ? const Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child:
                                                      CircularProgressIndicator(
                                                        strokeWidth: 2,
                                                        color: Colors.grey,
                                                      ),
                                                )
                                              : const Center(
                                                  child: Icon(
                                                    Icons.refresh,
                                                    size: 20,
                                                  ),
                                                ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'FILA: ${users.countTrucks}º',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          IconButton(
                            padding: EdgeInsets.all(1),
                            onPressed: () {
                              logado
                                  ? Navigator.of(
                                      context,
                                    ).pushNamed(AppRoutes.data_truks_adm)
                                  : Navigator.of(
                                      context,
                                    ).pushNamed(AppRoutes.data_truks);
                            },
                            icon: Icon(
                              Icons.insert_chart_outlined_sharp,
                              size: 25,
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
        body: Stack(
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: widthScreen * 0.20,
                    child: Image.asset(
                      'assets/images/supercal_login.png',

                      fit: BoxFit.contain,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            PageView(
              physics: logado
                  ? const ScrollPhysics()
                  : const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: [
                QueueOfTrucks(
                  indexWindow: indexWindow,
                  isAdm: logado,
                  load: load,
                ),
                // agendamento
                // QueueOfTrucksScheduled(
                //   indexWindow: indexWindow,
                //   isAdm: logado,
                //   load: load,
                // ),
                QueueOfTrucksLoading(isAdm: logado, load: load),
                QueueOfTrucksLoaded(isAdm: logado, load: load),
                // const HelpPage(), //// aqui deveria ser ado adm
              ],
            ),
          ],
        ),
        resizeToAvoidBottomInset: false, //////////////////////////
        floatingActionButton: logado
            ? FloatingActionButton(
                elevation: 10,
                backgroundColor: Colors.grey.shade400,
                child: const Icon(Icons.add, size: 30, color: Colors.white),
                onPressed: () {
                  setState(() {
                    elevatedListButon = 15;
                    elevatedListLoadingButon = 2;
                    elevatedListLoadedButon = 2;
                    indexBottomNavigatorBar = 0;
                    indexNavigatorBarOne = 15;
                    indexNavigatorBarTwo = 0;
                    indexNavigatorBarThree = 0;
                    indexNavigatorBarFour = 0;
                  });
                  showModalBottomSheet(
                    backgroundColor: Colors.grey.shade300,
                    isScrollControlled: true,
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom,
                        ),
                        child: SizedBox(
                          height: isPortraitPhoneSize ? 500 : 500,
                          width: double.infinity,
                          child: const SingleChildScrollView(
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 10,
                              ),
                              child: Column(
                                children: [UserBotoom(), SizedBox(height: 10)],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            : FloatingActionButton(
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: const Icon(
                  Icons.help_center_outlined,
                  size: 50,
                  color: Colors.black54,
                ),
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(AppRoutes.help_page);
                },
              ),
        bottomNavigationBar: isPortraitPhoneSize && logado
            ? BottomNavigationBar(
                onTap: (value) {
                  logado
                      ? setState(() {
                          indexBottomNavigatorBar = value;
                          if (value == 0) {
                            indexNavigatorBarOne = 15;
                            indexNavigatorBarTwo = 0;
                            indexNavigatorBarThree = 0;
                            indexNavigatorBarFour = 0;
                          } else if (value == 1) {
                            indexNavigatorBarTwo = 15;
                            indexNavigatorBarOne = 0;
                            indexNavigatorBarThree = 0;
                            indexNavigatorBarFour = 0;
                          } else if (value == 2) {
                            indexNavigatorBarThree = 15;
                            indexNavigatorBarTwo = 0;
                            indexNavigatorBarOne = 0;
                            indexNavigatorBarFour = 0;
                          } else if (value == 3) {
                            indexNavigatorBarFour = 15;
                            indexNavigatorBarOne = 0;
                            indexNavigatorBarTwo = 0;
                            indexNavigatorBarThree = 0;
                          }
                          _pageController.animateToPage(
                            indexBottomNavigatorBar,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInCirc,
                          );
                        })
                      : null;
                },
                currentIndex: indexBottomNavigatorBar,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                    icon: Card(
                      elevation: indexNavigatorBarOne,
                      child: Container(
                        color: Colors.grey.shade400,
                        width: 110,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            ' ${users.countTrucks} FILA',
                            style: const TextStyle(fontSize: 6),
                          ),
                        ),
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Card(
                      elevation: indexNavigatorBarTwo,
                      child: Container(
                        width: 110,
                        color: Colors.grey.shade400,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              '${users.countTrucksLoading} CARREGANDO',
                              style: const TextStyle(fontSize: 6),
                            ),
                          ),
                        ),
                      ),
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Card(
                      elevation: indexNavigatorBarThree,
                      child: Container(
                        width: 110,
                        color: Colors.grey.shade400,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '${users.countTrucksLoaded} CARREGADOS',
                            style: const TextStyle(fontSize: 6),
                          ),
                        ),
                      ),
                    ),
                    label: '',
                  ),
                  logado
                      ? BottomNavigationBarItem(
                          icon: Card(
                            elevation: indexNavigatorBarFour,
                            child: Container(
                              width: 110,
                              color: Colors.grey.shade400,
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  'ADM',
                                  style: TextStyle(fontSize: 6),
                                ),
                              ),
                            ),
                          ),
                          label: '',
                        )
                      : BottomNavigationBarItem(
                          icon: Container(
                            width: 110,
                            color: Colors.grey.shade400,
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text('ADM', style: TextStyle(fontSize: 8)),
                            ),
                          ),
                          label: '',
                        ),
                ],
              )
            : const SizedBox(),
      ),
    );
  }
}
