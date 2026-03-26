import 'package:carregamento_conectado/models/user_plate_model.dart';
import 'package:carregamento_conectado/providers/user_plate_provider.dart';
import 'package:carregamento_conectado/utils/app_routs.dart';
import 'package:carregamento_conectado/utils/clip_board.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ContainerAnimatedCustom extends StatefulWidget {
  final bool isAdm;
  final bool load;

  final UserPlate user;
  final double cardWidth;
  final double cardHeight;
  final int index;
  const ContainerAnimatedCustom({
    required this.index,
    required this.isAdm,
    required this.load,
    required this.user,
    required this.cardHeight,
    required this.cardWidth,
    super.key,
  });

  @override
  State<ContainerAnimatedCustom> createState() =>
      _ContainerAnimatedCustomState();
}

class _ContainerAnimatedCustomState extends State<ContainerAnimatedCustom> {
  bool open = false;
  bool about = false;
  bool enter = false;
  bool notFound = false;
  bool found = false;
  bool sending = false;
  bool showColorTruck = true;
  Color colorBorderCardTruck = Colors.transparent;

  Color statusCard = Colors.white;
  Color colorTruck = Colors.grey.shade300;

  @override
  Widget build(BuildContext context) {
    if (widget.user.loading) {
      statusCard = Colors.greenAccent;
    } else if (widget.user.notFound) {
      statusCard = Colors.redAccent;
    } else {
      // statusCard = Colors.grey.shade400;
      statusCard = Colors.white;
    }
    final Users users = Provider.of(context, listen: false);
    // bool isAdm = users.adm;

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

    // if (widget.user.notFound) {
    //   setState(() {
    //     statusCard = Colors.redAccent;
    //   });
    // } else if (widget.user.loading) {
    //   setState(() {
    //     statusCard = Colors.greenAccent;
    //   });
    // }

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
          gradient: LinearGradient(
            colors: [
              statusCard,
              statusCard,
              statusCard,
              statusCard,
              statusCard,
              statusCard,
              statusCard,
              statusCard.withOpacity(0.7),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
                          child: InkWell(
                            onTap: () {
                              ClipBoardCustom.copy(widget.user.idTruck!);
                            },
                            child: Column(
                              children: [
                                widget.index < 9
                                    ? Text(
                                        '0${widget.index + 1}º',
                                        style: TextStyle(
                                          fontSize: textScale * 20,
                                        ),
                                      )
                                    : Text(
                                        '${widget.index + 1}º',
                                        style: TextStyle(
                                          fontSize: textScale * 20,
                                        ),
                                      ),
                                ////////////////////////////////////
                                // Container(
                                //   color: colorTruck,
                                //   height: 5, ////////////////color truck
                                //   width: 30,
                                // ),
                                ////////////////////////////////////
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      // Expanded(child: SizedBox()),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
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
                                      width: 1,
                                    ),
                                    color: Colors.white,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Text(
                                    '${widget.user.plate.substring(0, 3).toUpperCase()}-${widget.user.plate.substring(3, 7).toUpperCase()}',
                                    style: TextStyle(fontSize: textScale * 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      showColorTruck
                          ? Row(
                              children: [
                                const SizedBox(width: 5),
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: colorBorderCardTruck,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                    color: colorTruck,
                                  ),
                                  height: 22,
                                  width: 10,
                                ),
                              ],
                            )
                          : const SizedBox(width: 0),
                      widget.isAdm
                          ? Row(
                              children: [
                                widget.user.loading
                                    ? GestureDetector(
                                        child: widget.load
                                            ? IconButton(
                                                padding: const EdgeInsets.all(
                                                  0,
                                                ),
                                                icon: Icon(
                                                  Icons.refresh,
                                                  size: textScale * 14,
                                                ),
                                                onPressed: () {},
                                              )
                                            : IconButton(
                                                padding: const EdgeInsets.all(
                                                  0,
                                                ),
                                                icon: Icon(
                                                  Icons.upload,
                                                  size: textScale * 14,
                                                ),
                                                onPressed: () {},
                                              ),
                                        onDoubleTap: () {
                                          if (widget.load) {
                                            return;
                                          } else {
                                            users.addTruckListLoading(
                                              widget.user,
                                            );
                                          }
                                        },
                                      )
                                    : GestureDetector(
                                        child: widget.load
                                            ? IconButton(
                                                padding: const EdgeInsets.all(
                                                  0,
                                                ),
                                                icon: Icon(
                                                  Icons.refresh,
                                                  size: textScale * 14,
                                                ),
                                                onPressed: () {},
                                              )
                                            : IconButton(
                                                padding: const EdgeInsets.all(
                                                  0,
                                                ),
                                                icon: Icon(
                                                  Icons.check,
                                                  size: textScale * 14,
                                                ),
                                                onPressed: () {},
                                              ),
                                        onDoubleTap: () {
                                          if (widget.load) {
                                            return;
                                          } else {
                                            users.isAutorized(
                                              widget.user,
                                              sending,
                                              widget.user.loading,
                                            );
                                          }
                                        },
                                      ),
                              ],
                            )
                          : const SizedBox(),
                      widget.isAdm && widget.user.idTruck != ''
                          ? GestureDetector(
                              child: widget.load
                                  ? IconButton(
                                      padding: const EdgeInsets.all(0),
                                      icon: Icon(
                                        Icons.refresh,
                                        size: textScale * 14,
                                      ),
                                      onPressed: () {},
                                    )
                                  : IconButton(
                                      padding: const EdgeInsets.all(0),
                                      icon: Icon(
                                        Icons.calendar_month,
                                        size: textScale * 14,
                                      ),
                                      onPressed: () {
                                        ClipBoardCustom.copy(
                                          widget.user.idTruck!,
                                        );
                                      },
                                    ),
                              onDoubleTap: () {},
                            )
                          : const SizedBox(),
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
                                width: 1,
                              ),
                              color: Colors.white,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
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
                                                  fontSize: textScale * 10,
                                                  color: Colors.black87,
                                                ),
                                              ),
                                            ],
                                          )
                                        : const SizedBox(),
                                    Text(
                                      'MOTORISTA: ${widget.user.name.toUpperCase()}',
                                      style: TextStyle(
                                        fontSize: textScale * 10,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    widget.user.obs != ''
                                        ? Text(
                                            'OBSERVAÇÃO: ${widget.user.obs.toUpperCase()}',
                                            style: TextStyle(
                                              fontSize: textScale * 10,
                                              color: Colors.black87,
                                            ),
                                          )
                                        : const SizedBox(),
                                    widget.isAdm && widget.user.client != ''
                                        ? Text(
                                            'CLIENTE: ${widget.user.client.toUpperCase()}',
                                            style: TextStyle(
                                              fontSize: textScale * 10,
                                              color: Colors.black87,
                                            ),
                                          )
                                        : const SizedBox(),

                                    Text(
                                      // ignore: unnecessary_null_comparison
                                      'CHEGADA: ${DateFormat('dd/MM/y, HH:mm').format(widget.user.date)}',
                                      style: TextStyle(
                                        fontSize: textScale * 10,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    widget.load
                                        ? const SizedBox()
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
                                                              const EdgeInsets.all(
                                                                0,
                                                              ),
                                                          icon: Icon(
                                                            Icons.refresh,
                                                            size:
                                                                textScale * 14,
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                        onDoubleTap: () {
                                                          widget
                                                                  .user
                                                                  .autorized =
                                                              false;
                                                          widget.user.notFound =
                                                              false;
                                                          widget
                                                                  .user
                                                                  .autorized =
                                                              false;
                                                          widget.user.loading =
                                                              false;

                                                          statusCard = Colors
                                                              .grey
                                                              .shade300;
                                                          users.noProblem(
                                                            widget.user,
                                                          );
                                                        },
                                                      ),

                                                      GestureDetector(
                                                        child: IconButton(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                0,
                                                              ),
                                                          icon: Icon(
                                                            Icons.close,
                                                            size:
                                                                textScale * 14,
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                        onDoubleTap: () {
                                                          widget.user.notFound =
                                                              !widget
                                                                  .user
                                                                  .notFound;
                                                          widget
                                                                  .user
                                                                  .autorized =
                                                              !widget
                                                                  .user
                                                                  .autorized;
                                                          users.isNotFound(
                                                            widget.user,
                                                          );
                                                        },
                                                      ),

                                                      GestureDetector(
                                                        child: IconButton(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                0,
                                                              ),
                                                          icon: Icon(
                                                            Icons.edit,
                                                            size:
                                                                textScale * 14,
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                        onDoubleTap: () {
                                                          Navigator.of(
                                                            context,
                                                          ).pushNamed(
                                                            AppRoutes
                                                                .user_form_new,
                                                            arguments:
                                                                widget.user,
                                                          );
                                                        },
                                                      ),

                                                      GestureDetector(
                                                        child: IconButton(
                                                          padding:
                                                              const EdgeInsets.all(
                                                                0,
                                                              ),
                                                          icon: Icon(
                                                            Icons.delete,
                                                            size:
                                                                textScale * 14,
                                                          ),
                                                          onPressed: () {},
                                                        ),
                                                        onDoubleTap: () {
                                                          showDialog(
                                                            context: context,
                                                            builder: (context) {
                                                              return AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        2,
                                                                      ),
                                                                ),
                                                                title: const Text(
                                                                  'Remover esse caminhão?',
                                                                ),
                                                                content:
                                                                    const Text(
                                                                      '',
                                                                    ),
                                                                actions: [
                                                                  ElevatedButton(
                                                                    onPressed: () {
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
                                                                      backgroundColor: Colors
                                                                          .grey
                                                                          .shade200,
                                                                    ),
                                                                    child: Text(
                                                                      'NÂO',
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            textScale *
                                                                            12,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  ElevatedButton(
                                                                    onPressed: () {
                                                                      Provider.of<Users>(
                                                                        context,
                                                                        listen:
                                                                            false,
                                                                      ).clearListOffline();

                                                                      users.removeTruckList(
                                                                        widget
                                                                            .user,
                                                                      );
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
                                                                      backgroundColor: Colors
                                                                          .grey
                                                                          .shade200,
                                                                    ),
                                                                    child: Text(
                                                                      'SIM',
                                                                      style: TextStyle(
                                                                        fontSize:
                                                                            textScale *
                                                                            12,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                : const SizedBox(),
                                          ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
