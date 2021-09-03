import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.title,
        this.hint,
        this.obsecure = false,
        this.readOnly = false,
        required this.key,
        this.validator,
        this.controller,
        this.onSaved,
        this.onTap});
  final String title;
  @override
  final Key key;
  final FormFieldSetter<String>? onSaved;
  final String? hint;
  final bool obsecure;
  final bool readOnly;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Function? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontSize: 18, fontFamily: 'BalsamiqSans',),
          ),
          SizedBox(
            height: 50,
            width: 334,
            child: TextFormField(
              readOnly: readOnly,
              onSaved: onSaved,
              validator: validator,
              controller: controller,
              autofocus: true,
              obscureText: obsecure,
              //onTap: onTap,
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'BalsamiqSans',
                color: readOnly? Colors.grey : Colors.black,
              ),
              decoration: InputDecoration(
                hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                hintText: hint,
                contentPadding: EdgeInsets.all(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
