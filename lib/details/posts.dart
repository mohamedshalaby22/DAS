import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/leading_icon.dart';
import 'package:flutter_application_3/constant/const.dart';

class Posts extends StatelessWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const LeadingIcon(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPading),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: const [
              DefPosts(),
              Divider(
                thickness: 1,
              ),
              
              DefPosts()
            ],
          ),
        ),
      ),
    );
  }
}

class DefPosts extends StatelessWidget {
  const DefPosts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(
          leading: CircleAvatar(
              radius: 20, backgroundImage: AssetImage('assets/p1.png')),
          title: Text(
            'Dr:Marawa Kashaba',
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
            border: Border.all(color: Colors.grey.shade300)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'غدا ان شاء الله بعد المحاضره الاولي كل التيمات تيجي عندي المكتب بالدور عشان نبدا نشوف مشاريع التخرج بالتوفيق',
                textAlign: TextAlign.right,
                style:
                    TextStyle(fontSize: 18, color: Colors.black, height: 1.5),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: defaultPading, bottom: defaultPading),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset('assets/re.png',
                      fit: BoxFit.cover, width: double.infinity, height: 200),
                ),
              ),
              Text('0 Comment', style: TextStyle(color: Colors.grey.shade500)),
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
                      radius: 20, backgroundImage: AssetImage('assets/p1.png')),
                  const SizedBox(
                    width: defaultPading / 2,
                  ),
                  Expanded(
                    child: Container(
                        padding: const EdgeInsets.only(left: defaultPading / 2),
                        height: 45,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: 'Add comment',
                              border: InputBorder.none),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
