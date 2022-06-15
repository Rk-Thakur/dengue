import 'package:dengue/provider/crudprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AllHospital extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pink,
        body: SafeArea(child: Consumer(builder: (context, ref, child) {
          final hospitalStream = ref.watch(hospitalProvider);
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
                              title: Text(dat.hospital_name),
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
