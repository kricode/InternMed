import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

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
                  return val!.length > 1 ? null : "Remplissez le champs";
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

class HabitArea extends StatelessWidget {
  const HabitArea({
    Key? key,
    required this.width,
    required this.height,
    required this.field,
    required this.list,
    required this.hint,
    required this.action,
    required Constants constants,
  })  : _constants = constants,
        super(key: key);

  final double width;
  final double height;
  final TextEditingController field;
  final List<String> list;
  final Constants _constants;
  final String action;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.055,
      width: width - (width * 0.04),
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
      margin: action == "add"
          ? EdgeInsets.only(
              left: width * 0.06,
              right: width * 0.06,
              top: height * 0.01,
              bottom: height * 0.015)
          : EdgeInsets.only(left: width * 0.06, right: width * 0.06),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: width * 0.65,
              child: action == "add"
                  ? TextFormField(
                      controller: field,
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
                    )
                  : Text("ICI y'aura l'habitude"),
            ),
          ),
          GestureDetector(
            onTap: () {
              action == "add" && field.text.length > 3
                  ? list.add(field.text)
                  : list.remove('text');
              field.clear();
              print(list);
            },
            child: Container(
              color: action == "add"
                  ? _constants.secondaryColor
                  : _constants.primaryColor,
              width: width * 0.1,
              child: Center(
                child: Text(
                  action == "add" ? "+" : "-",
                  style:
                      TextStyle(color: Colors.white, fontSize: height * 0.03),
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
              fontWeight: FontWeight.w600,
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
        validator: (val) {
          return val!.length > 3 ? null : "Entrez votre Nom et Prenom";
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
          return val!.length > 1 ? null : "Entrez un nuero valide";
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
