import 'package:flutter/material.dart';
import 'package:inked_box/inked_box.dart';



void main() {
  runApp(MaterialApp(
    home: buildButton("", "text", _onTap),
  ));
}

void _onTap() {
  print("_onTap");
}

Widget buildButton(String assetImage, String text, GestureTapCallback _onTap) {
  InkedBox inkBox = InkedBox(
    onTap: _onTap,
    child: Ink.image(
      width: 100,height: 100,
      image: NetworkImage('https://static.farakav.com/files/pictures/thumb/01529399.jpg'),
      fit: BoxFit.cover,
    ),
  );

  return Center(
    child: ConstrainedBox(
      constraints: BoxConstraints(minWidth: 200, minHeight: 100),
      child: Material(
        child: InkedChildWidget(
          inkBox: inkBox,
          radius: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              inkBox,
              Padding(
                padding: EdgeInsets.all(6),
                child: Text(
                  'tap on me',
                  style: TextStyle(fontSize: 14, color: Color(0xFF313E44)),
                ),
              ),
            ],
          ),
          // customBorder: CircleBorder(),
          onTap: _onTap,
        ),
        color: Colors.amberAccent,
      ),
    ),
  );
}

