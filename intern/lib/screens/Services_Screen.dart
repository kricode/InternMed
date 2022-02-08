import 'package:flutter/material.dart';
import 'package:intern/Widgets/ImportantWidgets.dart';
import 'package:intern/constants.dart';
import 'package:intern/screens/List_Patients.dart';

class Services_Screen extends StatefulWidget {
  Services_Screen({Key? key}) : super(key: key);

  @override
  State<Services_Screen> createState() => _Services_ScreenState();
}

Constants _constants = Constants();

class Service {
  String name;
  String imagePath;
  String blueimagePath;

  Service(this.name, this.imagePath, this.blueimagePath);
}

class _Services_ScreenState extends State<Services_Screen> {
  List<Service> serviceList = [
    Service("Cardiologie", "assets/images/Services_Home/cardiologie.png",
        "assets/images/Services_Home/cardiogie-bleu.png"),
    Service("Gynecologie", "assets/images/Services_Home/gynecologie.png",
        "assets/images/Services_Home/gynecologie-bleu.png"),
    Service(
        "Chirurgie - Thoracique",
        "assets/images/Services_Home/lung surgery.png",
        "assets/images/Services_Home/lung surgery-bleu.png"),
    Service("Ophtalmologie", "assets/images/Services_Home/ophtalmologie.png",
        "assets/images/Services_Home/ophtalmologie-bleu.png"),
    Service("Pediaterie", "assets/images/Services_Home/pediatrie.png",
        "assets/images/Services_Home/pediatrie-bleu.png"),
    Service("ORL", "assets/images/Services_Home/orl.png",
        "assets/images/Services_Home/orl-bleu.png")
  ];
  @override
  void initState() {
    print(serviceList);
    // TODO: implement initState
    super.initState();
  }

  Service tappedservice = Service("text", 'test', "test");

  @override
  Widget build(BuildContext context) {
    TextEditingController search = TextEditingController();
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.06, vertical: height * 0.05),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: width * 0.1,
                      width: width * 0.1 + 2,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: _constants.secondaryColor, width: 2),
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black54,
                            blurRadius: 5.0,
                            spreadRadius: 0.1,
                            offset: Offset(.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50.0),
                      child: Image(
                        width: width * 0.1,
                        image: AssetImage("assets/images/woman.png"),
                      ),
                    ),
                  ],
                ),
                Tooltip(
                  message: "Deconnection",
                  child: Image(
                      width: width * 0.08,
                      image: AssetImage('assets/icons/log-out.png')),
                ),
              ],
            ),
          ),
          BigTextWidget(
              width: width,
              height: height,
              fontsize: height * 0.03,
              text: 'Bienvenue Dr. Someone'),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: width * 0.06, vertical: height * 0.03),
            child: Container(
              margin: EdgeInsets.only(top: height * 0.01),
              width: width * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 0.2,
                      blurRadius: 10,
                    ),
                  ]),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: width * 0.7,
                      child: TextFormField(
                        validator: (val) {
                          return val!.length > 3
                              ? null
                              : "Saisissez un nom valide";
                        },
                        controller: search,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color(0xff48acf0),
                            fontWeight: FontWeight.bold),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Recherchez un patient',
                          hintStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[500],
                              fontWeight: FontWeight.w600),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          focusColor: Color(0xff0962ff),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print('ajouter');
                      },
                      child: Tooltip(
                        message: 'Lancer la recherche',
                        child: Container(
                          width: width * 0.13,
                          child: Center(
                              child: Icon(
                            Icons.search,
                            color: _constants.primaryColor,
                          )),
                          decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(50),
                                  bottomLeft: Radius.circular(50),
                                  topRight: Radius.circular(10),
                                  bottomRight: Radius.circular(10)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 0.2,
                                  blurRadius: 10,
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: height * 0.18,
              width: width * 0.83,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      height: height * 0.16,
                      width: width * 0.82,
                      decoration: BoxDecoration(
                          color: _constants.secondaryColor,
                          boxShadow: [
                            BoxShadow(
                                color: _constants.secondaryColor,
                                blurRadius: 10,
                                spreadRadius: 2,
                                offset: Offset(7.0, 6.0))
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: width * 0.25,
                            top: height * 0.02,
                            right: width * 0.02),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'MED Intern',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.w600),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.018),
                              child: Text(
                                'Les dossiers medicaux de vos patients entre vos mains à tout moment!',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.015,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image(
                      image: AssetImage(
                        "assets/images/Services_Home/doctor-woman-home.png",
                      ),
                      height: height * 0.18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: height * 0.05),
            child: BigTextWidget(
                width: width,
                height: height,
                fontsize: height * 0.025,
                text: "Selectionnez un service:"),
          ),
          Container(
              height: height * 0.35,
              margin: EdgeInsets.symmetric(horizontal: width * 0.07),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          tappedservice = serviceList[index];
                        });
                        Future.delayed(Duration(milliseconds: 1000), () {
                          print(serviceList[index].name);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => List_Patients(
                                      service: serviceList[index],
                                    )),
                          );
                        });
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 2000),
                        curve: Curves.fastLinearToSlowEaseIn,
                        margin: EdgeInsets.symmetric(
                            horizontal: width * 0.02, vertical: height * 0.01),
                        decoration: tappedservice != serviceList[index]
                            ? BoxDecoration(
                                boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      // offset: Offset(5.0, .0)
                                    ),
                                  ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20))
                            : BoxDecoration(
                                color: _constants.secondaryColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: _constants.secondaryColor,
                                      blurRadius: 20,
                                      spreadRadius: 0.1,
                                      offset: Offset(7.0, 6.0))
                                ],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {},
                                child: Hero(
                                  tag: serviceList[index],
                                  child: Image(
                                    image: AssetImage(
                                        tappedservice != serviceList[index]
                                            ? serviceList[index].blueimagePath
                                            : serviceList[index].imagePath),
                                    width: width * 0.1,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: height * 0.015,
                                    left: width * 0.01,
                                    right: width * 0.01),
                                child: Text(
                                  serviceList[index].name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: tappedservice != serviceList[index]
                                          ? _constants.textColor
                                          : Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: width * 0.025),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: serviceList.length,
              )),
        ],
      ),
    ));
  }
}
