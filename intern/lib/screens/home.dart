import 'package:flutter/material.dart';
import '../constants.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

Constants constants = Constants();

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double scrheight = MediaQuery.of(context).size.height;
    double scrwidth = MediaQuery.of(context).size.width;

    var currentIndex = 0;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(
          Icons.menu,
          color: constants.secondaryColor,
        ),
        actions: [
          Icon(
            Icons.person,
            color: constants.secondaryColor,
          ),
        ],
      ),
      body: AnimatedContainer(
        margin: EdgeInsets.all(scrwidth * 0.02),
        height: scrheight * 0.18,
        width: scrwidth,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 12,
              offset: Offset(0, 5),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        duration: Duration(milliseconds: 1500),
        curve: Curves.fastLinearToSlowEaseIn,
        child: Padding(
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image(
                  height: scrheight * 0.15,
                  width: scrwidth * 0.17,
                  image: AssetImage("assets/images/woman.png"),
                ),
              ),
              SizedBox(
                width: scrwidth * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Container(
                  width: scrwidth * 0.6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Sa3doun Mohamed Arezki ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: constants.primaryColor,
                            fontSize: scrheight * 0.025),
                      ),
                      SizedBox(
                        height: scrheight * 0.005,
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10, bottom: 5),
                          child: SingleChildScrollView(
                            child: Text(
                              "Sa3doun Mohamed Arezki Sa3dounSa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed ArezkiSa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed ArezkiSa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed ArezkiSa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed ArezkiSa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki  Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed ArezkiSa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed ArezkiSa3doun Mohamed Arezki Sa3doun Mohamed Arezki Sa3doun Mohamed Arezki  ",
                              style: TextStyle(
                                  color: constants.textColor,
                                  fontSize: scrheight * 0.018),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: scrheight * 0.01),
                child: Container(
                  decoration: BoxDecoration(
                      color: constants.primaryColor.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(50)),
                  height: scrheight * 0.1,
                  width: 0.5,
                ),
              ),
              AnimatedContainer(
                margin: EdgeInsets.only(left: scrwidth * 0.03),
                alignment: Alignment.centerRight,
                duration: Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                child: Tooltip(
                  message: 'Jours post chirurgie',
                  child: Text(
                    "J5",
                    style: TextStyle(
                      color: constants.primaryColor,
                      fontSize: scrheight * 0.04,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('click sur add patient');
        },
        child: Icon(Icons.group_add_rounded),
        tooltip: "Ajoutez un patient",
      ),
    );
  }
}

List<IconData> listOfIcons = [
  Icons.favorite_rounded,
  Icons.settings_rounded,
  Icons.person_rounded,
  //Icons.plumbing,
];
