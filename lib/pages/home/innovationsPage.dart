import 'package:flutter/material.dart';
import 'package:virtual_shark_tank/common/images.dart';
import 'package:virtual_shark_tank/common/routes.dart';
import 'package:virtual_shark_tank/models/innovationModel.dart';

import '../../common/colors.dart';
import '../../common/fonts.dart';

class InnovationsPage extends StatefulWidget {
  const InnovationsPage({Key? key}) : super(key: key);

  @override
  State<InnovationsPage> createState() => _InnovationsPageState();
}

class _InnovationsPageState extends State<InnovationsPage> {
  List<InnovationModel> goldInnovations = [
    InnovationModel(
        image:
            "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/884/701/datas/medium.png",
        name: "Innovation 1",
        likes: 12),
    InnovationModel(
        image:
            "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/884/701/datas/medium.png",
        name: "Innovation 2",
        likes: 9),
    InnovationModel(
        image:
            "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/884/701/datas/medium.png",
        name: "Innovation 3",
        likes: 5),
  ];
  List<InnovationModel> allInnovations = [
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/196/952/datas/medium.jpg",
      name: "HeHeChat",
      likes: 12,
      pitchVideo: 'https://www.youtube.com/watch?v=Kk-O9QMIrOk',
      previousSolutions: "No Older Solutions ",
      problemPosed:
          "Stuck under home-arrest with all negative news surrounding us, we decided to do something that'd make people laugh. There have been various apps to communicate over text with however none are as hilarious as the HeHeChat.",
      proposedSolution:
          '''Our app, "HeHeChat", has a very fun and witty part that is devided into 3 segments.
WORD CHANGER: If you send a normal text message, it gets replaced by a very funny different word. 
VOICE ENHANCER: This function plays with your voice messages. It randomly changes the pitch of your voice. 
IMAGE FILTERS: In this fragment your normal picture gets a randomly generated filter''',
      working:
          "Our app uses firebase and flutter. Flutter to build the app and firebase as backend.",
      businessPlan: "",
    ),
    InnovationModel(
      image:
          "https://challengepost-s3-challengepost.netdna-ssl.com/photos/production/software_thumbnail_photos/001/631/346/datas/medium.jpg",
      name: "Terminus Aqua",
      likes: 9,
      pitchVideo: 'https://www.youtube.com/watch?v=a9seH5gmAKI',
      previousSolutions:
          "There have been many steps taken by different countries and even individuals but they have lacked solid ground and have done little to solve the problem",
      problemPosed:
          """Security does not only consist of safeguarding the present, But also to protect the future!"... and in the future, it is said, that major wars would break out on the issue of ... water! This extremely vital elixir of nature is what needs security the most today.""",
      proposedSolution:
          "Our solution is based on the philosophy of prevention. Our aim is to prevent the water from even filling up to the brim. What this means, is that as soon as the water level passes a certain maximum limit set by the user, our machine will turn the tap off, thereby preventing any water loss.",
      working:
          '''1. When the machine is first turned on, it calculates the distance between itself and the ground 
2. After configuring the surface-sensor distance, the user can now place the bottle. Again the sensor calculates the height from the bottle brim to the sensor. 
3. The loop will stop running when the current height of water surface, calculated from the sensor, becomes less than or equal to the height of the brim of the bottle. ''',
      businessPlan: "",
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
      body: LayoutBuilder(builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "GOLD INNOVATIONS",
                  style: AppFonts.acme.copyWith(
                    fontSize: 30,
                    color: AppColors.blue,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: goldInnovations
                          .map<Widget>((InnovationModel e) => Padding(
                                padding: const EdgeInsets.only(bottom: 6.0),
                                child: Container(
                                  height: 40,
                                  width: constraints.maxWidth * 0.3 +
                                      (2 - goldInnovations.indexOf(e)) *
                                          constraints.maxWidth *
                                          0.17,
                                  decoration: BoxDecoration(
                                    color: AppColors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 5),
                                    child: Row(
                                      children: [
                                        Text(
                                          '${(goldInnovations.indexOf(e) + 1).toString()}. ${e.name} ',
                                          style: AppFonts.acme.copyWith(
                                              color: AppColors.black,
                                              fontSize: 24),
                                        ),
                                        const Spacer(),
                                        Text(
                                          e.likes.toString() + " ",
                                          style: AppFonts.acme.copyWith(
                                              color: AppColors.blue,
                                              fontSize: 24),
                                        ),
                                        Icon(
                                          Icons.favorite,
                                          color: AppColors.red,
                                          size: 30,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      width: 50,
                    ),
                    Container(
                      height: 140,
                      width: constraints.maxWidth * 0.23,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Image.asset(
                          AppImages.crown,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "ALL INNOVATIONS",
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
