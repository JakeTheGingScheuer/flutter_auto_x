import 'package:auto_x/responsive.dart';
import 'package:auto_x/ui/widgets/home_page_button.dart';
import 'package:flutter/cupertino.dart';

class ErrorPage extends StatelessWidget{

  final String errorMessage;

  ErrorPage({this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: Responsive.mediumSpace),
          HomePageButton(),
          SizedBox(height: Responsive.XLSpace),
          SizedBox(height: Responsive.XLSpace),
          Text(errorMessage)
        ],
      )
    );
  }
}