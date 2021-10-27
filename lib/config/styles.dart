import 'package:flutter/material.dart';

const Color white = Color(0xffFFFFFF);
const Color greenPrimary = Color(0xff49be36);
const Color green = Color(0xff54ab54);
const Color greenPale = Color(0xff4FBA4F);
const Color darkGreen = Color(0xff347D34);
const Color redPrimary = Color(0xffff0f0f);
const Color greyPrimary = Color(0xff828282);
const Color greyDM = Color(0xffc3bcbc);
const Color purple = Color(0xff6A2C57);
const Color red = Color(0xffDF3535);
const Color greenDM = Color(0xff008A00);
const Color blue = Color(0xff495AA8);
const Color orangePrimary = Color(0xFFFF8D07);
const Color blackPrimary = Color(0xFF5A5A5A);
const kPrimaryColor = Color(0xC918AC00);
const kPrimaryLightColor = Color(0xFFFF8D07);
const Color orangeCard = Color(0xFFFFA841);
const Color blackboxShadow = Color(0x8D000000);

const Color greenLight = Color(0xffdaf8d6);
const Color greenTags = Color(0xff49be36);

const double superSmallSpace = 2.0;
const double smallSpace = 4.0;
const double regularSpace = 8.0;
const double regularBiggerSpace = 12.0;
const double doubleSpace = 16.0;
const double spaceTwentySeven = 27.0;
const double tripleSpace = 32.0;
const double spaceFourty = 45.0;
const double quartetSpace = 64.0;
const double spaceFourtyEight = 48.0;

final List<BoxShadow> regularShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.25),
    blurRadius: 7.0, // has the effect of softening the shadow
    offset: Offset(
      5.0, // horizontal, move right 10
      5.0, // vertical, movesn down 10
    ),
  )
];

final List<BoxShadow> smallShadow = [
  BoxShadow(
    color: Colors.black.withOpacity(0.25),
    blurRadius: 2.0, // has the effect of softening the shadow
    offset: Offset(
      1.5, // horizontal, move right 10
      1.5, // vertical, move down 10
    ),
  )
];

final BorderRadius regularBorderRadius = BorderRadius.circular(10);
final BorderRadius doubleBorderRadius = BorderRadius.circular(20);
