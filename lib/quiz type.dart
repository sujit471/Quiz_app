import 'package:flutter/material.dart';
import 'question.dart';

class QuizSelectionScreen extends StatelessWidget {
  final List<String> quizzes = ['Math', 'Science', 'History'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(228, 187, 254, 1),
        title: Center(
          child: Text("Select a Category ",style: TextStyle(
            color: Colors.black,
          ),),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromRGBO(228, 187, 254, 1),
        ),
        child: ListView.builder(
          itemCount: quizzes.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
              child: Align(
                alignment: Alignment.center, // Align button to the left
                child: SizedBox(
                  width: 150.0, // Set the desired width here
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromRGBO(181, 139, 213, 1), // Text color
                      padding: EdgeInsets.symmetric(vertical: 15.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuizQuestionsScreen(quizTitle: quizzes[index]),
                        ),
                      );
                    },
                    child: Text(
                      quizzes[index],
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
