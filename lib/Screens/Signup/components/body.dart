import 'package:flutter/material.dart';
import 'package:pantry_saver_fe/Screens/Login/login_screen.dart';
import 'package:pantry_saver_fe/Screens/Signup/components/background.dart';
import 'package:pantry_saver_fe/components/already_have_an_account_acheck.dart';
import 'package:pantry_saver_fe/components/rounded_button.dart';
import 'package:pantry_saver_fe/components/rounded_input_field.dart';
import 'package:pantry_saver_fe/components/rounded_password_field.dart';
import 'package:pantry_saver_fe/constants.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Create Your Account",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 34,
                color: kPrimaryColor,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
                hintText: "Username",
                onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "First Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Last Name",
              onChanged: (value) {},
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Password",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              hintText: "Confirm Password",
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "Create Account",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
          ],
        ),
      ),
    );
  }
}
