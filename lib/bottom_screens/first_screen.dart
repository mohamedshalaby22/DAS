// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_application_3/Screens/on_borading_screen.dart';
import 'package:flutter_application_3/components/text2.dart';
import 'package:flutter_application_3/constant/const.dart';
import 'package:flutter_application_3/details/detail1.dart';
import 'package:get/get.dart';

class Data {
  String subjects;
  Color color;
  Data({
    required this.subjects,
    required this.color,
  });
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  List<Data> items = [
    Data(
      subjects: 'Computer Graphics',
      color: Colors.red,
    ),
    Data(
      subjects: 'Wireless and\nMobile NetWorks',
      color: Colors.purpleAccent,
    ),
    Data(
      subjects: 'Virtual Reality',
      color: Colors.amber,
    ),
    Data(
      subjects: 'Selected Topics',
      color: Colors.pinkAccent,
    ),
    Data(
      subjects: 'Computer Animation',
      color: const Color(0xff26a69a),
    ),
  ];

  int _currentIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _currentIndex >= 0
          ? FloatingActionButton(
              onPressed: () {
                Get.to(Detail1(items[_currentIndex]));
              },
              child: const Icon(Icons.arrow_forward_ios_rounded),
            )
          : null,
      appBar: AppBar(
        centerTitle: true,
        leading: const Padding(
          padding: EdgeInsets.only(left: defaultPading / 2),
          child: DasText(),
        ),
        leadingWidth: 70,
        actions: [
          Stack(
            children: [
              IconButton(
                  color: Colors.white,
                  iconSize: 27,
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications,
                    color: primaryColor,
                  )),
              const Positioned(
                right: 6,
                top: 6,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: Colors.pink,
                  child: Text(
                    '3',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
            top: defaultPading, left: defaultPading, right: defaultPading),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text2(
              text: 'Subjects of The Year',
            ),
            const SizedBox(
              height: defaultPading * 2,
            ),
            Expanded(
              child: GridView.builder(
                  itemCount: items.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: defaultPading,
                      crossAxisSpacing: defaultPading),
                  itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 400),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.shade50,
                            border: Border.all(
                                width: 2,
                                color: _currentIndex == index
                                    ? primaryColor
                                    : primaryColor.withOpacity(0)),
                          ),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: items[index].color,
                                child: Text(
                                  items[index].subjects.substring(0, 1),
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(
                                height: defaultPading,
                              ),
                              Text(
                                items[index].subjects,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          )),
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}


/*

 var width = MediaQuery.of(context).size.width;
 var height = MediaQuery.of(context).size.height;


*/