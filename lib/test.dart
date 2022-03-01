import 'package:flutter/material.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({Key? key}) : super(key: key);

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  List<Map<String, dynamic>> items = [
    {'color': Colors.blue, 'icon': Icons.add},
    {'color': Colors.blue, 'icon': Icons.remove_circle},
    {'color': Colors.amber, 'icon': Icons.share},
    {'color': Colors.blue, 'icon': Icons.add_a_photo},
    {'color': Colors.blue, 'icon': Icons.close},
  ];
  List<Map<String, dynamic>> previousItem = [];

  onPageChange(value) {
    setState(() {
      if (value >= currentIndex) {
        currentIndex = value;

        previousItem.add(items[currentIndex]);
      } else {
        currentIndex = value;
        previousItem.remove(items[currentIndex + 1]);
      } 
    });
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey.shade100),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue.shade50),
                            child: const Icon(Icons.calendar_today_outlined,
                                color: Colors.blue),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Column(
                            children: [
                              const Text(
                                'Al_Ain,Zakhir',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              Text(
                                'On The Way',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.grey.shade400),
                              )
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '19-01-2022',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade400),
                          ),
                          Text(
                            '03:00 PM',
                            style: TextStyle(
                                fontSize: 15, color: Colors.grey.shade400),
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  //DESIGN STEPPER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(items.length, (index) {
                      if (currentIndex == 0) onPageChange(currentIndex);
                      return GestureDetector(
                        onTap: () {
                          onPageChange(index);
                        },
                        child: Row(
                          children: [
                            Container(
                              width:
                                  previousItem.contains(items[index]) ? 30 : 15,
                              height:
                                  previousItem.contains(items[index]) ? 30 : 15,
                              decoration: BoxDecoration(
                                color: previousItem.contains(items[index])
                                    ? items[index]['color']
                                    : Colors.grey.shade400,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: previousItem.contains(items[index])
                                  ? Center(
                                      child: Icon(
                                      items[index]['icon'],
                                      color: Colors.white,
                                      size: 17,
                                    ))
                                  : null,
                            ),
                            Container(
                              width: 30,
                              height: 2,
                              decoration: BoxDecoration(
                                  color: index == items.length - 1
                                      ? null
                                      : previousItem.contains(items[index])
                                          ? items[index]['color']
                                          : Colors.grey.shade400),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
                child: PageView(
              onPageChanged: (value) {
                onPageChange(value);
              },
              children: [
                Container(color: Colors.pink),
                Container(color: Colors.red),
                Container(color: Colors.teal),
                Container(color: Colors.orange),
                Container(color: Colors.green),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
