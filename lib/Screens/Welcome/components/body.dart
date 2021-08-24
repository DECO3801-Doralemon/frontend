import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/Screens/Login/login_screen.dart';
import 'package:pantry_saver_fe/Screens/Signup/signup_screen.dart';
import 'package:pantry_saver_fe/Screens/Welcome/components/background.dart';
import 'package:pantry_saver_fe/components/already_have_an_account_acheck.dart';
import 'package:pantry_saver_fe/components/rounded_button.dart';
import 'package:pantry_saver_fe/constants.dart';
import 'package:pantry_saver_fe/home_widget.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Pantry Saver",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Login",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
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
    );
  }
}
