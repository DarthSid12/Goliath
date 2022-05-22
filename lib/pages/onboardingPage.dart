// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:bordered_text/bordered_text.dart';
import 'package:file_picker/_internal/file_picker_web.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:virtual_shark_tank/common/colors.dart';
import 'package:virtual_shark_tank/common/fonts.dart';
import 'package:virtual_shark_tank/common/images.dart';
import 'package:virtual_shark_tank/common/routes.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>
    with TickerProviderStateMixin {
  bool isInventor = false;
  late AnimationController curveShapeAnimationController;
  PlatformFile? resumeFile;

  @override
  void initState() {
    curveShapeAnimationController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(children: [
          //Investor
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: constraints.maxWidth * 0.5,
              height: constraints.maxHeight,
              color: AppColors.green,
              child: Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: constraints.maxWidth * 0.36,
                  child: LayoutBuilder(builder: (context, constraints2) {
                    return Center(
                      child: AnimatedCrossFade(
                        firstChild: Container(),
                        secondChild: InvestorBox(constraints),
                        crossFadeState: isInventor
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  }),
                ),
              ),
            ),
          ),
          //Inventor
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: constraints.maxWidth * 0.5,
              height: double.infinity,
              color: AppColors.blue,
              child: Row(
                children: [
                  //Representing Curve Shape
                  SizedBox(
                    width: constraints.maxWidth * 0.15,
                  ),

                  LayoutBuilder(builder: (context, constraints2) {
                    return Center(
                      child: AnimatedCrossFade(
                        firstCurve: Curves.linear,
                        firstChild: InventorBox(constraints),
                        secondChild: Container(),
                        crossFadeState: isInventor
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                        duration: const Duration(milliseconds: 500),
                      ),
                    );
                  })
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            firstChild: Padding(
              padding: EdgeInsets.only(left: constraints.maxWidth * 0.5 - 1),
              child: Image.asset(
                AppImages.loginCurveShapeGreen,
                height: constraints.maxHeight * 1.01,
              ),
            ),
            secondChild: SizedBox(
              width: constraints.maxWidth * 0.5 + 1,
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(
                  AppImages.loginCurveShapeBlue,
                  height: constraints.maxHeight * 1.01,
                ),
              ),
            ),
            duration: Duration(milliseconds: 500),
            crossFadeState: isInventor
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
          )
        ]);
      }),
    );
  }

  Widget InvestorBox(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "INVESTOR",
          style: AppFonts.bebasNeue.copyWith(
            color: AppColors.white,
            fontSize: 72,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: constraints.maxWidth * 0.25,
          child: Text(
            "Upload your resume here",
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.darkGreen, width: 2),
            color: Colors.transparent,
          ),
          child: InkWell(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                resumeFile = result.files.first;
                setState(() {});
              }
            },
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: resumeFile != null
                      ? Text(
                          resumeFile!.name,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.acme.copyWith(
                            color: AppColors.white,
                            fontSize: 24,
                          ),
                        )
                      : Text(""),
                )),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: constraints.maxWidth * 0.25,
          child: Text(
            "What kinds of project are you looking to invest in?",
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent),
          child: TextFormField(
            autofillHints: const [AutofillHints.nickname],
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 24,
            ),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              //Border Decoration
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: AppColors.lightGreen, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: AppColors.darkGreen, width: 2),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: constraints.maxWidth * 0.25,
          child: Text(
            "How much are you looking to invest right now?",
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent),
          child: TextFormField(
            autofillHints: const [AutofillHints.nickname],
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 24,
            ),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              //Border Decoration
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: AppColors.lightGreen, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: AppColors.darkGreen, width: 2),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.root, (route) => false);
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.blue,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "SUBMIT",
                style: AppFonts.bebasNeue.copyWith(
                  color: AppColors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
              text: 'Are you an inventor?',
              style: AppFonts.bebasNeue.copyWith(
                color: AppColors.white,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' Click here',
                    style: TextStyle(
                      color: AppColors.blue,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        curveShapeAnimationController.forward();
                        setState(() {
                          isInventor = true;
                        });
                      }),
              ]),
        ),
      ],
    );
  }

  Widget InventorBox(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "INVENTOR",
          style: AppFonts.bebasNeue.copyWith(
            color: AppColors.white,
            fontSize: 72,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: constraints.maxWidth * 0.25,
          child: Text(
            "Upload your resume here",
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.darkGreen, width: 2),
            color: Colors.transparent,
          ),
          child: InkWell(
            onTap: () async {
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                resumeFile = result.files.first;
                setState(() {});
              }
            },
            child: Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: resumeFile != null
                      ? Text(
                          resumeFile!.name,
                          overflow: TextOverflow.ellipsis,
                          style: AppFonts.acme.copyWith(
                            color: AppColors.white,
                            fontSize: 24,
                          ),
                        )
                      : Text(""),
                )),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: constraints.maxWidth * 0.25,
          child: Text(
            "What are your skills?",
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent),
          child: TextFormField(
            autofillHints: const [AutofillHints.nickname],
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 24,
            ),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              //Border Decoration
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: AppColors.lightGreen, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: AppColors.darkGreen, width: 2),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: constraints.maxWidth * 0.25,
          child: Text(
            "What fields of development are you interested in?",
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
        ),
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent),
          child: TextFormField(
            autofillHints: const [AutofillHints.nickname],
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 24,
            ),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              //Border Decoration
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: AppColors.lightGreen, width: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: AppColors.darkGreen, width: 2),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.root, (route) => false);
          },
          child: Container(
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: AppColors.green,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Center(
              child: Text(
                "SUBMIT",
                style: AppFonts.bebasNeue.copyWith(
                  color: AppColors.white,
                  fontSize: 28,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
              text: 'Are you an investor?',
              style: AppFonts.bebasNeue.copyWith(
                color: AppColors.white,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' Click here',
                    style: TextStyle(
                      color: AppColors.lightGreen,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          isInventor = false;
                        });
                      }),
              ]),
        ),
      ],
    );
  }
}

class GenderPicker extends StatefulWidget {
  final BoxConstraints constraints;
  const GenderPicker({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  State<GenderPicker> createState() => _GenderPickerState();
}

class _GenderPickerState extends State<GenderPicker> {
  final List<String> items = ["Male", "Female", "Other", "Rather Not Say"];
  String dropdownValue = "Male";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth * 0.1,
      height: 80,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "GENDER",
          style: AppFonts.bebasNeue.copyWith(
            color: AppColors.white,
            fontSize: 20,
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Container(
          width: widget.constraints.maxWidth * 0.12,
          height: 55,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: DropdownButton(
                // Initial Value
                value: dropdownValue,
                isExpanded: true,
                // Down Arrow Icon
                style: AppFonts.acme.copyWith(
                  fontSize: 18,
                ),
                icon: const Icon(Icons.keyboard_arrow_down),
                dropdownColor: AppColors.white,
                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(
                      items,
                      style: AppFonts.acme.copyWith(
                        color: AppColors.black,
                        fontSize: 18,
                      ),
                    ),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
              ),
            ),
          ),
        )
      ]),
    );
  }
}

class DOBpicker extends StatefulWidget {
  final BoxConstraints constraints;
  const DOBpicker({
    required this.constraints,
    Key? key,
  }) : super(key: key);

  @override
  State<DOBpicker> createState() => _DOBpickerState();
}

class _DOBpickerState extends State<DOBpicker> {
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth * 0.1,
      height: 80,
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "DATE OF BIRTH",
            style: AppFonts.bebasNeue.copyWith(
              color: AppColors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          InkWell(
            onTap: () async {
              final result = await showDialog(
                  context: context,
                  builder: (context) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: ColorScheme.light(
                          primary: AppColors.green, // <-- SEE HERE
                          onPrimary: AppColors.blue, // <-- SEE HERE
                          onSurface: AppColors.black, // <-- SEE HERE
                        ),
                        textButtonTheme: TextButtonThemeData(
                          style: TextButton.styleFrom(
                            primary: AppColors.blue, // button text color
                          ),
                        ),
                      ),
                      child: DatePickerDialog(
                        initialDate: selectedDate,
                        firstDate: DateTime(1800),
                        lastDate: DateTime.now(),
                      ),
                    );
                  });
              if (result.runtimeType == DateTime) {
                selectedDate = result;
                setState(() {});
              }
            },
            child: Container(
              width: widget.constraints.maxWidth * 0.1,
              height: 55,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    selectedDate.day.toString() +
                        '/' +
                        selectedDate.month.toString() +
                        '/' +
                        selectedDate.year.toString(),
                    style: AppFonts.acme.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
