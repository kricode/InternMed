import 'package:flutter/material.dart';
import 'package:intern/screens/List_Patients.dart';

import '../Components.dart';

class InformationWithImageWidget extends StatelessWidget {
  const InformationWithImageWidget(
      {Key? key,
      required this.height,
      required this.width,
      required this.image,
      required this.text})
      : super(key: key);

  final double height;
  final double width;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ImageIcon(AssetImage(image),
            size: height * 0.02, color: constants.secondaryColor),
        SizedBox(
          width: width * 0.06,
        ),
        Container(
          width: width * 0.75,
          margin: EdgeInsets.only(right: width * 0.02),
          child: Text(
            text,
            style: TextStyle(
              fontSize: height * 0.018,
              color: constants.InputIconColor,
            ),
          ),
        )
      ],
    );
  }
}

class PointWithText extends StatelessWidget {
  const PointWithText({
    Key? key,
    required this.height,
    required this.width,
    required this.lightText,
    required this.boldText,
  }) : super(key: key);

  final double height;
  final double width;
  final String lightText;
  final String? boldText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ImageIcon(
          AssetImage("assets/icons/points.png"),
          size: height * 0.02,
          color: constants.secondaryColor,
        ),
        Container(
          margin: EdgeInsets.only(left: width * 0.03),
          width: width * 0.8,
          child: RichText(
              text: TextSpan(
                  text: lightText,
                  style: TextStyle(
                    fontSize: height * 0.018,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  children: <TextSpan>[
                TextSpan(
                    text: boldText,
                    style: TextStyle(
                        color: constants.InputIconColor,
                        fontWeight: FontWeight.w600,
                        fontSize: height * 0.018)),
              ])),
        )
      ],
    );
  }
}

class Antecedant_Chirurgical extends StatelessWidget {
  const Antecedant_Chirurgical({
    Key? key,
    required this.height,
    required this.width,
    required this.lightText,
    required this.boldText,
  }) : super(key: key);

  final double height;
  final double width;
  final String lightText;
  final String boldText;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ImageIcon(
          AssetImage("assets/icons/points.png"),
          size: height * 0.02,
          color: constants.secondaryColor,
        ),
        Container(
          margin: EdgeInsets.only(left: width * 0.03),
          width: width * 0.8,
          child: RichText(
              text: TextSpan(
                  text: boldText,
                  style: TextStyle(
                    fontSize: height * 0.018,
                    fontWeight: FontWeight.w600,
                    color: constants.InputIconColor,
                  ),
                  children: <TextSpan>[
                TextSpan(text: '\n'),
                TextSpan(
                    text: lightText,
                    style: TextStyle(
                        color: constants.hintColor, fontSize: height * 0.018))
              ])),
        )
      ],
    );
  }
}

class WrapChips extends StatelessWidget {
  const WrapChips({
    Key? key,
    required this.width,
    required this.list,
  }) : super(key: key);

  final double width;
  final List list;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
          padding: EdgeInsets.only(left: width * 0.08),
          child: MediaQuery.removePadding(
            context: context,
            removeLeft: true,
            child: Wrap(
                spacing: 8,
                runSpacing: -8,
                children: list
                    .map((e) => new Chip(
                          backgroundColor:
                              constants.secondaryColor.withOpacity(0.15),
                          label: Text(e),
                        ))
                    .toList()),
          )),
    );
  }
}
