/*

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:lac_7/layout/prodacts/prodact_item.dart';
import 'package:lac_7/layout/prodacts/searchdart.dart';
import 'package:lac_7/layout/prodacts/testsearch.dart';
import 'package:lac_7/models/allmodel.dart';
import 'package:lac_7/models/get/get.dart';
import 'package:lac_7/models/get/get_prodact.dart';
import 'package:lac_7/shred/components/mycolor.dart';
import 'package:http/http.dart' as http;

import '../../main.dart';
import 'model_page1.dart';
Widget buliditem(Prodact u, BuildContext context) => GestureDetector(
  onTap: () {
    //  Navigator.push(context, MaterialPageRoute(builder: (context)=>View_prodact()));
  },
  child: Padding(
    padding: EdgeInsets.all(10.0),
    child: Container(
      height: 170.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        border: Border.all(width: 2, color: Colors.white30),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Center(
            child: Container(
                height: 150,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Image.network('${u.imgUrl}',    height: 100.0,
                    width: 100.0,),

                )),
          ),



          SizedBox(
            width: 15,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 110.0,
                child: Text(

                  "${u.name}",
                  textAlign: TextAlign.center,
                  softWrap: true,
                  maxLines: 2,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Dosis',
                      fontSize: 15.0),
                ),
              ),
              SizedBox(
                height:0,
              ),
              Padding(
                padding: EdgeInsets.only(top:75),
                child: Container(
                    width: 80.0,
                    child: Text(

                      "${u.price} s.p",
                      textAlign: TextAlign.center,
                      style:TextStyle(fontSize: 12,) ,
                      // textAlign: TextAlign.start,


                    )),
              ),
            ],
          ),
          SizedBox(
            width: 40,
          ),
          Container(
            width: 90.0,
            height: 60.0,
            /*
            decoration: BoxDecoration(
                border: Border.all(color: col.bordercolor,width: 2),

              borderRadius: BorderRadius.circular(100.0)
            ),

            */

            child: Center(
                child: GestureDetector(
                    onTap: () {

                      Navigator.push(context, MaterialPageRoute(builder: (context) => proda(u.id.toString())));
                    },
                    child: const Text(
                      "Show More",
                      style: TextStyle(fontSize: 15, color: Colors.black
                        ,fontFamily: 'Dosis',

                      ),
                    ))
              // IconButton(onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>proda(lod))); }, icon:Icon(Icons.arrow_forward),)

            ),
          ),
        ],
      ),
    ),
  ),
);

class page_prod extends StatefulWidget {
  @override
  State<page_prod> createState() => _page_prodState();
}

class _page_prodState extends State<page_prod> {
  late Future<Prodact> futureAlbum;

/*
 // late List<User> search;
  late List<User> s2;
var data=[];
List<User>result=[];
  Future<List<User>> fetchData() async {
    final response = await http
        .get(Uri.parse('http://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      result=jsonResponse.map((e) => User.fromJson(e)).toList();
     // return jsonResponse.map((data) => new User.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
    return result;
  }

  late Future<List<User>> futureData;
  late Future<List<User>> search;

  //late List<User>data;
  void initState() {
    super.initState();
    futureData = fetchData();
  //  search=futureData;
  }


 */


  final _debouncer = Debouncer();

  List<Page1> ulist = [];
  List<Page1> userLists = [];
  //API call for All Subject List

  String url = 'https://sara-my-store.000webhostapp.com/api/products';

  Future<List<Page1>> getAllulistList() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        List<Page1> list = parseAgents(response.body);
        return list;
      } else {
        throw Exception('Error');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }


  static List<Page1> parseAgents(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Page1>((json) => Prodact.fromJson(json)).toList();
  }

  @override
  void initState() {
    super.initState();
    getAllulistList().then((subjectFromServer) {
      setState(() {
        ulist = subjectFromServer;
        userLists = ulist;
      });
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: col.appbarcolor,
          actions: [

          ],
          title: Text(
            "proudacts",
            style: TextStyle(
              color: col.textcolor1,
              fontSize: 30.0,
              fontWeight: FontWeight.bold,
              fontFamily: 'DancingScript',
            ),
          )),
      body:


      Column(

        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: TextField(
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                suffixIcon: InkWell(
                  child: Icon(Icons.search),
                ),
                contentPadding: EdgeInsets.all(15.0),
                hintText: 'Search ',
              ),
              onChanged: (string) {
                _debouncer.run(() {
                  setState(() {
                    userLists = ulist
                        .where(
                          (u) => (u.name.toLowerCase().contains(string.toLowerCase(),)||u.name.toLowerCase().contains(string.toLowerCase(),)),
                    )
                        .toList();
                  });
                });
              },
            ),
          ),
          Expanded(
            child: Container(
              child:
              ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  padding: EdgeInsets.all(5),
                  itemCount: userLists.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buliditem(userLists[index], context);
                  }
              ),
            ),
          )

          /*
              child: FutureBuilder<List<User>>(
                future: futureData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<User>? data = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: data!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return buliditem(data[index], context);
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default show a loading spinner.
                  return CircularProgressIndicator();
                },
              ))

             */
        ],
      ),
    );
  }
}

class _testoState  extends SearchDelegate{
  List<Widget>? buildActions(BuildContext context) {
    return [

      IconButton(onPressed: (){
        //   query="";
      }

          , icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return   IconButton(onPressed: (){
      Navigator.pop(context);
    }

        , icon: Icon(Icons.arrow_back_ios));

  }
  late Future<Prodact> futureAlbum;

  // late List<User> search;

  List<Prodact>result=[];
  Future<List<Prodact>> fetchData() async {
    final response = await http
        .get(Uri.parse('http://192.168.43.203:8000/products'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      result=jsonResponse.map((e) => Prodact.fromJson(e)).toList();
      // return jsonResponse.map((data) => new User.fromJson(data)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
    return result;
  }

  late Future<List<Prodact>> futureData;
  late Future<List<Prodact>> search;

  //late List<User>data;
  void initState() {

    futureData = fetchData();
    //  search=futureData;
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child:   FutureBuilder<List<Prodact>>(
        future: futureData,
        builder: (context, snapshot) {
          var data=snapshot.data;
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator(),);
          }
          //    data = snapshot.data!;
          //    search = snapshot.data!
          return Expanded(

            child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data!.length,
                itemBuilder: (BuildContext context, int index) {
                  return buliditem(data[index], context);
                }),
          );


        },

      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text('search Users'),

    );
  }
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

 */
