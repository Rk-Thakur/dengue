// Container(
//                               width: 106,
//                               height: 120,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 border: Border.all(
//                                   color: Color(0xffe26a2c),
//                                 ),
//                               ),
//                               child: Center(
//                                 child: db.image == null
//                                     ? Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           FaIcon(
//                                             FontAwesomeIcons.image,
//                                             size: 35,
//                                             color: Colors.grey,
//                                           ),
//                                           Text(
//                                             "Select Image",
//                                             style: TextStyle(
//                                               fontSize: 10,
//                                               height: 2,
//                                               color: Colors.grey,
//                                             ),
//                                           )
//                                         ],
//                                       )
//                                     : Image.file(
//                                         File(db.image!.path),
//                                         fit: BoxFit.cover,
//                                       ),
//                               ),
//                             ),