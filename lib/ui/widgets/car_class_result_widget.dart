import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CarClassResult extends StatefulWidget {
  final String carClass;

  CarClassResult({@required this.carClass});

  @override
  State<StatefulWidget> createState() => CarClassResultState(carClass: this.carClass);
}

class CarClassResultState extends State<CarClassResult> with SingleTickerProviderStateMixin {

  AnimationController animController;
  Animation<double> animation;
  Animation<Color> animColor;
  String carClass;

  CarClassResultState({@required this.carClass});

  @override
  void initState() {
    super.initState();
    animController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    final curvedAnimation = CurvedAnimation(parent: animController, curve: Curves.bounceOut,);

    animation = Tween<double>(begin: 80, end: 36)
        .animate(curvedAnimation)
      ..addListener(() { setState(() {}); })
      ..addStatusListener((status) {
        if(status == AnimationStatus.completed) {
          animController.stop();
        }
      });

    animColor = ColorTween(
        begin: Color.fromRGBO(240, 200, 200, 1.0),
        end: Color.fromRGBO(240, 10, 10, 1.0))
        .animate(animController)..addListener(() { setState(() {});
      });

    animController.forward();
  }

  @override
  void dispose(){
    animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
                child: AnimatedBuilder(
                    animation: animController,
                    builder: (context, child) {
                      return Text(this.carClass,
                          style: TextStyle(fontSize: animation.value, fontWeight: FontWeight.bold, color: animColor.value, shadows: [
                            Shadow(color: Colors.grey.withOpacity(0.5), blurRadius: 7, offset: Offset(0, 3))
                          ]));
                    }
                )
            );
  }
}