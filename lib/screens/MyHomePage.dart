import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/screens/AddEntryScreen.dart';

import 'components.dart';
import 'constants.dart';



class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final w =MediaQuery.of(context).size.width;
    final h =MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: w,
          height: h,
          decoration: kScreenBg,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              JourneyTitle(),
              SizedBox(height:h*0.05,),
              Image(image: AssetImage('images/book.png'),
                width: w*0.20,),
              SizedBox(height: h*0.08,),
              JourneyButton(label: "Read Entries", fn: (){}),
              SizedBox(height: h*0.02,),
              JourneyButton(label: "Add Notes",
                  fn:(){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>
                AddEntryScreen()));
              }),

            ],
          ),
        ),
      ),
    );
  }
}













