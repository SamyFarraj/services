import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class login1 extends StatefulWidget{
  @override
  State<login1> createState() => _login1State();
}

class _login1State extends State<login1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Container(
        height: double.infinity,
       decoration: BoxDecoration(
         gradient: LinearGradient(begin: Alignment.topLeft ,
         end: Alignment.topRight ,
           colors: [
             Colors.black12 ,
             Colors.grey
           ]
         )
       ) ,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Container(
               padding: EdgeInsets.only(left: 70 , right: 70 , top: 200),
               child:Center(child:CircleAvatar(
                 backgroundColor: Colors.blueGrey[500],
                 radius: 50,
                 child: Icon(Icons.person , size: 70,color: Colors.white,), )),
               ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: Text('LOGIN', style: TextStyle(fontSize: 40,
                  color: Colors.blueGrey[500])
                ,),),
            SizedBox(
              height: 3,
            ),
              Container(
                padding: EdgeInsets.all(20),
                child: Form(
                  child: Column(
                    children: [
                      TextFormField(

                        //وين ال كونترولير ؟
                     //   controller: ?????? ,
                      decoration: InputDecoration(
                        hintText: ' User Name',
                        hintStyle: TextStyle(fontSize: 20),
                        prefixIcon: Icon(Icons.person , size: 25,),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)
                        )

                      ),
                ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: 'PassWord',
                            hintStyle: TextStyle(fontSize: 20),
                            prefixIcon: Icon(Icons.password_outlined , size: 25,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)
                            )

                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("if you haven't account " , style: TextStyle(fontSize: 15),),
                ),
                InkWell(
                  onTap: (){

                  },
                  child:
                  Text('Click Here',
                    style: TextStyle(color: Colors.purple , fontWeight: FontWeight.bold,
                    fontSize: 20
                    ),),),
              ],),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.only(top: 20),
               width: 170,
                height: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.black26,
                          Colors.blueGrey
                        ]
                    )
                ),
                child: Text('Sign in ' , style:
                TextStyle(  color: Colors.white  , fontSize: 25 , ), textAlign:TextAlign.center),
              ),


            ],
          ),
        ),
      ),
    );
  }
}