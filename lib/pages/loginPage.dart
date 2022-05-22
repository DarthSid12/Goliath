// ignore_for_file: non_constant_identifier_names

import 'package:bordered_text/bordered_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:virtual_shark_tank/common/colors.dart';
import 'package:virtual_shark_tank/common/fonts.dart';
import 'package:virtual_shark_tank/common/images.dart';

import '../common/routes.dart';

String dropdownValue = 'Male';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool loginBox = false;
  String username = '';
  String email = '';
  String pass = '';
  DateTime dateOfBirth = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: LayoutBuilder(builder: (context, constraints) {
        return Stack(children: [
          Row(
            children: [
              SizedBox(
                width: (constraints.maxWidth * 0.44) - 1,
              ),
              Container(
                width: constraints.maxWidth * 0.56,
                height: double.infinity,
                color: AppColors.blue,
                child: Row(
                  children: [
                    Image.asset(
                      AppImages.loginCurveShapeGreen,
                      // fit: BoxFit.fitHeight,
                      height: constraints.maxHeight * 1.01,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    LayoutBuilder(builder: (context, constraints2) {
                      return Center(
                        child: AnimatedCrossFade(
                          firstChild: LoginBox(constraints),
                          secondChild: SignupBox(constraints),
                          crossFadeState: loginBox
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          duration: const Duration(milliseconds: 500),
                        ),
                      );
                    })
                  ],
                ),
              ),
            ],
          ),
          Container(
            width: constraints.maxWidth * 0.44,
            height: constraints.maxHeight,
            color: AppColors.green,
            child: Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: constraints.maxHeight * 0.13,
                    ),
                    BorderedText(
                      strokeColor: AppColors.black,
                      strokeWidth: 1,
                      child: Text(
                        "GOLIATH",
                        style: AppFonts.russoOne.copyWith(
                          fontSize: 80,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    BorderedText(
                      strokeColor: AppColors.black,
                      strokeWidth: 1,
                      child: Text(
                        "INVEST-ERESTING",
                        style: AppFonts.russoOne.copyWith(
                          fontSize: 42.5,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Image.asset(
                      AppImages.logo,
                    ),
                  ]),
            ),
          ),
        ]);
      }),
    );
  }

  Widget SignupBox(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "SIGNUP",
          style: AppFonts.bebasNeue.copyWith(
            color: AppColors.white,
            fontSize: 72,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(
          height: 25,
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
            onChanged: (String v) {
              username = v;
            },
            decoration: InputDecoration(
              label: Text(
                "USERNAME",
                style: AppFonts.bebasNeue.copyWith(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
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
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent),
          child: TextFormField(
            autofillHints: const [AutofillHints.email],
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 24,
            ),
            onChanged: (String v) {
              email = v;
            },
            cursorColor: AppColors.white,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: Text(
                "EMAIL",
                style: AppFonts.bebasNeue.copyWith(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
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
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent),
          child: TextFormField(
            autofillHints: const [AutofillHints.password],
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 24,
            ),
            onChanged: (String v) {
              pass = v;
            },
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              label: Text(
                "PASSWORD",
                style: AppFonts.bebasNeue.copyWith(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
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
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DOBpicker(
                constraints: constraints,
                onChange: (DateTime t) {
                  dateOfBirth = t;
                },
              ),
              GenderPicker(constraints: constraints),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            Map user = {
              'name': username,
              'email': email,
              'pass': pass,
              'dob': dateOfBirth,
              'gender': dropdownValue,
            };
            print(user);
            Navigator.pushNamed(context, AppRoutes.onboarding);
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
              text: 'Already have an account?',
              style: AppFonts.bebasNeue.copyWith(
                color: AppColors.white,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' Log in',
                    style: TextStyle(
                      color: AppColors.lightGreen,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          loginBox = true;
                        });
                      }),
                const TextSpan(
                  text: ' here',
                )
              ]),
        ),
      ],
    );
  }

  Widget LoginBox(BoxConstraints constraints) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "LOGIN",
          style: AppFonts.bebasNeue.copyWith(
            color: AppColors.white,
            fontSize: 72,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent),
          child: TextFormField(
            autofillHints: const [AutofillHints.email],
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 24,
            ),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              label: Text(
                "EMAIL",
                style: AppFonts.bebasNeue.copyWith(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
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
        Container(
          width: constraints.maxWidth * 0.25,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.transparent),
          child: TextFormField(
            autofillHints: const [AutofillHints.password],
            style: AppFonts.acme.copyWith(
              color: AppColors.white,
              fontSize: 24,
            ),
            cursorColor: AppColors.white,
            decoration: InputDecoration(
              label: Text(
                "PASSWORD",
                style: AppFonts.bebasNeue.copyWith(
                  color: AppColors.white,
                  fontSize: 30,
                ),
              ),
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
        Container(
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
        const SizedBox(
          height: 15,
        ),
        RichText(
          text: TextSpan(
              text: 'Don\'t have an account?',
              style: AppFonts.bebasNeue.copyWith(
                color: AppColors.white,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                    text: ' Sign up',
                    style: TextStyle(
                      color: AppColors.lightGreen,
                      decoration: TextDecoration.underline,
                      fontSize: 18,
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        setState(() {
                          loginBox = false;
                        });
                      }),
                const TextSpan(
                  text: ' here',
                )
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
  // String dropdownValue = "Male";
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.constraints.maxWidth * 0.1,
      height: 82,
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
          height: 53,
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
  final Function(DateTime) onChange;
  const DOBpicker({
    required this.constraints,
    required this.onChange,
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
