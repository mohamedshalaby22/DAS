import 'package:flutter/material.dart';
import 'package:flutter_application_3/components/text1.dart';
import 'package:flutter_application_3/constant/const.dart';

class AssignmentsPage extends StatelessWidget {
  const AssignmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: defaultPading * 4, left: defaultPading, right: defaultPading),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text1(
              text: 'All Of These Questions Must Be Solved',
              size: 17,
              color: Colors.grey.shade900,
            ),
            const SizedBox(
              height: defaultPading,
            ),
            Expanded(
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(defaultPading),
                        margin: const EdgeInsets.only(
                            top: defaultPading, bottom: defaultPading / 2),
                        decoration: decoration,
                        child: Column(
                          children: [
                            Text1(
                              text:
                                  '1. Which Of These Answer Is The Correct One ?',
                              color: Colors.grey.shade600,
                            ),
                            const SizedBox(
                              height: defaultPading / 2,
                            ),
                            const AnswerQuestion(),
                            const AnswerQuestion(),
                            const AnswerQuestion(),
                            const AnswerQuestion(),
                          ],
                        ),
                      )),
            ),
          ],
        ),
      ),
    );
  }
}

class AnswerQuestion extends StatelessWidget {
  const AnswerQuestion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(bottom: defaultPading / 2),
        padding: const EdgeInsets.all(defaultPading / 2),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey.shade600,
                  ),
                  shape: BoxShape.circle),
            ),
            const SizedBox(
              width: defaultPading / 3,
            ),
            Text1(
              text: 'Answer Text',
              color: Colors.grey.shade600,
            )
          ],
        ),
      ),
    );
  }
}
