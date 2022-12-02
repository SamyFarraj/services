import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Show extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 20 , right: 20 , top: 70 , bottom: 20),
        width: double.infinity,
        decoration:BoxDecoration(
          border: Border.all( color: Colors.teal , width: 2) ),
        child: Column(
          children: [
            Container(
          height: 280,width:270,
         margin: EdgeInsets.only(top: 150),
              decoration:BoxDecoration(
                border: Border.all(color: Colors.teal, width: 5 ,),
                borderRadius: BorderRadius.only(
                    topLeft:Radius.circular(30) ,
                    bottomRight:Radius.circular(30) ),
                image:DecorationImage(image: AssetImage('images/5.jpg') , fit: BoxFit.fill),
              ),

            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40 , bottom: 15),
                  child: Text('Name : ' ,
                    style: TextStyle(fontSize: 30 ,
                      color: Colors.teal ,
                    fontWeight: FontWeight.bold
                  ),),
                ),
                Text('Hand Bag',style: TextStyle(fontSize: 25),),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40 , bottom: 15),
                  child: Text('Price : ' ,
                    style: TextStyle(fontSize: 30 ,
                        color: Colors.teal ,
                        fontWeight: FontWeight.bold
                    ),),
                ),
                Text('100000', style: TextStyle(fontSize: 25)),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row (
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40 , bottom: 15),
                    child: Text('Description : ' ,
                      style: TextStyle(fontSize: 30 ,
                          color: Colors.teal ,
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Column(
                    children: [
                      Text('A hand bag made of natural skin ' , style: TextStyle(fontSize: 25 , )
                     , overflow: TextOverflow.ellipsis,),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
        ) ,


    );
  }

}


