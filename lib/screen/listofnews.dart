import 'package:cached_network_image/cached_network_image.dart';
import 'package:dengue/provider/newsprovider.dart';
import 'package:dengue/screen/web_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:lottie/lottie.dart';
import 'package:webview_flutter/webview_flutter.dart';

class listofnews extends StatelessWidget {
  const listofnews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: OfflineBuilder(
          builder: (context) => Text(''),
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            if (connectivity == ConnectivityResult.none) {
              return Center(
                child: Column(
                  children: [
                    Lottie.asset('assets/images/wifi.json'),
                    Text(
                      "Please Check your wifi!!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              );
            }
            return Consumer(builder: (context, ref, child) {
              final newspaper = ref.watch(newsProvider);
              return Padding(
                padding: const EdgeInsets.only(
                    top: 30, left: 15, bottom: 0, right: 15),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'TOP NEW\'S',
                        style: TextStyle(
                          fontSize: 20,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: newspaper.isEmpty
                          ? Center(
                              child: GFLoader(type: GFLoaderType.ios),
                            )
                          : ListView.builder(
                              itemCount: newspaper.length,
                              itemBuilder: (context, index) {
                                final paper = newspaper[index];
                                return Column(
                                  children: [
                                    // InkWell(
                                    //   onTap: () {
                                    //     Get.to(() => WebViewWidget(paper.url));
                                    //   },
                                    //   child: Container(
                                    //     height: 200,
                                    //     width: double.infinity,
                                    //     child: ClipRRect(
                                    //       borderRadius:
                                    //           BorderRadius.circular(10),
                                    //       child: CachedNetworkImage(
                                    //         errorWidget: (context, url, error) {
                                    //           return Center(
                                    //             child: GFLoader(
                                    //                 type: GFLoaderType.ios),
                                    //           );
                                    //         },
                                    //         placeholder: (context, String) {
                                    //           return Center(
                                    //             child:
                                    //                 CircularProgressIndicator(
                                    //               color: Colors.pink,
                                    //             ),
                                    //           );
                                    //         },
                                    //         imageUrl: paper.urlToImage,
                                    //         fit: BoxFit.fill,
                                    //       ),
                                    //     ),
                                    //   ),
                                    // ),
                                    InkWell(
                                      onTap: (() {
                                        Get.to(() => WebViewWidget(paper.url),
                                            transition: Transition.fadeIn);
                                      }),
                                      child: Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 5),
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 180,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              offset: Offset(
                                                0.0,
                                                10.0,
                                              ),
                                              blurRadius: 10.0,
                                              spreadRadius: -6.0,
                                            ),
                                          ],
                                          image: DecorationImage(
                                            colorFilter: ColorFilter.mode(
                                              Colors.black.withOpacity(0.35),
                                              BlendMode.multiply,
                                            ),
                                            image:
                                                NetworkImage(paper.urlToImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Row(
                                                      children: [],
                                                    ),
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.all(5),
                                                    margin: EdgeInsets.all(10),
                                                    decoration: BoxDecoration(
                                                      color: Colors.black
                                                          .withOpacity(0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        FaIcon(
                                                          FontAwesomeIcons
                                                              .newspaper,
                                                          color:
                                                              Color(0xffFDA65D),
                                                          size: 18,
                                                        ),
                                                        SizedBox(width: 7),
                                                        Text(
                                                          paper.author,
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                              alignment: Alignment.bottomLeft,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                  ],
                                );
                              }),
                    ),
                  ],
                ),
              );
            });
          }),
    ));
  }
}
