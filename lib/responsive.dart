import 'dart:math';
import 'globals.dart' as globals;

const double logicalPixelSAiPhone8 = 500.125;
final logicalPixelSA = sqrt(globals.screenSize.height * globals.screenSize.width);

double responsiveLogicalPixels(double val){
  return (val/logicalPixelSAiPhone8)*logicalPixelSA;
}

class Responsive {

  static final smallSpace = responsiveLogicalPixels(10);
  static final mediumSpace = responsiveLogicalPixels(20);
  static final largeSpace = responsiveLogicalPixels(30);
  static final XLSpace = responsiveLogicalPixels(60);

  static final smallLogo = responsiveLogicalPixels(50);
  static final mediumLogo = responsiveLogicalPixels(100);
  static final largeLogo = responsiveLogicalPixels(200);
  static final XLLogo = responsiveLogicalPixels(300);

  static final smallFont = responsiveLogicalPixels(12);
  static final mediumFont = responsiveLogicalPixels(16);
  static final largeFont = responsiveLogicalPixels(20);
  static final XLFont = responsiveLogicalPixels(28);

  static final small = responsiveLogicalPixels(40);
  static final medium = responsiveLogicalPixels(80);
  static final large = responsiveLogicalPixels(120);
  static final XL = responsiveLogicalPixels(240);

  static final pdfHeight = responsiveLogicalPixels(600);
  static final pdfWidth = responsiveLogicalPixels(375);
}