import 'package:flutter/material.dart';
import 'package:virtual_shark_tank/common/colors.dart';
import 'package:virtual_shark_tank/common/fonts.dart';

import '../common/images.dart';
import '../common/routes.dart';

class AddInnovationPage extends StatefulWidget {
  const AddInnovationPage({Key? key}) : super(key: key);

  @override
  State<AddInnovationPage> createState() => _AddInnovationPageState();
}

class _AddInnovationPageState extends State<AddInnovationPage> {
  String name = '';
  String pitchVideo = '';
  String pitchImage = '';
  String problemPosed = '';
  String previousSolutions = '';
  String proposedSolutions = '';
  String working = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey2,
      appBar: PreferredSize(
          preferredSize: const Size(100, 100),
          child: Container(
            color: AppColors.green,
            width: double.infinity,
            height: 80,
            child: Stack(
              children: [
                Center(child: Image.asset(AppImages.textLogo)),
                Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 36,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
            vertical: 10,
          ),
          child: LayoutBuilder(builder: (context, constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    "ADD AN INNOVATION",
                    style: AppFonts.acme.copyWith(
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 36,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                QuestionBox("What is the name of the pitch?", constraints, (v) {
                  name = v;
                }, oneLiner: true),
                QuestionBox("Enter video url of pitch", constraints, (v) {
                  pitchVideo = v;
                }, oneLiner: true),
                QuestionBox("Enter image url of your pitch", constraints, (v) {
                  pitchImage = v;
                }, oneLiner: true),
                QuestionBox("What is the problem you are solving?", constraints,
                    (v) {
                  problemPosed = v;
                }),
                QuestionBox("What are the existing solutions?", constraints,
                    (v) {
                  previousSolutions = v;
                }),
                QuestionBox("What is your proposed solution?", constraints,
                    (v) {
                  proposedSolutions = v;
                }),
                QuestionBox("How does your project work?", constraints, (v) {
                  name = v;
                }),
                Center(
                  child: InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, AppRoutes.onboarding);
                    },
                    child: Container(
                      height: 70,
                      width: 140,
                      decoration: BoxDecoration(
                        color: AppColors.green,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          "SUBMIT",
                          style: AppFonts.bebasNeue.copyWith(
                            color: AppColors.white,
                            fontSize: 36,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget QuestionBox(
      String question, BoxConstraints constraints, Function(String) onChange,
      {bool oneLiner = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            question,
            style: AppFonts.acme.copyWith(
              color: AppColors.black,
              fontSize: 24,
            ),
          ),
          Container(
              height: oneLiner ? 60 : 130,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: AppColors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextFormField(
                style: AppFonts.acme.copyWith(
                  color: AppColors.black,
                  fontSize: 20,
                ),
                onChanged: onChange,
                maxLines: oneLiner ? 1 : null,
                cursorColor: AppColors.black,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(15),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              )),
        ],
      ),
    );
  }
}
