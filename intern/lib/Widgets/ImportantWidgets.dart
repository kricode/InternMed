import 'package:flutter/material.dart';
import 'package:intern/constants.dart';
import 'package:intern/screens/List_Patients.dart';

Constants _constants = Constants();

class ButtonConfirm extends StatefulWidget {
  ButtonConfirm({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  State<ButtonConfirm> createState() => _ButtonConfirmState();
}

class _ButtonConfirmState extends State<ButtonConfirm> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: widget.height * 0.025),
      child: Center(
        child: Container(
          width: widget.width * 0.4,
          height: widget.height * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: constants.gynecoColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                // offset: Offset(5.0, .0)
              ),
            ],
          ),
          child: Center(
              child: Text(
            "Valider",
            style:
                TextStyle(fontSize: widget.height * 0.025, color: Colors.white),
          )),
        ),
      ),
    );
  }
}

class BigTextWidget extends StatelessWidget {
  const BigTextWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.text,
    required this.fontsize,
  }) : super(key: key);

  final double width;
  final double height;
  final String text;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: EdgeInsets.only(left: width * 0.06),
        child: Text(
          text,
          style: TextStyle(
              fontSize: fontsize,
              fontWeight: FontWeight.w300,
              color: _constants.textColor),
        ),
      ),
    );
  }
}

class ServiceHeader extends StatelessWidget {
  const ServiceHeader({
    Key? key,
    required Constants constants,
    required this.width,
    required this.height,
    required this.title,
    required this.imagePath,
  })  : _constants = constants,
        super(key: key);

  final Constants _constants;
  final double width;
  final String title;
  final String imagePath;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: _constants.secondaryColor,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AnimatedContainer(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 5,
                        blurRadius: 4,
                        offset: Offset(0, 2))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(100))),
              duration: Duration(milliseconds: 1500),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Image(
                  width: width * 0.1,
                  image: AssetImage(imagePath),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: height * 0.026, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
