import 'package:flutter/material.dart';
import '../constants.dart';

class Contante_Vitale_Input extends StatelessWidget {
  Contante_Vitale_Input({
    Key? key,
    required this.text,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.controller,
  }) : super(key: key);

  final double width;
  TextEditingController controller = TextEditingController();
  final double height;
  final String imagePath;
  final Text text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.4,
      height: height * 0.08,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 4,
          // offset: Offset(5.0, .0)
        ),
      ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5, left: width * 0.02),
                child: Image(
                  width: height * 0.05,
                  image: AssetImage(imagePath),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                width: width * 0.23,
                child: Column(
                  children: [
                    TextFormField(
                      validator: (val) {
                        return val!.length < 1 ? null : 'Vide!';
                      },
                      controller: controller,
                      style: TextStyle(
                          fontSize: 25,
                          color: Color(0xff48acf0),
                          fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: ""),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: text,
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class Card_Icon extends StatelessWidget {
  const Card_Icon({
    Key? key,
    required this.width,
    required this.important,
    required this.imagePath,
    required this.title,
    required this.colorBackground,
    required this.height,
  }) : super(key: key);
  final String imagePath;
  final double width;
  final double height;
  final Color colorBackground;
  final String title;
  final bool important;

  @override
  Widget build(BuildContext context) {
    bool tapped = false;
    return GestureDetector(
      onTap: () {
        tapped = !tapped;
        print(tapped);
      },
      child: Container(
        height: height * 0.12,
        width: width * 0.3,
        decoration: BoxDecoration(
            color: important == true ? colorBackground : Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: important == true
                ? null
                : Border.all(color: colorBackground, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                spreadRadius: 0.2,
                blurRadius: 10,
              ),
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * 0.02),
              child: Center(
                child: Image(
                  image: AssetImage(imagePath),
                  width: width * 0.1,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: important == true ? Colors.white : colorBackground,
                    fontSize: height * 0.015),
              ),
            )
          ],
        ),
      ),
    );
  }
}
