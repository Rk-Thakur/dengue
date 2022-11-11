import 'dart:io';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dengue/provider/authprovider.dart';
import 'package:dengue/provider/crudprovider.dart';
import 'package:dengue/provider/image_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommunityChat extends StatelessWidget {
  final textController = TextEditingController();
  final uid = FirebaseAuth.instance.currentUser!.uid;
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(child: Consumer(
                builder: (context, ref, child) {
                  final user = ref.watch(userStream);
                  final chats = ref.watch(chatProvider);
                  return user.when(
                      data: (dat) {
                        return chats.when(
                            data: (data) {
                              return ListView.builder(
                                itemCount: data.length,
                                itemBuilder: (context, index) {
                                  final dat = data[index];

                                  return Row(
                                    mainAxisAlignment: uid == dat.userId
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: uid == dat.userId
                                              ? Theme.of(context).accentColor
                                              : Colors.grey[300],
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        width: 200,
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10, horizontal: 16),
                                        margin: EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 8),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Column(
                                                  children: [
                                                    CircleAvatar(
                                                      radius: 20,
                                                      backgroundImage:
                                                          NetworkImage(
                                                              dat.postimage),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Container(
                                                  child: Column(
                                                    children: [
                                                      AutoSizeText(
                                                        dat.text,
                                                        style: TextStyle(
                                                          color: uid ==
                                                                  dat.userId
                                                              ? Colors.white
                                                              : Colors.purple,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            dat.profilepicture != ''
                                                ? Container(
                                                    height: 200,
                                                    width: double.infinity,
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      child: CachedNetworkImage(
                                                        placeholder:
                                                            (context, String) {
                                                          return Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                              color:
                                                                  Colors.pink,
                                                            ),
                                                          );
                                                        },
                                                        imageUrl:
                                                            dat.profilepicture,
                                                        fit: BoxFit.fill,
                                                      ),
                                                    ),
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            error: (err, stack) => Text("${err}"),
                            loading: () => Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.purpleAccent,
                                  ),
                                ));
                      },
                      error: (err, stack) => Text('${err}'),
                      loading: () => Center(
                            child:
                                CircularProgressIndicator(color: Colors.purple),
                          ));
                },
              )),
              Container(child: Consumer(builder: (context, ref, child) {
                final user = ref.watch(userStream);
                final db = ref.watch(imageProvider);
                return user.when(
                    data: (data) {
                      return Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 8),
                        padding: EdgeInsets.all(8),
                        child: Form(
                          key: _form,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: TextField(
                                      controller: textController,
                                      minLines: 1,
                                      maxLines: 5,
                                      keyboardType: TextInputType.multiline,
                                      decoration: InputDecoration(
                                          suffixIcon: IconButton(
                                              onPressed: () {
                                                ref
                                                    .read(imageProvider)
                                                    .getImage();
                                              },
                                              icon: Icon(Icons.image)),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            borderSide: const BorderSide(
                                                color: Color.fromARGB(
                                                    255, 239, 235, 234),
                                                width: 2.0),
                                          ),
                                          labelText: "Message",
                                          hintText: 'Send a Message',
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20))),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  IconButton(
                                      onPressed: () async {
                                        if (textController.text.isNotEmpty) {
                                          final response = ref
                                              .read(crudProvider)
                                              .add_message(
                                                  textController.text.trim(),
                                                  uid,
                                                  data.userImage,
                                                  data.userName,
                                                  db.image

                                                  // username:
                                                  );

                                          textController.clear();
                                          db.image == null;
                                          // Navigator.pop(context);
                                        }
                                      },
                                      icon: Icon(Icons.send)),
                                ],
                              ),
                              db.image != null
                                  ? Container(
                                      height: 200,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: db.image == null
                                          ? null
                                          : ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.file(
                                                File(db.image!.path),
                                                fit: BoxFit.fill,
                                              ),
                                            ))
                                  : Container(),
                            ],
                          ),
                        ),
                      );
                    },
                    error: (err, stack) => Text("$err"),
                    loading: () => Center(
                          child:
                              CircularProgressIndicator(color: Colors.purple),
                        ));
              }))
            ],
          ),
        ),
      ),
    );
  }
}
