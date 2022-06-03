import 'package:dengue/provider/authprovider.dart';
import 'package:dengue/screen/dashboard.dart';
import 'package:dengue/screen/login.dart';
import 'package:dengue/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StatusCheck extends StatelessWidget {
  const StatusCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final auth = ref.watch(authProvider);
        return auth.when(
            data: (data) {
              if (data == null) {
                return login_screen();
              } else {
                return main_Screen();
              }
            },
            error: (err, stack) => Text("$err"),
            loading: () => Center(
                  child: CircularProgressIndicator(
                    color: Color(0xffe26a2c),
                  ),
                ));
      },
    );
  }
}
