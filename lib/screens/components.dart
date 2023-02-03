import 'package:flutter/material.dart';

import 'constants.dart';


class JourneyTitle extends StatelessWidget {
  const JourneyTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text("Journey",
          style: TextStyle(
            fontSize: 60,
            fontFamily: 'pacifico',
            fontWeight: FontWeight.bold,
            foreground: Paint()..style = PaintingStyle.stroke..strokeWidth=10..color=Color(0xff00114F),
          ),),
        Text("Journey",
          style: TextStyle(
            fontSize: 60,
            fontFamily: 'pacifico',
            fontWeight: FontWeight.bold,
            foreground: Paint()..style = PaintingStyle.stroke..strokeWidth=10..color=Color(0xff00114F),
          ),)
      ],
    );
  }
}

class JourneyButton extends StatelessWidget {

  final String label;
  final fn;

  const JourneyButton({Key? key, required this.label, required this.fn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: fn,
      child: Container(
        width: w*0.50,
        height: h*0.05,
        padding: EdgeInsets.symmetric(vertical: 5,horizontal: 3),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30),
            ),
            border: Border.all(
              width: 2,
              color: Colors.white,
            )
        ),
        child: Center(
          child: Text(label,
            style: kButtonTxt,),
        ),
      ),
    );
  }
}
