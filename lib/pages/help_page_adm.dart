import 'package:carregamento_conectado/pages/home_page_view.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HelpPageAdm extends StatefulWidget {
  const HelpPageAdm({super.key});

  @override
  State<HelpPageAdm> createState() => _HelpPageAdmState();
}

class _HelpPageAdmState extends State<HelpPageAdm> {
  @override
  Widget build(BuildContext context) {
    int indexWindow = 0;
    SampleItem? selectedItem;
    double textScale = MediaQuery.of(context).textScaler.scale(1);
    double widthScreen = MediaQuery.of(context).size.width;
    bool isDeskTop = widthScreen > 600;
    bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;
    bool isLandScape = MediaQuery.of(context).size.width > 900;
    final Users users = Provider.of(context);
    // bool isLandScape = MediaQuery.of(context).size.width > 900;
    return Scaffold(
      drawer: Drawer(
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
                            } else if (selectedItem == SampleItem.itemTwo) {
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
                        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
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
                      Navigator.of(context).pushNamed(AppRoutes.data_truks_adm);
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
      ),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
        title: Row(
          children: [
            Text('AJUDA', style: TextStyle(color: Colors.grey.shade600)),
            Expanded(child: SizedBox()),
            isLandScape
                ? Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 1),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 15,
                            foregroundColor: Colors.black54,
                            shape: const LinearBorder(),
                            backgroundColor: Colors.grey.shade200,
                          ),
                          child: Text(
                            'FILA: ${users.countTrucks}º',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            elevation: 2,
                            foregroundColor: Colors.black54,
                            shape: const LinearBorder(),
                            backgroundColor: Colors.grey.shade200,
                          ),
                          child: Text(
                            'CARREGANDO: ${users.countTrucksLoading}º',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: isLandScape
                            ? ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  elevation: 2,
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
                                                ..style = PaintingStyle.stroke
                                                ..strokeWidth = 0.4
                                                ..color = Colors.black,
                                            ),
                                          ),
                                          // Solid text as fill.
                                          Text(
                                            users.status.toUpperCase(),
                                            style: TextStyle(
                                              fontSize: textScale * 8,
                                              color:
                                                  Colors.greenAccent.shade400,
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
                                                ..style = PaintingStyle.stroke
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
                                                ..style = PaintingStyle.stroke
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
                                      child: const Center(
                                        child: Icon(Icons.refresh, size: 20),
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
                    ],
                  )
                : const SizedBox(),
          ],
        ),

        actions: [],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TUTORIAL',
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade600),
                  ),
                ],
              ),
              isDeskTop
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CardHelpTruck(
                          index: 0,
                          cor: Colors.grey.shade300,
                          widthCardHelp: 400,
                        ),
                        const Icon(Icons.arrow_upward, size: 20),
                        const Text(
                          'O card acima significa: o motorista deve aguardar.',
                        ),
                        const CardHelpTruck(
                          index: 1,
                          cor: Colors.greenAccent,
                          widthCardHelp: 400,
                        ),
                        const Icon(Icons.arrow_upward, size: 20),
                        const Text(
                          'O card acima significa: o motorista pode entrar para carregar.',
                        ),
                        const CardHelpTruck(
                          index: 2,
                          cor: Colors.redAccent,
                          widthCardHelp: 400,
                        ),
                        const Icon(Icons.arrow_upward, size: 20),
                        const Text(
                          'O card acima significa: caminhão não encontrado ou com defeito, o seguinte pode entrar na vez',
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        CardHelpTruck(
                          index: 0,
                          cor: Colors.grey.shade300,
                          widthCardHelp: double.infinity,
                        ),
                        const Icon(Icons.arrow_upward, size: 12),
                        const Text(
                          'O card acima significa: motorista deve aguardar.',
                          style: TextStyle(fontSize: 12),
                        ),
                        const CardHelpTruck(
                          index: 1,
                          cor: Colors.greenAccent,
                          widthCardHelp: double.infinity,
                        ),
                        const Icon(Icons.arrow_upward, size: 12),
                        const Text(
                          'O card acima significa: o motorista pode entrar para carregar.',
                          style: TextStyle(fontSize: 12),
                        ),
                        const CardHelpTruck(
                          index: 2,
                          cor: Colors.redAccent,
                          widthCardHelp: double.infinity,
                        ),
                        const Icon(Icons.arrow_upward, size: 12),
                        const Text(
                          'O card acima significa: caminhão não encontrado ou com defeito, o seguinte pode entrar na vez',
                          style: TextStyle(fontSize: 12),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 150,
                        child: ClipRRect(
                          borderRadius: BorderRadiusGeometry.circular(50),
                          child: Image.asset(
                            'assets/images/logo_unitins_2021.png',
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),
                      Text(
                        'Carregamento Conectado',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: textScale * 12),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.home,
                              arguments: true,
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black54,
                            shape: const RoundedRectangleBorder(),
                            backgroundColor: Colors.grey.shade200,
                          ),
                          child: Icon(Icons.home),
                        ),
                      ),
                    ],
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

class CardHelpTruck extends StatelessWidget {
  final int index;
  final Color cor;
  final double widthCardHelp;

  const CardHelpTruck({
    super.key,
    required this.cor,
    required this.widthCardHelp,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    double textScale = MediaQuery.of(context).textScaler.scale(1);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 45,
        width: widthCardHelp,
        decoration: BoxDecoration(
          color: cor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 3),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(width: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black.withOpacity(0.7),
                            width: 1,
                          ),
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(5),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              Text(
                                '${index + 1}º',
                                style: TextStyle(fontSize: textScale * 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: InkWell(
                          onDoubleTap: () {},
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black.withOpacity(0.7),
                                      width: 1,
                                    ),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    'ABC-1D23',
                                    style: TextStyle(fontSize: textScale * 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white,
                        ),
                        height: 22,
                        width: 10,
                      ),
                      const Icon(Icons.arrow_back),
                      Text(
                        'vez, placa e cor do caminhão',
                        style: TextStyle(fontSize: textScale * 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
