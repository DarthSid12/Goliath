import 'package:flutter/material.dart';
import 'package:virtual_shark_tank/common/images.dart';
import 'package:virtual_shark_tank/common/routes.dart';
import 'package:virtual_shark_tank/models/innovationModel.dart';

import '../../common/colors.dart';
import '../../common/fonts.dart';

class MyInnovationsPage extends StatefulWidget {
  const MyInnovationsPage({Key? key}) : super(key: key);

  @override
  State<MyInnovationsPage> createState() => _MyInnovationsPageState();
}

class _MyInnovationsPageState extends State<MyInnovationsPage> {
  List<InnovationModel> allInnovations = [
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/862/328/datas/medium.png",
      name: "Innovation 1",
      likes: 12,
      pitchVideo: 'https://www.youtube.com/embed/dQw4w9WgXcQ',
      previousSolutions: "There was no previous solution",
      problemPosed: "Inefficient ways of rickrolling",
      proposedSolution: "This project",
      working: "The link does not hint at rick roll at all",
      businessPlan: "Spam messaaging link to rickroll all 8 billion people",
    ),
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/862/328/datas/medium.png",
      name: "Innovation 2",
      likes: 9,
      pitchVideo: 'https://www.youtube.com/embed/dQw4w9WgXcQ',
    ),
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/862/328/datas/medium.png",
      name: "Innovation 3",
      likes: 5,
    ),
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/862/328/datas/medium.png",
      name: "Innovation 4",
      likes: 4,
    ),
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/884/701/datas/medium.png",
      name: "Innovation 5",
      likes: 3,
    ),
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/884/701/datas/medium.png",
      name: "Innovation 6",
      likes: 1,
    ),
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/884/701/datas/medium.png",
      name: "Innovation 7",
      likes: 1,
    ),
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/884/701/datas/medium.png",
      name: "Innovation 8",
      likes: 1,
    ),
  ];

  @override
  void initState() {
    allInnovations.shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey2,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addInnovation);
        },
        child: FittedBox(
          child: Icon(
            Icons.add,
            color: AppColors.black,
          ),
        ),
        backgroundColor: AppColors.green,
      ),
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "YOUR INNOVATIONS",
                  style: AppFonts.acme.copyWith(
                    fontSize: 30,
                    color: AppColors.blue,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    children: allInnovations.map<Widget>((InnovationModel e) {
                      return AllInnovationWidget(
                        constraints: constraints,
                        innovationModel: e,
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}

class AllInnovationWidget extends StatelessWidget {
  final BoxConstraints constraints;
  final InnovationModel innovationModel;
  const AllInnovationWidget({
    Key? key,
    required this.constraints,
    required this.innovationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, AppRoutes.innovation,
              arguments: {'innovation': innovationModel});
        },
        child: Container(
          height: 260,
          width: constraints.maxWidth * 0.2,
          decoration: BoxDecoration(
            color: AppColors.grey,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  color: AppColors.white,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                  child: Image.network(
                    innovationModel.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    '  ' + innovationModel.name,
                    style: AppFonts.acme.copyWith(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blue,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '  ' + innovationModel.likes.toString() + ' ',
                    style: AppFonts.acme.copyWith(
                      fontSize: 28,
                      color: AppColors.blue,
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: AppColors.red,
                    size: 30,
                  ),
                  SizedBox(width: 15),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
