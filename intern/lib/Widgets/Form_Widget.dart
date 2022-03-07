import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:intern/Components.dart';
import 'package:intern/screens/List_Patients.dart';

import '../constants.dart';

Constants _constants = Constants();

class FormFieldNumber extends StatelessWidget {
  const FormFieldNumber({
    Key? key,
    required this.width,
    required this.height,
    required this.hint,
    required this.controller,
    required this.limitField,
  }) : super(key: key);

  final double width;
  final double height;
  final int limitField;
  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
              // offset: Offset(5.0, .0)
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black38)),
      margin: EdgeInsets.only(
        //  left: width * 0.06,
        right: width * 0.06,
        top: height * 0.01,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width * 0.28,
              child: TextFormField(
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(limitField)
                ],
                keyboardType: TextInputType.number,
                validator: (val) {
                  return val!.length > 0 ? null : "Remplissez le champs";
                },
                controller: controller,
                style: TextStyle(
                  fontSize: 15,
                  color: Color(0xff48acf0),
                ),
                decoration: InputDecoration(
                    isDense: true,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    hintText: hint),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AlertDialog_Chir extends StatefulWidget {
  AlertDialog_Chir({
    Key? key,
    required this.list,
    required this.hint,
    required this.constants,
  }) : super(
          key: key,
        );
  final String hint;

  final Map<String, DateTime> list;
  final Constants constants;

  @override
  State<AlertDialog_Chir> createState() => _AlertDialog_ChirState();
}

class _AlertDialog_ChirState extends State<AlertDialog_Chir> {
  Future<void> _selectDateChirurgie(BuildContext context) async {
    DateTime date = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date)
      setState(() {
        _date = picked;
      });
  }

  DateTime _date = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  TextEditingController chirurgie = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return AlertDialog(
      content: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            right: -40.0,
            top: -40.0,
            child: InkResponse(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: CircleAvatar(
                child: Icon(Icons.close),
                backgroundColor: Colors.red,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextFormField(
                    textCapitalization: TextCapitalization.words,
                    validator: (val) {
                      return val!.length > 4 ? null : "Ajoutez une Chirurgie";
                    },
                    controller: chirurgie,
                    style: TextStyle(
                        // fontSize: 15,
                        color: Color(0xff48acf0),
                        fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      hintText: widget.hint,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _selectDateChirurgie(context);
                  },
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(Icons.calendar_today),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "${_date.toLocal()}".split(' ')[0],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: height * 0.03),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    child: Text("Ajouter"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.list.putIfAbsent(chirurgie.text, () => _date);
                        print(widget.list);
                        Navigator.pop(context);
                        _formKey.currentState!.save();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Antecedantchiru extends StatefulWidget {
  Antecedantchiru({
    Key? key,
    required this.width,
    required this.height,
    required this.field,
    required this.list,
    required this.hint,
    required this.constants,
    required this.action,
  }) : super(key: key);

  final Map<String, DateTime> list;

  final double width;
  final double height;
  final TextEditingController field;
  final Constants constants;
  final String action;
  final String hint;
  @override
  State<Antecedantchiru> createState() => _AntecedantchiruState();
}

class _AntecedantchiruState extends State<Antecedantchiru> {
  Future<void> _selectDateChirurgie(BuildContext context) async {
    DateTime date = DateTime.now();
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != date)
      setState(() {
        _date = picked;
      });
  }

  DateTime _date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      Container(
        width: widget.width - (widget.width * 0.04),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black38,
                blurRadius: 5,
                // offset: Offset(5.0, .0)
              ),
            ],
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black38)),
        margin: widget.action == "add"
            ? EdgeInsets.only(
                left: widget.width * 0.06,
                right: widget.width * 0.06,
                top: widget.height * 0.01,
                bottom: widget.height * 0.015)
            : EdgeInsets.only(
                left: widget.width * 0.06, right: widget.width * 0.06),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: widget.width * 0.65,
                    child: widget.action == "add"
                        ? TextFormField(
                            textCapitalization: TextCapitalization.words,
                            validator: (val) {
                              return val!.length > 4
                                  ? null
                                  : "Ajoutez une Chirurgie";
                            },
                            controller: widget.field,
                            style: TextStyle(
                                fontSize: 15,
                                color: Color(0xff48acf0),
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 0, vertical: 0),
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: widget.hint),
                          )
                        : Text("chirurgie pour faire le bla bla du bla bla"),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: widget.height * 0.01),
                  width: widget.width * 0.3,
                  child: widget.action == "add"
                      ? GestureDetector(
                          onTap: () {
                            _selectDateChirurgie(context);
                          },
                          child: Ink(
                            child: Container(
                              decoration: BoxDecoration(
                                  color: widget.constants.textColor,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black38,
                                      blurRadius: 5,
                                      // offset: Offset(5.0, .0)
                                    ),
                                  ],
                                  borderRadius: BorderRadius.circular(5),
                                  border:
                                      Border.all(color: Colors.transparent)),
                              height: widget.height * 0.04,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Text(
                                    "${_date.toLocal()}".split(' ')[0],
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: widget.height * 0.02),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      : Text("${_date.toLocal()}".split(' ')[0]),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                widget.action == "add"
                    ? widget.list.putIfAbsent(widget.field.text, () => _date)
                    : widget.list.remove(widget.field);
                widget.field.clear();
                print(widget.list);
              },
              child: Container(
                color: widget.action == "add"
                    ? widget.constants.secondaryColor
                    : widget.constants.primaryColor,
                height: widget.action == "add"
                    ? widget.height * 0.1
                    : widget.height * 0.072,
                width: widget.width * 0.1,
                child: Center(
                  child: Text(
                    widget.action == "add" ? "+" : "-",
                    style: TextStyle(
                        color: Colors.white, fontSize: widget.height * 0.03),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

class HabitArea extends StatefulWidget {
  HabitArea({
    Key? key,
    required this.width,
    required this.height,
    required this.field,
    required this.list,
    required this.hint,
    required this.action,
    required this.color,
  }) : super(key: key);

  final double width;
  final double height;
  final TextEditingController field;
  final List<String> list;
  final Color color;
  final String action;
  final String hint;
  @override
  State<HabitArea> createState() => _HabitAreaState();
}

class _HabitAreaState extends State<HabitArea> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height * 0.055,
      width: widget.width - (widget.width * 0.04),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 5,
              // offset: Offset(5.0, .0)
            ),
          ],
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black38)),
      margin: widget.action == "add"
          ? EdgeInsets.only(
              left: widget.width * 0.06,
              right: widget.width * 0.06,
              top: widget.height * 0.01,
              bottom: widget.height * 0.015)
          : EdgeInsets.only(
              left: widget.width * 0.06, right: widget.width * 0.06),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: widget.width * 0.65,
              child: widget.action == "add"
                  ? TextFormField(
                      textCapitalization: TextCapitalization.words,
                      controller: widget.field,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xff48acf0),
                      ),
                      decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          hintText: widget.hint),
                    )
                  : Text(widget.hint),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.action == "add" && widget.field.text.length > 2
                    ? widget.list.add(widget.field.text)
                    : widget.list.remove(widget.hint);
                widget.field.clear();
                print(widget.list);
              });
            },
            child: Container(
              color: widget.action == "add"
                  ? widget.color
                  : _constants.primaryColor,
              width: widget.width * 0.1,
              child: Center(
                child: Text(
                  widget.action == "add" ? "+" : "-",
                  style: TextStyle(
                      color: Colors.white, fontSize: widget.height * 0.03),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextLabel extends StatelessWidget {
  const TextLabel(
      {Key? key,
      required this.width,
      required this.label,
      required this.imagePath})
      : super(key: key);

  final double width;
  final String imagePath;
  final String label;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.only(top: 10, left: width * 0.065, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AnimatedContainer(
              margin: EdgeInsets.only(right: 15),
              duration: Duration(milliseconds: 500),
              width: 28,
              child: Image(
                image: AssetImage(imagePath),
                color: _constants.InputIconColor,
              )),
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
        ],
      ),
    );
  }
}

class InputText extends StatelessWidget {
  const InputText({
    Key? key,
    required this.hint,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final TextEditingController text;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Constants _constants = Constants();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: TextFormField(
        textCapitalization: TextCapitalization.sentences,
        validator: (val) {
          return val!.length > 1 ? null : "Entrez votre Nom et Prenom";
        },
        controller: text,
        style: TextStyle(
          fontSize: 18,
          color: Color(0xff48acf0),
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: _constants.InputIconColor,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: _constants.hintColor,
          ),
          //  contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          focusColor: Color(0xff0962ff),
        ),
      ),
    );
  }
}

class InputNumber extends StatelessWidget {
  const InputNumber({
    Key? key,
    required this.hint,
    required this.icon,
    required this.text,
  }) : super(key: key);

  final TextEditingController text;
  final String hint;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    Constants _constants = Constants();
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
      child: TextFormField(
        validator: (val) {
          return val!.length > 0 ? null : "Entrez un nuero valide";
        },
        controller: text,
        keyboardType: TextInputType.number,
        style: TextStyle(
          fontSize: 18,
          color: Color(0xff48acf0),
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: _constants.InputIconColor,
          ),
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 16,
            color: _constants.hintColor,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          focusColor: Color(0xff0962ff),
        ),
      ),
    );
  }
}

class AlertDialog_GynecoKids extends StatefulWidget {
  AlertDialog_GynecoKids({
    Key? key,
    required this.list,
    required this.hint,
    required this.constants,
  }) : super(
          key: key,
        );
  final String hint;

  final List<dynamic> list;
  final Constants constants;

  @override
  State<AlertDialog_GynecoKids> createState() => _AlertDialog_GynecoKidsState();
}

class _AlertDialog_GynecoKidsState extends State<AlertDialog_GynecoKids> {
  DateTime _date = DateTime.now();
  final _formKey = GlobalKey<FormState>();
  TextEditingController annee = TextEditingController();
  TextEditingController poids = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    List<String> sexeList = ['Garçon', 'Fille'];
    String? selectedSexe = '';
    String? selectedVoie = '';
    String? selectedAction = "Grossesse";
    String? selectedAbortion;
    String? selectedCurete;

    int _value = -1;

    return StatefulBuilder(
      builder: (BuildContext context, setState) {
        return AlertDialog(
          content: Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              Positioned(
                right: -40.0,
                top: -40.0,
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    child: Icon(Icons.close),
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AnimatedContainer(
                      // Here, we will use radiobuttons to select either male or female
                      duration: Duration(milliseconds: 500),
                      margin: EdgeInsets.only(top: height * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => constants.gynecoColor),
                                value: 'Grossesse',
                                groupValue: selectedAction,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedAction = value;
                                    print(selectedAction);
                                  });
                                },
                              ),
                              Image(
                                image: AssetImage('assets/icons/baby.png'),
                                width: width * 0.075,
                              ),
                              Text('')
                            ],
                          ),
                          Row(
                            children: [
                              Radio(
                                fillColor: MaterialStateColor.resolveWith(
                                    (states) => constants.gynecoColor),
                                value: 'Avortement',
                                groupValue: selectedAction,
                                onChanged: (String? value) {
                                  setState(() {
                                    selectedAction = value;
                                    print(selectedAction);
                                  });
                                },
                              ),
                              Image(
                                image: AssetImage('assets/icons/abortion.png'),
                                width: width * 0.075,
                              ),
                              Text('')
                            ],
                          )
                        ],
                      ),
                    ),
                    selectedAction == 'Grossesse'
                        ? Container(
                            height: height * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                FormFieldNumber(
                                    width: width,
                                    height: height,
                                    hint: "Année",
                                    controller: annee,
                                    limitField: 4),
                                FormFieldNumber(
                                    width: width,
                                    height: height,
                                    hint: "Poids",
                                    controller: poids,
                                    limitField: 3),
                                TwoFieldsRadioBox(
                                    height: height,
                                    width: width,
                                    text1: 'Garcon',
                                    text2: 'Fille',
                                    imagePath1: 'assets/icons/male.png',
                                    imagePath2: 'assets/icons/femenine.png',
                                    field: selectedSexe),
                                TwoFieldsRadioBox(
                                    height: height,
                                    width: width,
                                    text1: 'Voie Haute',
                                    text2: 'Voie Basse',
                                    imagePath1: null,
                                    imagePath2: null,
                                    field: selectedVoie),
                              ],
                            ),
                          )
                        : Container(
                            height: height * 0.3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(height: height * 0.03),
                                FormFieldNumber(
                                    width: width,
                                    height: height,
                                    hint: "Année",
                                    controller: annee,
                                    limitField: 4),
                                SizedBox(height: height * 0.03),
                                TwoFieldsRadioBox(
                                    height: height,
                                    width: width,
                                    text1: 'Tardif',
                                    text2: 'Precoce',
                                    imagePath1: null,
                                    imagePath2: null,
                                    field: selectedAbortion),
                                TwoFieldsRadioBox(
                                    height: height,
                                    width: width,
                                    text1: 'Cureté',
                                    text2: 'Non Cureté',
                                    imagePath1: null,
                                    imagePath2: null,
                                    field: selectedCurete)
                              ],
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Container(
                            width: width * 0.2,
                            height: height * 0.05,
                            decoration: BoxDecoration(
                                color: constants.gynecoColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                              "Ajouter",
                              style: TextStyle(color: Colors.white),
                            ))),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            print(widget.list);
                            widget.list.add(EnfantGyneco(
                                    selectedAction!,
                                    annee.text,
                                    selectedSexe,
                                    poids.text,
                                    selectedVoie,
                                    selectedAbortion,
                                    selectedCurete)
                                .toMap());
                            Navigator.pop(context);
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class TwoFieldsRadioBox extends StatefulWidget {
  TwoFieldsRadioBox(
      {Key? key,
      required this.height,
      required this.width,
      required this.text1,
      required this.text2,
      required this.imagePath1,
      required this.imagePath2,
      required this.field})
      : super(key: key);
  final double height;
  final double width;
  final String text1;

  final String text2;
  final String? imagePath1;
  final String? imagePath2;

  String? field;

  @override
  State<TwoFieldsRadioBox> createState() => _TwoFieldsRadioBoxState();
}

class _TwoFieldsRadioBoxState extends State<TwoFieldsRadioBox> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      // Here, we will use radiobuttons to select either male or female
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.only(top: widget.height * 0.01),
      child: Row(
        children: [
          Container(
            child: Row(
              children: [
                Radio(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => constants.gynecoColor),
                  value: widget.text1,
                  groupValue: widget.field,
                  onChanged: (String? value) {
                    setState(() {
                      widget.field = value;
                      print(widget.field);
                    });
                  },
                ),
                widget.imagePath1 != null
                    ? Image(
                        image: AssetImage(widget.imagePath1!),
                        width: widget.width * 0.075,
                      )
                    : SizedBox(),
                Text(
                  widget.text1,
                  style: TextStyle(fontSize: widget.height * 0.015),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Radio(
                  fillColor: MaterialStateColor.resolveWith(
                      (states) => constants.gynecoColor),
                  value: widget.text2,
                  groupValue: widget.field,
                  onChanged: (String? value) {
                    setState(() {
                      widget.field = value;
                      print(widget.field);
                    });
                  },
                ),
                widget.imagePath2 != null
                    ? Image(
                        image: AssetImage(widget.imagePath2!),
                        width: widget.width * 0.075,
                      )
                    : SizedBox(),
                Text(
                  widget.text2,
                  style: TextStyle(fontSize: widget.height * 0.015),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
