import 'dart:io';

class InnovationModel {
  String image;
  String name;
  int likes;
  String? pitchVideo;
  String? problemPosed;
  String? previousSolutions;
  String? proposedSolution;
  String? working;
  String? businessPlan;
  InnovationModel({
    required this.image,
    required this.name,
    required this.likes,
    this.pitchVideo,
    this.problemPosed,
    this.previousSolutions,
    this.proposedSolution,
    this.working,
    this.businessPlan,
  });
}
