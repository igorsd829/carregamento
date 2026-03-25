import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

////certo
class ContainerAnimatedCustomloaded extends StatefulWidget {
  final bool isAdm;
  final bool load;

  final UserPlate user;
  final double cardWidth;
  final double cardHeight;
  final int index;
  const ContainerAnimatedCustomloaded(
      {required this.index,
      required this.user,
      required this.isAdm,
      required this.load,
      required this.cardHeight,
      required this.cardWidth,
      super.key});

  @override
  State<ContainerAnimatedCustomloaded> createState() =>
      _ContainerAnimatedCustomloadedState();
}

class _ContainerAnimatedCustomloadedState
    extends State<ContainerAnimatedCustomloaded> {
  bool open = false;
  bool about = false;
  bool enter = false;
  bool notFound = false;
  bool found = false;
  Color statusCard = Colors.grey.shade700.withOpacity(0.8);
  Color colorTruck = Colors.grey.shade300;
  Color colorBorderCardTruck = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context, listen: false);

    if (widget.user.colorTruck == 'black') {
      colorTruck = Colors.black;
    } else if (widget.user.colorTruck == 'white') {
      colorTruck = Colors.white;
    } else if (widget.user.colorTruck == 'grey') {
      colorTruck = Colors.grey;
    } else if (widget.user.colorTruck == 'blue') {
      colorTruck = Colors.blue;
    } else if (widget.user.colorTruck == 'red') {
      colorTruck = Colors.redAccent;
    } else if (widget.user.colorTruck == 'green') {
      colorTruck = Colors.green;
    } else if (widget.user.colorTruck == 'yellow') {
      colorTruck = Colors.yellow;
    } else if (widget.user.colorTruck == 'orange') {
      colorTruck = Colors.orangeAccent;
    } else if (widget.user.colorTruck == 'pink') {
      colorTruck = Colors.pinkAccent;
    } else {
      colorTruck = Colors.transparent;
      colorBorderCardTruck = Colors.transparent;
    }
    // final Users users = Provider.of(context);

    double textScale = MediaQuery.of(context).textScaler.scale(1);

    return AnimatedContainer(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      onEnd: () {
        if (!open && about) {
          setState(() {
            about = false;
          });
        } else if (open && !about) {
          setState(() {
            about = true;
          });
        }
      },
      height: open ? widget.cardWidth * 0.5 : widget.cardHeight,
      width: open ? widget.cardWidth : widget.cardWidth,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
            color: statusCard, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 3,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.7), width: 1),
                            color: Colors.white,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5))),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              widget.index < 9
                                  ? Text('0${widget.index + 1}º',
                                      style:
                                          TextStyle(fontSize: textScale * 14))
                                  : Text('${widget.index + 1}º',
                                      style:
                                          TextStyle(fontSize: textScale * 14)),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      // Expanded(child: SizedBox()),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: InkWell(
                          onDoubleTap: () {
                            if (!open) {
                              setState(() {
                                open = true;
                              });
                            } else {
                              setState(() {
                                open = false;
                                about = false;
                              });
                            }
                          },
                          // 0,1,2,3,4,5,6
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.black.withOpacity(0.7),
                                          width: 1),
                                      color: Colors.white,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(5))),
                                  child: Text(
                                      '${widget.user.plate.substring(0, 3).toUpperCase()}-${widget.user.plate.substring(3, 7).toUpperCase()}',
                                      style:
                                          TextStyle(fontSize: textScale * 14)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            // ignore: unnecessary_null_comparison
                            'C: ${DateFormat('dd/MM/y, HH:mm').format(
                                    widget.user.date,
                                  )}',
                            style: TextStyle(
                                fontSize: textScale * 9, color: Colors.white),
                          ),
                          Text(
                            // ignore: unnecessary_null_comparison
                            widget.user.enterTime == null
                                ? ''
                                : 'E: ${DateFormat('dd/MM/y, HH:mm').format(
                                    widget.user.enterTime!,
                                  )}',
                            style: TextStyle(
                                fontSize: textScale * 9, color: Colors.white),
                          ),
                          Text(
                            // ignore: unnecessary_null_comparison
                            widget.user.outTime == null
                                ? ''
                                : 'S: ${DateFormat('dd/MM/y, HH:mm').format(
                                    widget.user.outTime!,
                                  )}',
                            style: TextStyle(
                              fontSize: textScale * 9,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                about
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            height: widget.cardWidth * 0.3,
                            width: widget.cardWidth - 20,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.black.withOpacity(0.7),
                                    width: 1),
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(5))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // tirei os containers dos name e datas  por isso vvv
                                    // ignore: avoid_unnecessary_containers
                                    Text(
                                      'MOTORISTA: ${widget.user.name.toUpperCase()}',
                                      style: TextStyle(
                                          fontSize: textScale * 8,
                                          color: Colors.black87),
                                    ),
                                    widget.user.obs != ''
                                        ? Text(
                                            'OBSERVAÇÃO: ${widget.user.obs.toUpperCase()}',
                                            style: TextStyle(
                                                fontSize: textScale * 10,
                                                color: Colors.black87),
                                          )
                                        : const SizedBox(),
                                    widget.isAdm
                                        ? Text(
                                            'CLIENTE: ${widget.user.client.toUpperCase()}',
                                            style: TextStyle(
                                                fontSize: textScale * 8,
                                                color: Colors.black87),
                                          )
                                        : const SizedBox(),
                                    widget.isAdm
                                        ? Text(
                                            'PESO: ${widget.user.weight.toUpperCase()}',
                                            style: TextStyle(
                                                fontSize: textScale * 8,
                                                color: Colors.black87),
                                          )
                                        : const SizedBox(),

                                    Text(
                                      // ignore: unnecessary_null_comparison
                                      'CHEGADA: ${DateFormat('d MMM y, hh:mm').format(
                                              widget.user.date,
                                            )}',
                                      style: TextStyle(
                                          fontSize: textScale * 8,
                                          color: Colors.black87),
                                    ),
                                    Text(
                                      // ignore: unnecessary_null_comparison
                                      widget.user.enterTime == null
                                          ? ''
                                          : 'ENTRADA: ${DateFormat('d MMM y, hh:mm').format(
                                              widget.user.enterTime!,
                                            )}',
                                      style: TextStyle(
                                          fontSize: textScale * 8,
                                          color: Colors.black87),
                                    ),
                                    Text(
                                      // ignore: unnecessary_null_comparison
                                      widget.user.outTime == null
                                          ? ''
                                          : 'SAÍDA: ${DateFormat('d MMM y, hh:mm').format(
                                              widget.user.outTime!,
                                            )}',
                                      style: TextStyle(
                                        fontSize: textScale * 8,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: colorBorderCardTruck,
                                              width: 1),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          color: colorTruck,
                                        ),
                                        height: 10,
                                        width: double.infinity,
                                      ),
                                    ),

                                    widget.load
                                        ? const Row()
                                        : SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: widget.isAdm
                                                ? Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      GestureDetector(
                                                        child: IconButton(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(0),
                                                            icon: Icon(
                                                              Icons.delete,
                                                              size: textScale *
                                                                  14,
                                                            ),
                                                            onPressed: () {}),
                                                        onDoubleTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            2)),
                                                                title: const Text(
                                                                    'Remover esse caminhão?'),
                                                                content:
                                                                    const Text(
                                                                        ''),
                                                                actions: [
                                                                  ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .pop();
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          foregroundColor: Colors
                                                                              .black54,
                                                                          shape:
                                                                              const RoundedRectangleBorder(),
                                                                          backgroundColor: Colors
                                                                              .grey
                                                                              .shade200),
                                                                      child:
                                                                          Text(
                                                                        'NÂO',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              textScale * 12,
                                                                        ),
                                                                      )),
                                                                  ElevatedButton(
                                                                      onPressed:
                                                                          () {
                                                                        users.removeTruckLoaded(
                                                                            widget.user);

                                                                        Navigator
                                                                            .of(
                                                                          context,
                                                                        ).pop();
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          foregroundColor: Colors
                                                                              .black54,
                                                                          shape:
                                                                              const RoundedRectangleBorder(),
                                                                          backgroundColor: Colors
                                                                              .grey
                                                                              .shade200),
                                                                      child:
                                                                          Text(
                                                                        'SIM',
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              textScale * 12,
                                                                        ),
                                                                      )),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox())
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
