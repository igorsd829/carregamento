import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:carregamento_conectado/utils/clip_board.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ContainerAnimatedCustomPhoneWindow extends StatefulWidget {
  final bool isAdm;
  final bool load;

  final UserPlate user;
  final double cardWidth;
  final double cardHeight;
  final int index;

  const ContainerAnimatedCustomPhoneWindow(
      {required this.index,
      required this.user,
      required this.load,
      required this.isAdm,
      required this.cardHeight,
      required this.cardWidth,
      super.key});

  @override
  State<ContainerAnimatedCustomPhoneWindow> createState() =>
      _ContainerAnimatedCustomPhoneWindowState();
}

class _ContainerAnimatedCustomPhoneWindowState
    extends State<ContainerAnimatedCustomPhoneWindow> {
  bool open = false;
  bool about = false;
  bool enter = false;
  bool notFound = false;
  bool found = false;
  bool sending = false;

  Color statusCard = Colors.blue;
  Color colorTruck = Colors.grey.shade300;
  bool showColorTruck = true;
  Color colorBorderCardTruck = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context, listen: false);
    int userNameLength = widget.user.name.length;

    if (widget.user.loading) {
      statusCard = Colors.greenAccent;
    } else if (widget.user.notFound) {
      statusCard = Colors.redAccent;
    } else {
      statusCard = Colors.grey.shade400.withOpacity(0.7);
    }

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
      showColorTruck = false;
    }
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
      height: open ? widget.cardWidth * 4 : widget.cardHeight, ////
      width: open ? widget.cardWidth : widget.cardWidth,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              statusCard,
              statusCard,
              statusCard,
              statusCard.withOpacity(0.9),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 1,
            vertical: 2,
          ),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 2,
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
                        child: InkWell(
                          onDoubleTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.user_form_view,
                              arguments: widget.user,
                            );
                          },
                          child: Column(
                            children: [
                              widget.index < 9
                                  ? Text('0${widget.index + 1}º',
                                      style:
                                          TextStyle(fontSize: textScale * 22))
                                  : Text('${widget.index + 1}º',
                                      style:
                                          TextStyle(fontSize: textScale * 22)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: InkWell(
                        onLongPress: () {
                          widget.isAdm
                              ? Navigator.of(
                                  context,
                                ).pushNamed(AppRoutes.user_form_new,
                                  arguments: widget.user)
                              : null;
                        },
                        onDoubleTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.user_form_view,
                            arguments: widget.user,
                          );
                        },
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(1),
                                      child: Text(
                                          '${widget.user.plate.substring(0, 3).toUpperCase()}-${widget.user.plate.substring(3, 7).toUpperCase()}',
                                          style: TextStyle(
                                              fontSize: textScale * 16)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 0,
                    ),
                    // Expanded(child: SizedBox()),
                    Expanded(
                      child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          child: widget.load
                              ? const SizedBox()
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    widget.isAdm
                                        ? Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      widget.user.autorized =
                                                          false;
                                                      widget.user.notFound =
                                                          false;
                                                      widget.user.autorized =
                                                          false;
                                                      widget.user.loading =
                                                          false;

                                                      statusCard =
                                                          Colors.grey.shade300;
                                                      users.noProblem(
                                                          widget.user);
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.refresh,
                                                    size: textScale * 20,
                                                  )),
                                              IconButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      widget.user.notFound =
                                                          !widget.user.notFound;
                                                      widget.user.autorized =
                                                          !widget
                                                              .user.autorized;
                                                      users.isNotFound(
                                                          widget.user);
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.close,
                                                    size: textScale * 20,
                                                  )),
                                              GestureDetector(
                                                child: IconButton(
                                                    padding:
                                                        const EdgeInsets.all(0),
                                                    icon: Icon(
                                                      Icons.delete,
                                                      size: textScale * 14,
                                                    ),
                                                    onPressed: () {}),
                                                onDoubleTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return AlertDialog(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            2)),
                                                        title: const Text(
                                                            'Remover esse caminhão?'),
                                                        content: const Text(''),
                                                        actions: [
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .pop();
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                  foregroundColor:
                                                                      Colors
                                                                          .black54,
                                                                  shape:
                                                                      const RoundedRectangleBorder(),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .grey
                                                                          .shade200),
                                                              child: Text(
                                                                'NÂO',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      textScale *
                                                                          12,
                                                                ),
                                                              )),
                                                          ElevatedButton(
                                                              onPressed: () {
                                                                users.removeTruckList(
                                                                    widget
                                                                        .user);
                                                                Navigator.of(
                                                                  context,
                                                                ).pop();
                                                              },
                                                              style: ElevatedButton.styleFrom(
                                                                  foregroundColor:
                                                                      Colors
                                                                          .black54,
                                                                  shape:
                                                                      const RoundedRectangleBorder(),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .grey
                                                                          .shade200),
                                                              child: Text(
                                                                'SIM',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      textScale *
                                                                          12,
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
                                        : widget.user.name != ''
                                            ? Container(
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.black
                                                            .withOpacity(0.7),
                                                        width: 1),
                                                    color: Colors.white,
                                                    borderRadius:
                                                        const BorderRadius.all(
                                                            Radius.circular(
                                                                5))),
                                                child: userNameLength > 8
                                                    ? Text(
                                                        '${widget.user.name.substring(0, 9).toUpperCase()}.',
                                                        style: TextStyle(
                                                            fontSize:
                                                                textScale * 14))
                                                    : Text(
                                                        '${widget.user.name.toUpperCase()}.',
                                                        style: TextStyle(
                                                            fontSize:
                                                                textScale *
                                                                    14)),
                                              )
                                            : const SizedBox(),
                                    
                                         !widget.load && widget.user.idTruck != ''
                                  ? IconButton(
                                      padding: const EdgeInsets.all(0),
                                      icon: Icon(
                                        Icons.calendar_month,
                                        size: textScale * 14,
                                      ),
                                      onPressed: () {
                                        ClipBoardCustom.copy(
                                            widget.user.idTruck!);
                                      }):
                            
                              
                            
                           const SizedBox(),
                                    const SizedBox(),
                                    const SizedBox(),
                                    const SizedBox(),
                                  ],
                                )),
                    ),

                    widget.load || !showColorTruck
                        ? const SizedBox(
                            width: 0,
                          )
                        : const SizedBox(
                            width: 10,
                          ),
                    // const Expanded(child: SizedBox()),
                    widget.load || !showColorTruck
                        ? const SizedBox()
                        : Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(4),
                              color: colorTruck,
                            ),
                            height: 22,
                            width: 20,
                          ),
                    //////////////////// AGENDAMENTO \\\\\\\\\\\\\\\\\\\\\\\\\\\
                    // widget.isAdm && widget.user.idTruck != ''
                    //     ? IconButton(
                    //         onPressed: () {
                    //           ClipBoardCustom.copy(widget.user.idTruck!);
                    //         },
                    //         icon: const Icon(Icons.calendar_month))
                    //     : const SizedBox(),
                    //////////////////// AGENDAMENTO \\\\\\\\\\\\\\\\\\\\\\\\\\\

                    // widget.user.loading && widget.isAdm

                    widget.user.loading && widget.isAdm && !widget.load
                        ? Padding(
                            padding: const EdgeInsets.all(0),
                            child: Material(
                                shadowColor: Colors.black,
                                color: Colors.transparent,
                                child: widget.load
                                    ? const SizedBox()
                                    : InkWell(
                                        splashColor: Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                        onLongPress: () {
                                          users.addTruckListLoading2(
                                              widget.user);
                                        },
                                        child: IconButton(
                                            padding: EdgeInsets.all(8),
                                            icon: Icon(
                                              Icons.upload,
                                              size: textScale * 30,
                                            ),
                                            onPressed: () {}),
                                      )))
                        : widget.isAdm && !widget.load
                            ? IconButton(
                                icon: Icon(
                                  Icons.check,
                                  size: textScale * 30,
                                  color: Colors.black45,
                                ),
                                onPressed: () {
                                  setState(
                                    () {
                                      widget.user.loading = true;
                                    },
                                  );
                                  users.isAutorized(widget.user, sending,
                                      widget.user.loading);
                                })
                            : Padding(
                                padding: const EdgeInsets.all(0),
                                child: widget.load
                                    ? IconButton(
                                        padding: const EdgeInsets.all(0),
                                        icon: Icon(
                                          color: Colors.black45,
                                          Icons.refresh,
                                          size: textScale * 30,
                                        ),
                                        onPressed: () {})
                                    : const SizedBox(
                                        width: 20,
                                      ),
                              )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                about
                    ? SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    widget.isAdm && widget.user.idTruck != ''
                                        ? Row(
                                            children: [
                                              Text(
                                                'ID: ${widget.user.idTruck!.toUpperCase()}',
                                                style: TextStyle(
                                                    fontSize: textScale * 15,
                                                    color: Colors.black87),
                                              ),
                                              // Padding(
                                              //   padding:
                                              //       const EdgeInsets.all(0),
                                              //   child: Icon(
                                              //     Icons.calendar_month,
                                              //     size: textScale * 15,
                                              //   ),
                                              // ),
                                              // IconButton(
                                              //     padding:
                                              //         const EdgeInsets.all(0),
                                              //     icon: Icon(
                                              //       Icons.calendar_month,
                                              //       size: textScale * 15,
                                              //     ),
                                              //     onPressed: () {
                                              //       ClipBoardCustom.copy(
                                              //           widget.user.idTruck!);
                                              //     }),
                                            ],
                                          )
                                        : const SizedBox(),
                                    Row(
                                      children: [
                                        widget.user.name != ''
                                            ? Text(
                                                '${widget.user.name.toUpperCase()}',
                                                style: TextStyle(
                                                    fontSize: textScale * 15,
                                                    color: Colors.black87),
                                              )
                                            : const SizedBox(),
                                        widget.user.name != ''
                                            ? const SizedBox(
                                                width: 10,
                                              )
                                            : const SizedBox(),
                                        Text(
                                          // ignore: unnecessary_null_comparison
                                          DateFormat('dd/MM/y, HH:mm')
                                                  .format(
                                                  widget.user.date,
                                                ),
                                          style: TextStyle(
                                              fontSize: textScale * 15,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                    widget.user.obs != ''
                                        ? Text(
                                            'OBSERVAÇÃO: ${widget.user.obs.toUpperCase()}',
                                            style: TextStyle(
                                                fontSize: textScale * 15,
                                                color: Colors.black87),
                                          )
                                        : const SizedBox(),
                                    widget.load
                                        ? const Row()
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              widget.isAdm
                                                  ? Row(
                                                      children: [
                                                        // IconButton(
                                                        //     onPressed: () {
                                                        //       setState(() {
                                                        //         widget.user
                                                        //                 .autorized =
                                                        //             false;
                                                        //         widget.user
                                                        //                 .notFound =
                                                        //             false;
                                                        //         widget.user
                                                        //                 .autorized =
                                                        //             false;
                                                        //         widget.user
                                                        //                 .loading =
                                                        //             false;

                                                        //         statusCard =
                                                        //             Colors.grey
                                                        //                 .shade300;
                                                        //         users.noProblem(
                                                        //             widget
                                                        //                 .user);
                                                        //       });
                                                        //     },
                                                        //     icon: Icon(
                                                        //       Icons.refresh,
                                                        //       size: textScale *
                                                        //           20,
                                                        //     )),
                                                        // IconButton(
                                                        //     onPressed: () {
                                                        //       setState(() {
                                                        //         widget.user
                                                        //                 .notFound =
                                                        //             !widget.user
                                                        //                 .notFound;
                                                        //         widget.user
                                                        //                 .autorized =
                                                        //             !widget.user
                                                        //                 .autorized;
                                                        //         users.isNotFound(
                                                        //             widget
                                                        //                 .user);
                                                        //       });
                                                        //     },
                                                        //     icon: Icon(
                                                        //       Icons.close,
                                                        //       size: textScale *
                                                        //           20,
                                                        //     )),
                                                        IconButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                context,
                                                              ).pushNamed(
                                                                  AppRoutes
                                                                      .user_form_new,
                                                                  arguments:
                                                                      widget
                                                                          .user);
                                                            },
                                                            icon: Icon(
                                                              Icons.edit,
                                                              size: textScale *
                                                                  20,
                                                            )),
                                                        GestureDetector(
                                                          child: IconButton(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .all(0),
                                                              icon: Icon(
                                                                Icons.delete,
                                                                size:
                                                                    textScale *
                                                                        14,
                                                              ),
                                                              onPressed: () {}),
                                                          onDoubleTap: () {
                                                            showDialog(
                                                              context: context,
                                                              builder:
                                                                  (context) {
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
                                                                                .grey.shade200),
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
                                                                          users.removeTruckList(
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
                                                                                .grey.shade200),
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
                                                  : const SizedBox(),
                                              const SizedBox(),
                                              const SizedBox(),
                                              const SizedBox(),
                                            ],
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
