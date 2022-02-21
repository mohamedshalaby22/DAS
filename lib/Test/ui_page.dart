// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class UiPage extends StatelessWidget {
  UiPage({Key? key}) : super(key: key);
  BoxDecoration fdeco = BoxDecoration(
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(12),
    color: Colors.grey[200],
  );

  List companyJobs = [
    ['Uber', 'Ui Designer', 'assets/up.png', 45],
    ['Google', 'Product Dev', 'assets/gog.png', 80],
    ['Apple', 'SoftWare Eng', 'assets/app.png', 95],
  ];
  List recentJobs = [
    ['Nike', 'Web Designer', 'assets/nik.png', 20],
    ['Apple', 'SoftWare Eng', 'assets/app.png', 95],
    ['Google', 'Product Dev', 'assets/gog.png', 80],
  ];

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      extendBodyBehindAppBar: true,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconDef(
                fdeco: fdeco,
                iconData: Icons.sort_sharp,
              ),
              DefaultText(
                text: 'Discover a New Path',
              ),
              const SizedBox(
                height: 25,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: fdeco,
                      child: TextFormField(
                          cursorColor: Colors.black,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Search for a job...',
                              prefixIcon: Icon(Icons.manage_search_sharp,
                                  size: 30, color: Colors.grey))),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.tune_sharp,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              DefaultText(
                text: 'For You',
              ),
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                height: height * 0.18,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: companyJobs.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.only(right: 20),
                    width: width * 0.50,
                    padding: const EdgeInsets.all(12),
                    decoration: fdeco,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              companyJobs[index][2],
                              height: 50,
                            ),
                            Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.grey[500],
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Text('Part Time',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ))),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          child: Text(
                            companyJobs[index][1],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        Text('\$' + companyJobs[index][3].toString() + '/hr'),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              DefaultText(text: 'Recently Added'),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: List.generate(
                  recentJobs.length,
                  (index) => Container(
                    margin: const EdgeInsets.only(
                      bottom: 15,
                    ),
                    padding: const EdgeInsets.all(10),
                    width: width,
                    decoration: fdeco,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10)),
                              child: Image.asset(
                                recentJobs[index][2],
                                height: 50,
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(recentJobs[index][1],
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    )),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(recentJobs[index][0],
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                    )),
                              ],
                            ),
                          ],
                        ),
                        Text('\$' + recentJobs[index][3].toString() + '/hr'),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DefaultText extends StatelessWidget {
  DefaultText({
    Key? key,
    required this.text,
  }) : super(key: key);
  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 25,
      ),
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }
}

class IconDef extends StatelessWidget {
  IconDef({
    Key? key,
    required this.iconData,
    required this.fdeco,
  }) : super(key: key);

  final BoxDecoration fdeco;
  IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: fdeco,
      child: Icon(
        iconData,
        size: 35,
        color: Colors.black,
      ),
    );
  }
}
