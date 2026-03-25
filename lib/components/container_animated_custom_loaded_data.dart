import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContainerAnimatedCustomloadedData extends StatefulWidget {
  final bool isAdm;

  final UserPlate user;
  final double cardWidth;
  final double cardHeight;
  final int index;
  const ContainerAnimatedCustomloadedData(
      {required this.index,
      required this.user,
      required this.isAdm,
      required this.cardHeight,
      required this.cardWidth,
      super.key});

  @override
  State<ContainerAnimatedCustomloadedData> createState() =>
      _ContainerAnimatedCustomloadedDataState();
}

class _ContainerAnimatedCustomloadedDataState
    extends State<ContainerAnimatedCustomloadedData> {
  bool open = false;
  bool about = false;
  bool enter = false;
  bool notFound = false;
  bool found = false;
  Color statusCard = Colors.grey.shade700;
  Color colorTruck = Colors.grey.shade300;
  Color colorBorderCardTruck = Colors.transparent;

  @override
  Widget build(BuildContext context) {
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
                            children: [
                              widget.index < 9
                                  ? Text('00000000${widget.index + 1}º',
                                      style:
                                          TextStyle(fontSize: textScale * 10))
                                  : Text('${widget.index + 1}ºdddddd',
                                      style:
                                          TextStyle(fontSize: textScale * 10)),
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
                                          TextStyle(fontSize: textScale * 15)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(color: colorBorderCardTruck, width: 1),
                          borderRadius: BorderRadius.circular(4),
                          color: colorTruck,
                        ),
                        height: 22,
                        width: 10,
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
                                          fontSize: textScale * 10,
                                          color: Colors.black87),
                                    ),
                                    widget.isAdm
                                        ? Text(
                                            'CLIENTE: ${widget.user.client.toUpperCase()}',
                                            style: TextStyle(
                                                fontSize: textScale * 10,
                                                color: Colors.black87),
                                          )
                                        : const SizedBox(),

                                    Text(
                                      // ignore: unnecessary_null_comparison
                                      'CHEGADA: ${DateFormat('d MMM y, hh:mm').format(
                                              widget.user.date,
                                            )}',
                                      style: TextStyle(
                                          fontSize: textScale * 10,
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
                                          fontSize: textScale * 10,
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
                                        fontSize: textScale * 10,
                                        color: Colors.black87,
                                      ),
                                    ),

                                    SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          // IconButton(
                                          //     onPressed: () {
                                          //       setState(() {
                                          //         widget.user.autorized = false;
                                          //         widget.user.notFound = false;
                                          //         widget.user.autorized = false;
                                          //         statusCard =
                                          //             Colors.grey.shade300;
                                          //       });
                                          //     },
                                          //     icon: Icon(
                                          //       Icons.refresh,
                                          //       size: textScale * 15,
                                          //     )),
                                          // IconButton(
                                          //     onPressed: () {
                                          //       setState(() {
                                          //         widget.user.notFound =
                                          //             !widget.user.notFound;
                                          //         widget.user.autorized =
                                          //             !widget.user.autorized;
                                          //         // notFound = !notFound;
                                          //         // found = !found;
                                          //       });
                                          //     },
                                          //     icon: Icon(
                                          //       Icons.close,
                                          //       size: textScale * 15,
                                          //     )),
                                          // IconButton(
                                          //     onPressed: () {
                                          //       Navigator.of(
                                          //         context,
                                          //       ).pushNamed(
                                          //           AppRoutes.user_form_new,
                                          //           arguments: widget.user);
                                          //       // print(widget.user);
                                          //     },
                                          //     icon: Icon(
                                          //       Icons.edit,
                                          //       size: textScale * 15,
                                          //     )),
                                          // IconButton(
                                          //     onPressed: () {
                                          //       showDialog(
                                          //         context: context,
                                          //         builder: (context) {
                                          //           return AlertDialog(
                                          //             title: const Text(
                                          //                 'Remover esse usuário?'),
                                          //             content: const Text(''),
                                          //             actions: [
                                          //               ElevatedButton(
                                          //                   onPressed: () {
                                          //                     // print(widget
                                          //                     //     .user.name);
                                          //                     Navigator.of(
                                          //                             context)
                                          //                         .pop();
                                          //                   },
                                          //                   child: const Text(
                                          //                       'não')),
                                          //               ElevatedButton(
                                          //                   onPressed: () {
                                          //                     Provider.of<Users>(
                                          //                             context,
                                          //                             listen:
                                          //                                 false)
                                          //                         .removeNew(
                                          //                             widget
                                          //                                 .user);
                                          //                     Navigator.of(
                                          //                             context)
                                          //                         .pop();
                                          //                   },
                                          //                   child: const Text(
                                          //                       'sim'))
                                          //             ],
                                          //           );
                                          //         },
                                          //       );
                                          //     },
                                          //     icon: Icon(
                                          //       Icons.delete,
                                          //       size: textScale * 15,
                                          //     )),
                                        ],
                                      ),
                                    )
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
