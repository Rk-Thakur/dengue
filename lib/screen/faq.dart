import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class faq_section extends StatelessWidget {
  List<Map> according = [
    {
      'title': 'What are the Symptoms of the Dengue?',
      'context': '1.Fever \n2.Diziness \n3.Fever '
    },
    {
      'title': 'What are the Symptoms of the Dengue?',
      'context': '1.Fever \n2.Diziness \n3.Fever '
    },
    {
      'title': 'What are the Symptoms of the Dengue?',
      'context': '1.Fever \n2.Diziness \n3.Fever '
    },
    {
      'title': 'What are the Symptoms of the Dengue?',
      'context': '1.Fever \n2.Diziness \n3.Fever '
    },
    {
      'title': 'What are the Symptoms of the Dengue?',
      'context': '1.Fever \n2.Diziness \n3.Fever '
    },
    {
      'title': 'What are the Symptoms of the Dengue?',
      'context': '1.Fever \n2.Diziness \n3.Fever '
    },
    {
      'title': 'What are the Symptoms of the Dengue?',
      'context': '1.Fever \n2.Diziness \n3.Fever '
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Faq Section"),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Color(0xffFDA65D)),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(
          itemCount: according.length,
          itemBuilder: (context, index) {
            return GFAccordion(
              title: according[index]['title'],
              titleBorderRadius: BorderRadius.all(Radius.circular(10)),
              content: according[index]['context'],
              textStyle: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
              contentBorderRadius: BorderRadius.all(Radius.circular(5)),
              collapsedTitleBackgroundColor: Color.fromARGB(255, 210, 160, 75),
              contentBackgroundColor: Colors.amber,
            );
          },
        ),
      ),
    );
  }
}
