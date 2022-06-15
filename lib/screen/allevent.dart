import 'package:dengue/provider/crudprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllEvent extends StatefulWidget {
  const AllEvent({Key? key}) : super(key: key);

  @override
  State<AllEvent> createState() => _AllEventState();
}

class _AllEventState extends State<AllEvent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(child: Consumer(builder: (context, ref, child) {
          final hospitalStream = ref.watch(postProvider);
          return Column(
            children: [
              Container(
                child: hospitalStream.when(
                    data: (data) {
                      return ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (context, index) {
                            final dat = data[index];
                            return ListTile(
                              title: Text(dat.description),
                            );
                          });
                    },
                    error: (err, stack) => Text("$err"),
                    loading: () => Center(
                        child: CircularProgressIndicator(color: Colors.red))),
              )
            ],
          );
        })));
  }
}
