import 'package:dengue/provider/crudprovider.dart';
import 'package:dengue/provider/loginprovider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddFaq extends StatelessWidget {
  final question = TextEditingController();
  final answer = TextEditingController();
  final _form = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: Consumer(
      builder: (context, ref, child) {
        final isLoading = ref.watch(loadingProvider);
        return SingleChildScrollView(
          child: Form(
              key: _form,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Column(
                          children: [
                            TextFormField(
                              controller: question,
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              minLines: 1,
                              textCapitalization: TextCapitalization.sentences,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Question is required';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 15),
                                  hintText: 'Question',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: answer,
                              keyboardType: TextInputType.multiline,
                              maxLines: 10,
                              minLines: 1,
                              textCapitalization: TextCapitalization.sentences,
                              validator: (val) {
                                if (val!.isEmpty) {
                                  return 'Answer is required';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 15),
                                  hintText: 'Answer',
                                  border: OutlineInputBorder()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () async {
                                _form.currentState!.save();
                                FocusScope.of(context).unfocus();
                                if (_form.currentState!.validate()) {
                                  final response = await ref
                                      .read(crudProvider)
                                      .addfaq(
                                          question: question.text.trim(),
                                          answer: answer.text.trim());
                                  if (response == 'success') {
                                    Navigator.pop(context);
                                  }
                                }
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.09,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Color(0xffe26a2c),
                                ),
                                child: Center(
                                  child: Text(
                                    "Add Event",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        );
      },
    )));
  }
}
