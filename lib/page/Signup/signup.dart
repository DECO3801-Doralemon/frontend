import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/bloc/new_user_bloc.dart';
import 'package:pantry_saver_fe/bloc/user_bloc.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/model/user.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/customTextField.dart';
import 'package:pantry_saver_fe/utils/validator.dart';

import '../../home_widget.dart';

class SignUpScreen extends StatefulWidget {
  @override
  SignUpScreenState createState() => SignUpScreenState();
}

class SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late NewUserBloc _newUserBloc;
  late NewUser _newUser;
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  
  @override
  void initState() {
    _newUserBloc = NewUserBloc();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        centerTitle: true,
        backgroundColor: greenPrimary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(doubleSpace),
              child: Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 28,
                    fontFamily: 'BalsamiqSans',
                    fontWeight: FontWeight.w400),
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomTextField(
                    title: 'Username',
                    key: Key('Text Field Username'),
                    controller: usernameController,
                    validator: (value) {
                      FieldValidator.validateName(value.toString());
                    },
                  ),
                  CustomTextField(
                    title: 'First Name',
                    key: Key('Text Field Firstname'),
                    controller: firstnameController,
                    validator: (value) {
                      FieldValidator.validateName(value.toString());
                    },                  ),
                  CustomTextField(
                    title: 'Last Name',
                    key: Key('Text Field Lastname'),
                    controller: lastnameController,
                    validator: (value) {
                      FieldValidator.validateName(value.toString());
                    },
                  ),
                  CustomTextField(
                    title: 'Email',
                    key: Key('Text Field Email'),
                    controller: emailController,
                    validator: (value) {
                      FieldValidator.validateEmail(value.toString());
                    },
                  ),
                  CustomTextField(
                    title: 'Password',
                    key: Key('Text Field Password'),
                    obsecure: true,
                    controller: passwordController,
                    validator: (value) {
                      FieldValidator.validatePassword(value.toString());
                    },
                  ),
                  CustomTextField(
                    title: 'Confirm Password',
                    key: Key('Text Field Confirm Password'),
                    obsecure: true,
                    validator: (input) {
                      if (input != passwordController.text) {
                        return '*Password is not matching. Try again';
                      }
                      return null;
                    },
                  ),
                  ButtonWidget(
                    text: "Create Account",
                    onClicked: () {
                      /*_createUser(usernameController.text.toString(),
                        firstnameController.text.toString(),
                        lastnameController.text.toString(),
                        passwordController.text.toString(),
                        emailController.text.toString()
                      );*/
                      _validateLoginInput();
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validateLoginInput() async {
    final form = _formKey.currentState;
    if (_formKey.currentState!.validate()) {
      form!.save();
      _newUser = NewUser(
          username: usernameController.toString(),
          first_name: firstnameController.toString(),
          last_name: lastnameController.toString(),
          password: passwordController.toString(),
          email: emailController.text.toString());

      _createUser(_newUser);
    }
  }

  void _createUser(NewUser newUser) async {
    print('register...');
    _newUserBloc = NewUserBloc();
    final response = await _newUserBloc.registerNewUser(newUser);
    if (response.statusCode == 201) {
      successDialog(context);
      Timer(Duration(seconds: 2), () {
        _navigateToHome(context);
      });
    } else {
      failedDialog(context);
    }
    _newUserBloc.dispose();
    /*print('register...');
    _newUser = NewUser(username: username,
        first_name: fname,
        last_name: lname,
        email: email,
        password: password);
    _newUserBloc.registerNewUser(_newUser).then((value) {
      print(value);
      _navigateToHome(context);
    }).catchError((onError) => print(onError)); failedDialog(context);
    _newUserBloc.dispose();*/
  }

  void _navigateToHome(BuildContext context) {
    final route = MaterialPageRoute(builder: (_) => Home());
    Navigator.of(context).push(route);
  }

  void successDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Registrasi berhasil!'),
      //content: Icon(FontAwesomeIcons.checkCircle),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

  void failedDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Pengguna sudah terdaftar!'),
      //content: Icon(FontAwesomeIcons.exclamationCircle),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        });
  }

}
