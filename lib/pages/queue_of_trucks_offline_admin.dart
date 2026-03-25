// import 'package:carregamento_conectado/components/add_user_bottom_offline.dart';
// import 'package:carregamento_conectado/components/container_animated_custom_offline.dart';
// import 'package:carregamento_conectado/components/phone/container_animated_custom_phone.dart';
// import 'package:carregamento_conectado/models/user_plate_model.dart';
// import 'package:carregamento_conectado/providers/user_plate_provider.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';

// class QueueOfTrucksOfflineAdmin extends StatefulWidget {
//   final bool isAdm;
//   final bool load;

//   const QueueOfTrucksOfflineAdmin(
//       {required this.isAdm, required this.load, super.key});

//   @override
//   State<QueueOfTrucksOfflineAdmin> createState() =>
//       _QueueOfTrucksOfflineAdminState();
// }

// var alturaAppBar = AppBar().preferredSize; // altura da Appbar

// class _QueueOfTrucksOfflineAdminState extends State<QueueOfTrucksOfflineAdmin> {
//   // @override
//   // void initState() {
//   //   // TODO: implement initState
//   //   super.initState();
//   //   Provider.of<Users>(context, listen: false).loadAllTrucks();
//   //   // Provider.of<Users>(context, listen: false).loadAllTrucksLoaded();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     final Users users = Provider.of(context);

//     bool isPortraitPhoneSize = MediaQuery.of(context).size.width < 900;

//     var larguraDaTela = MediaQuery.of(context).size.width;
//     var alturaDaTela = MediaQuery.of(context).size.height;
//     double widthScreen = MediaQuery.of(context).size.width;
//     bool isLandScape = MediaQuery.of(context).size.width > 900;
//     bool showWallpaper = MediaQuery.of(context).size.width > 1000;
//     double textScale = MediaQuery.of(context).textScaler.scale(1);
//     List<String> images = [
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_1.jpg?alt=media&token=42f450f5-32f2-46cd-aeab-d8f1e19dc197',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_2.jpg?alt=media&token=8d4b8ad4-5410-409f-9387-2b4ffdd89eb1',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_3.jpg?alt=media&token=cb4045ad-6804-4718-a239-721e89578eef',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_4.jpg?alt=media&token=aee2e175-c88b-4556-888a-0215826c5ec0',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_6.jpg?alt=media&token=9c975c7b-781d-4cb5-8ec0-bba25c874d3d',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_8.jpg?alt=media&token=f91b052f-fae6-4f50-8b0b-5375d70c4856',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_9.jpg?alt=media&token=612c8087-bbaf-4ca5-9f28-df4daf7946ed',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_10.jpg?alt=media&token=4ca9d347-ef0e-4d11-9ae1-75810798a6ad',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_11.jpg?alt=media&token=d99e5085-89d2-465b-b799-6b67c5c7db1f',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_12.jpg?alt=media&token=e3f50385-b4d3-4f1e-93d4-8bbf4dc2a522',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_13.jpg?alt=media&token=3caf16f3-2c41-4773-9155-051f39a1f1ad',
//       'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/wallpaper_14.jpg?alt=media&token=10d7281a-18e5-4c88-838d-1bec9221c384',
//     ];

//     final index = users.indexImage;

//     var alturaCard = alturaDaTela / 16;
//     int coluns = 4;
//     if (users.listTrucksOffline.length <= 15) {
//       coluns = 4;
//     } else if (users.listTrucksOffline.length >= 30 &&
//         users.listTrucksOffline.length <= 45) {
//       coluns = 4;
//     } else if (users.listTrucksOffline.length >= 45 &&
//         users.listTrucksOffline.length <= 60) {
//       coluns = 5;
//     } else if (users.listTrucksOffline.length >= 60 &&
//         users.listTrucksOffline.length <= 75) {
//       coluns = 6;
//     } else if (users.listTrucksOffline.length >= 75 &&
//         users.listTrucksOffline.length <= 90) {
//       coluns = 7;
//     } else if (users.listTrucksOffline.length >= 90 &&
//         users.listTrucksOffline.length <= 105) {
//       coluns = 8;
//     } else if (users.listTrucksOffline.length >= 105 &&
//         users.listTrucksOffline.length <= 120) {
//       coluns = 9;
//     } else if (users.listTrucksOffline.length > 120) {
//       coluns = 11;
//     }
//     var larguraCard = larguraDaTela / coluns;
//     List<UserPlate> trucksOffline = [];
//     users.listTrucksOffline.forEach(
//       (key, value) {
//         trucksOffline.add(value);
//       },
//     );

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: AppBar(
//         backgroundColor: Colors.grey.shade400,
//         title: SingleChildScrollView(
//           child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//             SizedBox(
//                 height: isPortraitPhoneSize ? 18 : 40,
//                 child: Image.network(
//                   'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/logo.png?alt=media&token=2688f229-9396-4ca2-bbb8-8a346e066a10',
//                   fit: BoxFit.contain,
//                 )),
//             SizedBox(
//                 height: isPortraitPhoneSize ? 15 : 30,
//                 child: Image.network(
//                     'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/supercal.png?alt=media&token=477281d7-558d-4206-b6d6-cbe46de6d018',
//                     fit: BoxFit.contain)),
//             const Expanded(child: SizedBox()),
//             Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(right: 2),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.end,
//                     children: [
//                       Text(
//                         DateFormat('dd/MM/y').format(
//                           DateTime.now(),
//                         ),
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: textScale * 9,
//                             color: Colors.black54),
//                       ),
//                       Text(
//                         DateFormat('HH:mm').format(
//                           DateTime.now(),
//                         ),
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: textScale * 9,
//                             color: Colors.black54),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             GestureDetector(
//               child: IconButton(
//                   padding: const EdgeInsets.all(0),
//                   icon: Icon(
//                     Icons.cloud_download_outlined,
//                     size: textScale * 35,
//                     color: Colors.grey.shade300,
//                   ),
//                   onPressed: () {}),
//               onDoubleTap: () {
//                 users.addTrucksOfflineToOnline();
//               },
//             ),
//             // IconButton(
//             //     onPressed: () {
//             //       users.addTrucksOfflineToOnline();
//             //     },
//             //     icon: Icon(
//             //       Icons.cloud_download_outlined,
//             //       size: 35,
//             //       color: Colors.grey.shade300,
//             //     ))
//           ]),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: Colors.redAccent,
//         onPressed: () {
//           // setState(() {});
//           showModalBottomSheet(
//             backgroundColor: Colors.grey.shade300,
//             isScrollControlled: true,
//             context: context,
//             builder: (context) {
//               return Padding(
//                 padding: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).viewInsets.bottom),
//                 child: SizedBox(
//                   height: isPortraitPhoneSize ? 400 : 500,
//                   width: double.infinity,
//                   child: const SingleChildScrollView(
//                     child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//                       child: Column(
//                         children: [
//                           UserBotoomOffline(),
//                           SizedBox(
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
//         child: const Icon(
//           Icons.add,
//           color: Colors.white,
//         ),
//       ),
//       body: Stack(children: [
//         Center(
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               showWallpaper
//                   ? SizedBox(
//                       height: alturaDaTela - 10,
//                       width: widthScreen,
//                       child: Image.network(
//                         images[index],
//                         fit: BoxFit.fill,
//                         width: widthScreen,
//                       ))
//                   : Center(
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(
//                               height: widthScreen * 0.10,
//                               child: Image.network(
//                                   'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/logo.png?alt=media&token=2688f229-9396-4ca2-bbb8-8a346e066a10',
//                                   fit: BoxFit.contain,
//                                   color: Colors.grey.withOpacity(0.8))),
//                           SizedBox(
//                               height: widthScreen * 0.10,
//                               child: Image.network(
//                                 'https://firebasestorage.googleapis.com/v0/b/minha-autenticidade.appspot.com/o/supercal.png?alt=media&token=477281d7-558d-4206-b6d6-cbe46de6d018',
//                                 fit: BoxFit.contain,
//                                 color: Colors.grey.withOpacity(0.8),
//                               )),
//                         ],
//                       ),
//                     ),
//             ],
//           ),
//         ),
//         PageView(
//           physics: const NeverScrollableScrollPhysics(),
//           children: [
//             isLandScape
//                 ? SingleChildScrollView(
//                     padding: const EdgeInsets.all(0),
//                     scrollDirection: Axis.horizontal,
//                     child: Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 2),
//                         child: Wrap(
//                             direction: Axis.vertical,
//                             spacing: 4,
//                             runSpacing: 1,
//                             children: trucksOffline.map((e) {
//                               int index = trucksOffline.indexOf(e);
//                               return ContainerAnimatedCustomOffline(
//                                   load: widget.load,
//                                   isAdm: widget.isAdm,
//                                   index: index,
//                                   user: e,
//                                   cardHeight: alturaCard,
//                                   cardWidth: larguraCard);
//                             }).toList())))
//                 : Padding(
//                     padding: const EdgeInsets.all(4),
//                     child: ListView(
//                       children: trucksOffline.map((e) {
//                         int index = trucksOffline.indexOf(e);
//                         return Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 2),
//                           child: ContainerAnimatedCustomPhone(
//                               load: widget.load,
//                               isAdm: widget.isAdm,
//                               index: index,
//                               user: e,
//                               cardHeight: 50,
//                               cardWidth: 300),
//                         );
//                       }).toList(),
//                     ),
//                   )
//           ],
//         )
//       ]),
//     );
//   }
// }
