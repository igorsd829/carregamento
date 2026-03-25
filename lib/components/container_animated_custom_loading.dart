import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/clip_board.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ContainerAnimatedCustomloading extends StatefulWidget {
  final bool isAdm;
  final bool load;

  final UserPlate user;
  final double cardWidth;
  final double cardHeight;
  final int index;
  const ContainerAnimatedCustomloading(
      {required this.index,
      required this.user,
      required this.load,
      required this.isAdm,
      required this.cardHeight,
      required this.cardWidth,
      super.key});

  @override
  State<ContainerAnimatedCustomloading> createState() =>
      _ContainerAnimatedCustomloadingState();
}

class _ContainerAnimatedCustomloadingState
    extends State<ContainerAnimatedCustomloading> {
  bool open = false;
  bool about = false;
  bool enter = false;
  bool notFound = false;
  bool found = false;
  bool problem = false;
  bool showColorTruck = true;

  Color statusCard = Colors.yellowAccent.withOpacity(0.6);
  Color colorTruck = Colors.transparent;
  Color colorBorderCardTruck = Colors.transparent;
  final form = GlobalKey<FormState>();
  String formData = '';

  @override
  Widget build(BuildContext context) {
    if (widget.user.ready) {
      statusCard = Colors.greenAccent;
    } else {
      statusCard = Colors.yellowAccent.withOpacity(0.6);
    }
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
      showColorTruck = false;
      colorTruck = Colors.transparent;
      colorBorderCardTruck = Colors.transparent;
      showColorTruck = false;
    }

    // if (notFound) {
    //   setState(() {
    //     statusCard = Colors.redAccent;
    //   });
    // } else if (found) {
    //   setState(() {
    //     statusCard = Colors.greenAccent;
    //   });
    // }
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
            gradient: LinearGradient(colors: [
              statusCard,
              statusCard,
              statusCard,
              statusCard.withOpacity(0.7)
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
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
                                  ? Text('0${widget.index + 1}º',
                                      style:
                                          TextStyle(fontSize: textScale * 20))
                                  : Text('${widget.index + 1}º',
                                      style:
                                          TextStyle(fontSize: textScale * 20)),
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
                      // SizedBox(
                      //   width: widget.cardWidth / 2,
                      // ),
                      const SizedBox(
                        width: 0,
                      ),
                      showColorTruck
                          ? Row(
                              children: [
                                const SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: colorBorderCardTruck, width: 1),
                                    borderRadius: BorderRadius.circular(4),
                                    color: colorTruck,
                                  ),
                                  height: 22,
                                  width: 10,
                                ),
                              ],
                            )
                          : const SizedBox(
                              width: 0,
                            ),

                      widget.user.loading && widget.isAdm
                          ?
                          /////////////////////////////////
                          ///

                          Row(
                              children: [
                                // widget.load
                                //     ? IconButton(
                                //         onPressed: () {},
                                //         icon: Icon(
                                //           Icons.refresh,
                                //           size: textScale * 14,
                                //         ))
                                //     : IconButton(
                                //         onPressed: () {
                                //           showModalBottomSheet(
                                //             backgroundColor:
                                //                 Colors.grey.shade300,
                                //             isScrollControlled: true,
                                //             context: context,
                                //             builder: (context) {
                                //               return Padding(
                                //                 padding: EdgeInsets.only(
                                //                     bottom:
                                //                         MediaQuery.of(context)
                                //                             .viewInsets
                                //                             .bottom),
                                //                 child: SizedBox(
                                //                   height: 400,
                                //                   width: double.infinity,
                                //                   child: SingleChildScrollView(
                                //                     child: Padding(
                                //                       padding: const EdgeInsets
                                //                           .symmetric(
                                //                           horizontal: 20,
                                //                           vertical: 10),
                                //                       child: Column(
                                //                         children: [
                                //                           Form(
                                //                             key: form,
                                //                             child: Column(
                                //                               children: [
                                //                                 TextFormField(
                                //                                     decoration: const InputDecoration(
                                //                                         labelText:
                                //                                             'PESO'),
                                //                                     validator:
                                //                                         (value) {
                                //                                       if (value!
                                //                                               .trim()
                                //                                               .length >
                                //                                           100) {
                                //                                         return 'máximo 20 dígitos';
                                //                                       }

                                //                                       return null;
                                //                                     },
                                //                                     onSaved: (newValue) =>
                                //                                         formData =
                                //                                             newValue!),
                                //                                 const SizedBox(
                                //                                     height: 15),
                                //                                 // Row(
                                //                                 //   mainAxisAlignment:
                                //                                 //       MainAxisAlignment
                                //                                 //           .center,
                                //                                 //   children: [
                                //                                 //     ElevatedButton(
                                //                                 //         style: ElevatedButton.styleFrom(
                                //                                 //             foregroundColor: Colors
                                //                                 //                 .black54,
                                //                                 //             shape:
                                //                                 //                 const RoundedRectangleBorder(),
                                //                                 //             backgroundColor: Colors
                                //                                 //                 .grey.shade200,
                                //                                 //             elevation:
                                //                                 //                 5),
                                //                                 //         onPressed:
                                //                                 //             () {
                                //                                 //           final bool
                                //                                 //               isValid =
                                //                                 //               form.currentState!.validate();
                                //                                 //           if (isValid) {
                                //                                 //             form.currentState!.save();
                                //                                 //             // Provider.of<Users>(context, listen: false)
                                //                                 //             //     .addExpedition(formData);

                                //                                 //             Provider.of<Users>(context, listen: false).editTruckWeight(widget.user,
                                //                                 //                 formData);

                                //                                 //             Navigator.of(context).pop();
                                //                                 //           }
                                //                                 //           // Provider.of<Users>(context, listen: false)
                                //                                 //           //     .loadTrucksLoading();
                                //                                 //         },
                                //                                 //         child:
                                //                                 //             const Text(
                                //                                 //           'SALVAR',
                                //                                 //           style: TextStyle(
                                //                                 //               color: Colors.indigo,
                                //                                 //               fontSize: 25),
                                //                                 //         )),
                                //                                 //     IconButton(
                                //                                 //         onPressed:
                                //                                 //             () {
                                //                                 //           // Provider.of<Users>(context, listen: false)
                                //                                 //           //     .clearTruckWeight(widget.user);

                                //                                 //           Navigator.of(context)
                                //                                 //               .pop();
                                //                                 //         },
                                //                                 //         icon: const Icon(
                                //                                 //             Icons.refresh)),
                                //                                 //   ],
                                //                                 // )
                                //                               ],
                                //                             ),
                                //                           ),
                                //                           const SizedBox(
                                //                             height: 10,
                                //                           ),
                                //                         ],
                                //                       ),
                                //                     ),
                                //                   ),
                                //                 ),
                                //               );
                                //             },
                                //           );
                                //         },
                                //         icon: Icon(
                                //           Icons.edit,
                                //           size: textScale * 12,
                                //           // color: Colors.black54,
                                //         )),
                                widget.user.weight != '0'
                                    ? Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.black
                                                    .withOpacity(0.7),
                                                width: 1),
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(5))),
                                        child: Text(
                                            '${widget.user.weight.toUpperCase()} kg',
                                            style: widget.user.ready
                                                ? TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    fontSize: textScale * 15)
                                                : TextStyle(
                                                    fontSize: textScale * 15)))
                                    : const SizedBox(),
                                widget.isAdm && widget.user.idTruck != ''
                                    ? GestureDetector(
                                        child: widget.load
                                            ? IconButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                icon: Icon(
                                                  Icons.refresh,
                                                  size: textScale * 14,
                                                ),
                                                onPressed: () {})
                                            : IconButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                icon: Icon(
                                                  Icons.calendar_month,
                                                  size: textScale * 14,
                                                ),
                                                onPressed: () {
                                                  ClipBoardCustom.copy(
                                                      widget.user.idTruck!);
                                                }),
                                        onDoubleTap: () {
                                          // if (widget.load) {
                                          //   return;
                                          // } else {
                                          //   users.isAutorized(
                                          //       widget.user, sending, widget.user.loading);
                                          //   // setState(() {
                                          //   //   sending = !sending;
                                          //   // });
                                          // }
                                        },
                                      )
                                    : const SizedBox(),
                                GestureDetector(
                                  child: widget.load
                                      ? IconButton(
                                          // color: Colors.transparent,
                                          padding: const EdgeInsets.all(8),
                                          icon: Icon(
                                            Icons.refresh,
                                            size: textScale * 14,
                                          ),
                                          onPressed: () {})
                                      : IconButton(
                                          padding: const EdgeInsets.all(8),
                                          icon: Icon(
                                            Icons.upload,
                                            size: textScale * 14,
                                          ),
                                          onPressed: () {}),
                                  onDoubleTap: () {
                                    if (widget.load) {
                                      return;
                                    } else {
                                      users.addTruckListLoaded(widget.user);
                                    }

                                    
                                  },
                                ),
                              ],
                            )
                        
                          : const SizedBox()
                      
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
                                    widget.isAdm && widget.user.idTruck != ''
                                        ? Row(
                                            children: [
                                              Text(
                                                'ID: ${widget.user.idTruck!.toUpperCase()}',
                                                style: TextStyle(
                                                    fontSize: textScale * 10,
                                                    color: Colors.black87),
                                              ),
                                              
                                            ],
                                          )
                                        : const SizedBox(),
                                    Text(
                                      'MOTORISTA: ${widget.user.name.toUpperCase()}',
                                      style: TextStyle(
                                          fontSize: textScale * 10,
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
                                    widget.isAdm && widget.user.client != ''
                                        ? Text(
                                            'CLIENTE: ${widget.user.client.toUpperCase()}',
                                            style: TextStyle(
                                                fontSize: textScale * 10,
                                                color: Colors.black87),
                                          )
                                        : const SizedBox(),
                                    widget.isAdm
                                        ? Text(
                                            'PESO: ${widget.user.weight.toUpperCase()}',
                                            style: TextStyle(
                                                fontSize: textScale * 10,
                                                color: Colors.black87),
                                          )
                                        : const SizedBox(),

                                    Text(
                                      // ignore: unnecessary_null_comparison
                                      'CHEGADA: ${DateFormat('dd/MM/y, HH:mm').format(
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
                                          : 'ENTRADA: ${DateFormat('dd/MM/y, HH:mm').format(
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
                                          : 'SAÍDA: ${DateFormat('dd/MM/y, HH:mm').format(
                                              widget.user.outTime!,
                                            )}',
                                      style: TextStyle(
                                        fontSize: textScale * 10,
                                        color: Colors.black87,
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
                                                                        users.removeTruckLoadingList(
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
                                                      // widget.isAdm
                                                      //     ? Padding(
                                                      //         padding:
                                                      //             const EdgeInsets
                                                      //                 .all(0),
                                                      //         child: widget.user
                                                      //                 .ready
                                                      //             ? IconButton(
                                                      //                 padding:
                                                      //                     const EdgeInsets
                                                      //                         .all(
                                                      //                         8),
                                                      //                 icon:
                                                      //                     Icon(
                                                      //                   Icons
                                                      //                       .close,
                                                      //                   size: textScale *
                                                      //                       14,
                                                      //                 ),
                                                      //                 onPressed:
                                                      //                     () {
                                                      //                   Provider.of<Users>(context,
                                                      //                           listen: false)
                                                      //                       .cancelTruckReady(widget.user);
                                                      //                   // users.loadTrucksLoading();
                                                      //                 })
                                                      //             : IconButton(
                                                      //                 padding:
                                                      //                     const EdgeInsets
                                                      //                         .all(
                                                      //                         8),
                                                      //                 icon:
                                                      //                     Icon(
                                                      //                   Icons
                                                      //                       .check,
                                                      //                   size: textScale *
                                                      //                       14,
                                                      //                 ),
                                                      //                 onPressed:
                                                      //                     () {
                                                      //                   Provider.of<Users>(context,
                                                      //                           listen: false)
                                                      //                       .truckReady(widget.user);
                                                                       
                                                      //                 }))
                                                      //     : const Padding(
                                                      //         padding:
                                                      //             EdgeInsets
                                                      //                 .all(8.0),
                                                      //         child:
                                                      //             SizedBox()),

                                                     
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
