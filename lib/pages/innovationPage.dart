import 'dart:html';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:virtual_shark_tank/common/colors.dart';
import 'package:virtual_shark_tank/common/fonts.dart';
import 'package:virtual_shark_tank/common/images.dart';
import 'package:virtual_shark_tank/models/innovationModel.dart';

class InnovationPage extends StatefulWidget {
  const InnovationPage({Key? key}) : super(key: key);

  @override
  State<InnovationPage> createState() => _InnovationPageState();
}

class _InnovationPageState extends State<InnovationPage> {
  late InnovationModel innovationModel;
  @override
  void didChangeDependencies() {
    Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    print(arguments);
    innovationModel = arguments['innovation'];
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Image.asset(AppImages.textLogo),
        centerTitle: true,
        backgroundColor: AppColors.green,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                constraints.maxWidth * 0.1, 10, constraints.maxWidth * 0.1, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  innovationModel.name,
                  style: AppFonts.acme
                      .copyWith(color: AppColors.blue, fontSize: 26),
                ),
                SizedBox(
                  width: 10,
                ),
                VideoViewer(constraints, innovationModel),
                SizedBox(
                  height: 50,
                ),
                InfoBox("#Problem Posed", innovationModel.problemPosed ?? "",
                    constraints),
                InfoBox("#Previous Solutions",
                    innovationModel.previousSolutions ?? "", constraints),
                InfoBox("#Solution Proposed",
                    innovationModel.proposedSolution ?? "", constraints),
                InfoBox("#Working of the product",
                    innovationModel.working ?? "", constraints),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget InfoBox(String title, String description, BoxConstraints constraints) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFonts.acme.copyWith(
              color: AppColors.black,
              fontSize: 24,
            ),
          ),
          Container(
            constraints: BoxConstraints(
              minHeight: 130,
            ),
            width: constraints.maxWidth,
            decoration: BoxDecoration(
              color: AppColors.grey,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                description,
                style: AppFonts.acme.copyWith(
                  fontSize: 16,
                  color: AppColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget VideoViewer(
      BoxConstraints constraints, InnovationModel innovationModel) {
    final IFrameElement _iframeElement = IFrameElement();
    // _iframeElement.height = '400';
    // _iframeElement.width = '700';
    _iframeElement.src = innovationModel.pitchVideo;
    _iframeElement.style.border = 'none';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      'iframeElement',
      (int viewId) => _iframeElement,
    );
    return Center(
      child: SizedBox(
        width: constraints.maxWidth * 0.8,
        height: 600,
        child: HtmlElementView(
          key: UniqueKey(),
          viewType: 'iframeElement',
        ),
      ),
    );
  }
}
