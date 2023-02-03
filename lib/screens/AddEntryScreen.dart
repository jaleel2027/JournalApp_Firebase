import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:journal_app/screens/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';
import 'package:intl/intl.dart';


class AddEntryScreen extends StatefulWidget {
  const AddEntryScreen({Key? key}) : super(key: key);

  @override
  State<AddEntryScreen> createState() => _AddEntryScreenState();
}

class _AddEntryScreenState extends State<AddEntryScreen> {

  TextEditingController titleController = TextEditingController();
  TextEditingController entryController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final w =MediaQuery.of(context).size.width;
    final h =MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: kScreenBg,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10,),
                JourneyTitle(),
                SizedBox(height: 10,),
                Container(
                  width: w*0.8,
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: kTxtField,
                  child: Center(
                      child: TextFormField(
                        controller: titleController,
                        cursorColor: Colors.white,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.white
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Entry Title',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.7),)),
                      )),
                ),
                SizedBox(height: 25,),
                Expanded(
                  child: Container(
                    width: w*0.9,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2.5,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(15),)),
                    padding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                  child: SingleChildScrollView(
                    reverse: entryController.text.length>20?true:false,
                    child: Center(
                      child: TextFormField(
                        controller: entryController,
                        cursorColor: Colors.white,
                        maxLines: 15,
                        keyboardType: TextInputType.multiline,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Create new Entry',
                          hintStyle: TextStyle(
                            color: Colors.white.withOpacity(0.4),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,)),)
                      ,),),
                  ),),
                SizedBox(height: 30,),
                JourneyButton(label: "SAVE", fn: () async{
                 if(titleController.text.isEmpty||entryController.text.isEmpty){
                   print("Please Enter Title and Entry");
                 }else{
                   await FirebaseFirestore.instance.collection('Entries').add({
                     'Title': titleController.text,
                     'Entry': entryController.text,
                     'Date':  DateFormat.yMMMEd().add_jm().format(DateTime.now()),
                      }).then((value) => print('Entry Added Successfully'))
                       .catchError((error)=>print('Entry Not Added due to $error'));
                   titleController.clear();
                   entryController.clear();
                 }
                }),
                SizedBox(height: 20,),
              ],
            ),
          ),
        ));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    titleController.dispose();
    entryController.dispose();

  }

}









