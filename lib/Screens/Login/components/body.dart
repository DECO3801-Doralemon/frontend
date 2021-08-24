import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/Screens/Login/components/background.dart';
import 'package:pantry_saver_fe/Screens/Welcome/welcome_screen.dart';
//import 'package:pantry_saver_fe/Screens/Signup/signup_screen.dart';
import 'package:pantry_saver_fe/components/already_have_an_account_acheck.dart';
import 'package:pantry_saver_fe/components/rounded_button.dart';
import 'package:pantry_saver_fe/components/rounded_input_field.dart';
import 'package:pantry_saver_fe/components/rounded_password_field.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            /*AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return WelcomeScreen();
                    },
                  ),
                );
              },
            ),*/
          ],
        ),
      ),
    );
  }
}
