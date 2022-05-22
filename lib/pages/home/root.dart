import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:virtual_shark_tank/common/colors.dart';
import 'package:virtual_shark_tank/common/images.dart';
import 'package:virtual_shark_tank/pages/home/homePage.dart';
import 'package:virtual_shark_tank/pages/home/innovationsPage.dart';
import 'package:virtual_shark_tank/pages/home/myInnovationsPage.dart';

import '../../common/fonts.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  PageController controller = PageController(initialPage: 0);
  int page = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: PreferredSize(
        child: SizedBox(
          height: 120,
          width: double.infinity,
          child: Container(
            color: AppColors.green,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 20,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Image.asset(AppImages.textLogo),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              controller.animateToPage(0,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                              page = 0;
                              setState(() {});
                            },
                            child: Text(
                              "HOME",
                              style: AppFonts.acme.copyWith(
                                color: page == 0
                                    ? AppColors.white
                                    : AppColors.darkGreen,
                                fontSize: 24,
                                shadows: page == 0
                                    ? [
                                        Shadow(
                                          offset: Offset(0.0, 3.0),
                                          blurRadius: 0.5,
                                          color:
                                              AppColors.black.withOpacity(0.3),
                                        ),
                                      ]
                                    : [],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.animateToPage(1,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                              page = 1;
                              setState(() {});
                            },
                            child: Text(
                              "INNOVATIONS",
                              style: AppFonts.acme.copyWith(
                                color: page == 1
                                    ? AppColors.white
                                    : AppColors.darkGreen,
                                fontSize: 24,
                                shadows: page == 1
                                    ? [
                                        Shadow(
                                          offset: Offset(0.0, 3.0),
                                          blurRadius: 0.5,
                                          color:
                                              AppColors.black.withOpacity(0.3),
                                        ),
                                      ]
                                    : [],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.animateToPage(2,
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                              page = 2;
                              setState(() {});
                            },
                            child: Text(
                              "MY INNOVATIONS",
                              style: AppFonts.acme.copyWith(
                                color: page == 2
                                    ? AppColors.white
                                    : AppColors.darkGreen,
                                fontSize: 24,
                                shadows: page == 2
                                    ? [
                                        Shadow(
                                          offset: Offset(0.0, 3.0),
                                          blurRadius: 0.5,
                                          color:
                                              AppColors.black.withOpacity(0.3),
                                        ),
                                      ]
                                    : [],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              controller.jumpToPage(
                                3,
                                // duration: Duration(milliseconds: 500),
                                // curve: Curves.easeIn,
                              );
                              page = 3;
                              print("1");
                              setState(() {});
                            },
                            child: Text(
                              "ABOUT US",
                              style: AppFonts.acme.copyWith(
                                color: page == 3
                                    ? AppColors.white
                                    : AppColors.darkGreen,
                                fontSize: 24,
                                shadows: page == 3
                                    ? [
                                        Shadow(
                                          offset: Offset(0.0, 3.0),
                                          blurRadius: 0.5,
                                          color:
                                              AppColors.black.withOpacity(0.3),
                                        ),
                                      ]
                                    : [],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.black,
                        ),
                      ),
                      child: FittedBox(child: Icon(Icons.person_rounded)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        preferredSize: const Size(
          150,
          1000,
        ),
      ),
      body: PageView(controller: controller, children: [
        HomePage(page: 0),
        InnovationsPage(),
        MyInnovationsPage(),
        HomePage(page: 3)
      ]),
    );
  }
}
