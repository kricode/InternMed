import 'package:flutter/material.dart';

class Cell extends StatelessWidget {
  const Cell({
    Key? key,
    required this.height,
    required this.width,
    required this.imagePath,
  }) : super(key: key);

  final double height;
  final double width;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Center(
        child: Container(
          height: height * 0.1,
          child: Image(
            width: width * 0.07,
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}

class CheckCell extends StatelessWidget {
  const CheckCell({
    Key? key,
    required this.height,
    required this.width,
    required this.value,
  }) : super(key: key);

  final double height;
  final double width;
  final bool value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Center(
        child: Container(
          height: height * 0.1,
          child: Image(
            width: width * 0.07,
            image: value == true
                ? const AssetImage("assets/icons/check.png")
                : const AssetImage("assets/icons/close.png"),
          ),
        ),
      ),
    );
  }
}

class TextCell extends StatelessWidget {
  const TextCell({
    Key? key,
    required this.height,
    required this.width,
    required this.text,
  }) : super(key: key);

  final double height;
  final double width;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: width * 0.01),
        child: Container(
            margin: EdgeInsets.only(bottom: height * 0.0225),
            height: height * 0.03,
            width: width * 0.09,
            child: Center(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: height * 0.016),
              ),
            )));
  }
}

class DateCell extends StatelessWidget {
  const DateCell(
      {Key? key,
      required this.height,
      required this.width,
      required this.date,
      required this.motDuJour,
      required this.time})
      : super(key: key);

  final double height;
  final String motDuJour;
  final double width;
  final String date;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      showDuration: Duration(seconds: 10),
      message: motDuJour,
      child: Container(
        height: height * 0.07,
        width: width * 0.3,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 8.0, right: 8, top: height * 0.003),
                    child: Image(
                      image: AssetImage("assets/icons/calendar.png"),
                      height: height * 0.014,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: height * 0.0145,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: width * 0.07),
                child: Text(
                  time,
                  style: TextStyle(
                      fontSize: height * 0.0145, fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
