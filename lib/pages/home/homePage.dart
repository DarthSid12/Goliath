import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:virtual_shark_tank/common/fonts.dart';
import 'package:virtual_shark_tank/common/images.dart';

import '../../common/colors.dart';

class HomePage extends StatefulWidget {
  int page;
  HomePage({Key? key, required this.page}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();
  @override
  void initState() {
    print(2);
    super.initState();
    if (widget.page == 3) {
      print("3");
      Future.delayed(Duration(milliseconds: 500)).then((value) =>
          scrollController.animateTo(1000,
              duration: Duration(milliseconds: 500), curve: Curves.linear));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25),
                child: Center(
                  child: Container(
                    height: 348,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      // child: Column(children: <Widget>[
                      //   Text("TOP INVESTORS OF THE WEEK",
                      //       style: AppFonts.acme.copyWith(
                      //         fontSize: 36,
                      //         color: AppColors.blue,
                      //       ))
                      // ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.asset(
                          AppImages.topInnovations,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Image.asset(
                AppImages.homeShapeBlue,
                fit: BoxFit.fitWidth,
                width: constraints.maxWidth,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 537, 25, 10),
                child: Center(
                  child: Container(
                    height: 348,
                    // width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.grey,
                      borderRadius: BorderRadius.circular(45),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      // child: Column(children: <Widget>[
                      //   Text("TOP INVESTORS OF THE WEEK",
                      //       style: AppFonts.acme.copyWith(
                      //         fontSize: 36,
                      //         color: AppColors.blue,
                      //       ))
                      // ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(45),
                        child: Image.asset(
                          AppImages.topInvestors,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 900),
                child: Image.asset(
                  AppImages.homeShapeWhite,
                  fit: BoxFit.fitWidth,
                  width: constraints.maxWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1000, right: 25, left: 25),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Text("ABOUT US",
                          style: AppFonts.acme.copyWith(
                            color: AppColors.blue,
                            fontSize: 42,
                          )),
                    ),
                    const SizedBox(
                      height: 120,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          // height: 150,
                          width: constraints.maxWidth * 0.55,
                          color: AppColors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                                child: Text(
                              "We are a group of high-schoolers who wish to bridge the gap between innovators and investors.",
                              textAlign: TextAlign.center,
                              style: AppFonts.nunito.copyWith(
                                fontSize: 24,
                                color: AppColors.black,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          // height: 150,
                          width: constraints.maxWidth * 0.55,
                          color: AppColors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                                child: Text(
                              "We wish to open the entrepeneurship opportunities for all so that ideas with true calibre can grow to their full potential.",
                              textAlign: TextAlign.center,
                              style: AppFonts.nunito.copyWith(
                                fontSize: 24,
                                color: AppColors.black,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          // height: 150,
                          width: constraints.maxWidth * 0.55,
                          color: AppColors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                                child: Text(
                              "Our logo’s theme colors are taken so as to motivate these young entrepreneurships to become the ‘goliaths’ of tomorrow. It show the path of success which will be shown by our web app to these young innovators who lack not ideas and creativity, but only funding.",
                              textAlign: TextAlign.center,
                              style: AppFonts.nunito.copyWith(
                                fontSize: 24,
                                color: AppColors.black,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Container(
                          // height: 150,
                          width: constraints.maxWidth * 0.55,
                          color: AppColors.grey,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Center(
                                child: Text(
                              """Our team consists of:
1.Siddharth Agrawal: The PROGRAMMER
2.Agrim Arsh: The DESIGNER
3.Satvik Maheshwari: The PRESENTER
4.Kinshuk Singh: The DOCUMENTATION HANDLER""",
                              // textAlign: TextAlign.center,
                              style: AppFonts.nunito.copyWith(
                                fontSize: 24,
                                color: AppColors.black,
                              ),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 1700),
                child: Stack(
                  children: [
                    Image.asset(
                      AppImages.homeShapeGreen,
                      fit: BoxFit.fitWidth,
                      width: constraints.maxWidth,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 230),
                      child: Container(child: VideoViewer(constraints)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget VideoViewer(BoxConstraints constraints) {
    final IFrameElement _iframeElement = IFrameElement();
    // _iframeElement.height = '400';
    // _iframeElement.width = '700';
    _iframeElement.src = 'https://www.youtube.com/embed/dQw4w9WgXcQ';
    _iframeElement.style.border = 'none';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
    return Center(
      child: SizedBox(
        width: 1000,
        height: 400,
        child: HtmlElementView(
          key: UniqueKey(),
          viewType: 'iframeElement',
        ),
      ),
    );
  }
}
