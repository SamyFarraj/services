import 'package:flutter/material.dart';

Widget buttonsOfControlPanel(
  BuildContext context,
  pageName,
  String firstWord,
  String secondWord,
) {
  return Container(
    padding: const EdgeInsets.all(13),
    child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => pageName,
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(155, 155),
        primary: const Color.fromARGB(55, 100, 100, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 15.0,
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.065,
          ),
          Text(
            firstWord,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            secondWord,
            style: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    ),
  );
}

Widget buttonsOfManageServices(
  BuildContext context,
  onPressedFunction,
  String buttonLabel,
  Color buttonColor,
) {
  return ElevatedButton(
    onPressed: onPressedFunction,
    style: ElevatedButton.styleFrom(
      minimumSize: const Size(300, 60),
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: MediaQuery.of(context).size.width * 0.2,
      ),
      primary: buttonColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 15.0,
    ),
    child: Text(
      buttonLabel,
      style: const TextStyle(
        fontSize: 24,
        color: Colors.white,
      ),
    ),
  );
}

Widget buttonsOfAuthentication(
    BuildContext context,
    String buttonName,
    onPressed,
    ){
  return  ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal:
        MediaQuery.of(context).size.width * 0.25,
      ),
      primary: Colors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      elevation: 15.0,
    ),
    child:  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        const Icon(
          Icons.lock_open_rounded,
          color: Colors.white,
        ),
        Text(
          buttonName,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ],
    ),
  );
}