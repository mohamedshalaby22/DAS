// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_3/bottom_screens/first_screen.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/components/text2.dart';
import 'package:flutter_application_3/constant/const.dart';

class Detail1 extends StatelessWidget {
  final Data data;

  Detail1(this.data);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: const LeadingIcon()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPading),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text2(
                text: data.subjects,
              ),
              const SizedBox(
                height: defaultPading,
              ),
              const ListTile(
                leading: CircleAvatar(
                    radius: 20, backgroundImage: AssetImage('assets/p1.png')),
                title: Text(
                  'Dr:Marawa ali',
                  style: TextStyle(color: Colors.black),
                ),
                trailing: Icon(Icons.more_horiz_rounded),
              ),
              Container(
                margin: const EdgeInsets.only(
                    top: defaultPading / 2, bottom: defaultPading),
                padding: const EdgeInsets.all(defaultPading / 2),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade50,
                  //border: Border.all(color: Colors.black)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'غدا ان شاء الله بعد المحاضره الاولي كل التيمات تيجي عندي المكتب بالدور عشان نبدا نشوف مشاريع التخرج بالتوفيق',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontSize: 18, color: Colors.black, height: 1.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: defaultPading, bottom: defaultPading),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset('assets/re.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 200),
                      ),
                    ),
                    Text('0 Comment',
                        style: TextStyle(color: Colors.grey.shade500)),
                    const Padding(
                      padding: EdgeInsets.only(
                          top: defaultPading / 3, bottom: defaultPading / 3),
                      child: Divider(
                        thickness: 1,
                      ),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage('assets/p1.png')),
                        const SizedBox(
                          width: defaultPading / 2,
                        ),
                        Expanded(
                          child: Container(
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(20)),
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: defaultPading / 2, top: 12),
                              child: Text(
                                'Add Comment',
                                style: TextStyle(color: Colors.grey.shade500),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
