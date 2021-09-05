import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pantry_saver_fe/bloc/login_bloc.dart';
import 'package:pantry_saver_fe/bloc/new_user_bloc.dart';
import 'package:pantry_saver_fe/bloc/user_bloc.dart';
import 'package:pantry_saver_fe/components/already_have_an_account_acheck.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/home_widget.dart';
import 'package:pantry_saver_fe/model/new_user.dart';
import 'package:pantry_saver_fe/page/Signup/signup.dart';
import 'package:pantry_saver_fe/page/profile.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/customTextField.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  LoginState createState() => LoginState();
}

class LoginState extends State<Login> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late LoginBloc _bloc;

  @override
  void initState() {
    _bloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SvgPicture.asset(
                    "assets/icon/groceries-svg.svg",
                    height: 100,
                    width: 100,
                  ),
                  Text(
                    "Pantry Saver",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'BalsamiqSans',
                      fontSize: 40,
                      color: kPrimaryColor,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  CustomTextField(
                    title: 'Email',
                    key: Key('Text Field Akun'),
                    controller: emailController,
                  ),
                  CustomTextField(
                    title: 'Password',
                    key: Key('Text Field Password'),
                    controller: passwordController,
                    obsecure: true,
                  ),
                  SizedBox(height: size.height * 0.03),
                  ButtonWidget(
                    text: "Login",
                    onClicked: () {
                      _validateLoginInput();
                    },
                  ),
                  SizedBox(height: size.height * 0.03),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void _validateLoginInput() async {
    //final form = _formKey.currentState;
    /*if (_formKey.currentState!.validate()) {
      form!.save();
    }*/
    login(emailController.text.toString(), passwordController.text.toString());
  }

  void login(String email, String password) async {
    print('login...');
    _bloc.loginUser(email, password).then((value) {
      print(value);
      // _navigateToHome(context);
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => ProfilePage()),
      );
    }).catchError((onError) => print(onError));
  }

  void successDialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text('Login berhasil!'),
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
      title: Text('Password atau kata sandi anda salah'),
      //content: Icon(FontAwesomeIcons.exclamationCircle),
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alertDialog;
        },
        barrierDismissible: true);
  }

  void _navigateToHome(BuildContext context) {
    final route = MaterialPageRoute(builder: (_) => Home());
    Navigator.of(context).push(route);
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
