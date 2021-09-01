import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/page/Signup/signup_screen.dart';
import 'package:pantry_saver_fe/components/already_have_an_account_acheck.dart';
import 'package:pantry_saver_fe/config/styles.dart';
import 'package:pantry_saver_fe/home_widget.dart';
import 'package:pantry_saver_fe/utils/button_widget.dart';
import 'package:pantry_saver_fe/utils/customTextField.dart';
import 'package:pantry_saver_fe/utils/validator.dart';
import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Container(
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
                ),
                CustomTextField(
                  title: 'Password',
                  key: Key('Text Field Password'),
                  obsecure: true,
                ),
                SizedBox(height: size.height * 0.03),
                ButtonWidget(
                  text: "Login",
                  onClicked: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return Home();
                        },
                      ),
                    );
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
    );
  }



}
