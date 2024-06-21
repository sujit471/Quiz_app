import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quiz type.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(228, 187, 254, 1),
      ),
      body: Container(
        color: Color.fromRGBO(228, 187, 254, 1),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SvgPicture.asset('image/gear.svg', height: 110,
                color: Color.fromRGBO(180, 139, 206, 1),
              ),
              const Text(
                "Quiz",
                style: TextStyle(
                    fontSize: 90,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(181, 139, 213, 1)),
              ),
              SvgPicture.asset('image/brain.svg', height: 140, color: Color.fromRGBO(180, 139, 206, 1),),
              SizedBox(height: 40,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(180, 139, 206, 1),
                  minimumSize: Size(250, 60),
                ),
                child: const Text(
                  'START',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => QuizSelectionScreen()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
