import 'package:flutter/material.dart';
import 'package:quiz_app/customshapeborder.dart';
import 'package:quiz_app/result.dart';

class QuizQuestionsScreen extends StatefulWidget {
  final String quizTitle;

  QuizQuestionsScreen({required this.quizTitle});

  @override
  _QuizQuestionsScreenState createState() => _QuizQuestionsScreenState();
}

class _QuizQuestionsScreenState extends State<QuizQuestionsScreen> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  List<Question> _questions = [];

  @override
  void initState() {
    super.initState();
    // Initialize questions based on the quiz title
    if (widget.quizTitle == 'Math') {
      _questions = [
        Question(
          question: 'Solve for x: 3x - 2 = 10',
          options: ['3', '4', '5'],
          correctAnswer: '4',
        ),
        Question(
          question: 'What is the area of a rectangle with length 5 units and width 3 units?',
          options: ['12', '15', '18'],
          correctAnswer: '15',
        ),
        Question(
          question: 'Simplify the expression: 4 * (5 + 3) / 2',
          options: ['16', '18', '20'],
          correctAnswer: '18',
        ),
        Question(
          question: 'Find the value of y if 2y + 7 = 15',
          options: ['4', '5', '6'],
          correctAnswer: '4',
        ),
        Question(
          question: 'What is the square root of 169?',
          options: ['12', '13', '14'],
          correctAnswer: '13',
        ),
        Question(
          question: 'Find the perimeter of a square with each side measuring 6 cm.',
          options: ['18 cm', '24 cm', '36 cm'],
          correctAnswer: '24 cm',
        ),
        Question(
          question: 'Solve for x: 2x^2 + 5x - 3 = 0',
          options: ['1', '1.5', '2'],
          correctAnswer: '1',
        ),
        Question(
          question: 'If a car travels at an average speed of 60 km/hour, how far will it travel in 4 hours?',
          options: ['220 km', '240 km', '260 km'],
          correctAnswer: '240 km',
        ),
        Question(
          question: 'What is the value of 2^4?',
          options: ['8', '16', '32'],
          correctAnswer: '16',
        ),
        Question(
          question: 'If a triangle has angles measuring 30° and 60°, what is the measure of the third angle?',
          options: ['60°', '90°', '120°'],
          correctAnswer: '90°',
        ),
      ];
    } else if (widget.quizTitle == 'Science') {
      _questions = [
        Question(
          question: 'What is the chemical formula for table salt?',
          options: ['NaCl', 'H2O', 'CO2'],
          correctAnswer: 'NaCl',
        ),
        Question(
          question: 'What is the powerhouse of the cell?',
          options: ['Nucleus', 'Mitochondria', 'Chloroplast'],
          correctAnswer: 'Mitochondria',
        ),
        Question(
          question: 'What is the process by which plants make their own food?',
          options: ['Respiration', 'Photosynthesis', 'Fermentation'],
          correctAnswer: 'Photosynthesis',
        ),
        Question(
          question: 'Which planet is known as the Red Planet?',
          options: ['Mars', 'Venus', 'Jupiter'],
          correctAnswer: 'Mars',
        ),
        Question(
          question: 'What is the chemical symbol for water?',
          options: ['H2O', 'CO2', 'O2'],
          correctAnswer: 'H2O',
        ),
        Question(
          question: 'What is the chemical symbol for gold?',
          options: ['Au', 'Ag', 'Fe'],
          correctAnswer: 'Au',
        ),
        Question(
          question: 'Which gas do plants absorb from the atmosphere?',
          options: ['Oxygen', 'Carbon dioxide', 'Nitrogen'],
          correctAnswer: 'Carbon dioxide',
        ),
        Question(
          question: 'What is the smallest bone in the human body?',
          options: ['Femur', 'Cranium', 'Stapes'],
          correctAnswer: 'Stapes',
        ),
        Question(
          question: 'Which animal is known as the fastest land animal?',
          options: ['Lion', 'Cheetah', 'Giraffe'],
          correctAnswer: 'Cheetah',
        ),
        Question(
          question: 'What is the freezing point of water in Celsius?',
          options: ['-100°C', '0°C', '100°C'],
          correctAnswer: '0°C',
        ),
      ];
    } else if (widget.quizTitle == 'History') {
      _questions = [
        Question(
          question: 'Who was the first President of the United States?',
          options: ['Thomas Jefferson', 'George Washington', 'Abraham Lincoln'],
          correctAnswer: 'George Washington',
        ),
        Question(
          question: 'In what year did the Titanic sink?',
          options: ['1912', '1914', '1916'],
          correctAnswer: '1912',
        ),
        Question(
          question: 'Who was the leader of the Nazi Party in Germany during World War II?',
          options: ['Adolf Hitler', 'Benito Mussolini', 'Joseph Stalin'],
          correctAnswer: 'Adolf Hitler',
        ),
        Question(
          question: 'Which civilization built the pyramids of Giza?',
          options: ['Mesopotamian', 'Egyptian', 'Greek'],
          correctAnswer: 'Egyptian',
        ),
        Question(
          question: 'Which country was ruled by the famous leader, Napoleon Bonaparte?',
          options: ['Germany', 'France', 'Russia'],
          correctAnswer: 'France',
        ),
        Question(
          question: 'Who wrote the plays Romeo and Juliet and Hamlet?',
          options: ['William Shakespeare', 'Charles Dickens', 'Jane Austen'],
          correctAnswer: 'William Shakespeare',
        ),
        Question(
          question: 'In what year did the American Civil War end?',
          options: ['1863', '1865', '1867'],
          correctAnswer: '1865',
        ),
        Question(
          question: 'Which ancient empire was ruled by Julius Caesar?',
          options: ['Roman Empire', 'Greek Empire', 'Persian Empire'],
          correctAnswer: 'Roman Empire',
        ),
        Question(
          question: 'Who was the first explorer to circumnavigate the globe?',
          options: ['Ferdinand Magellan', 'Christopher Columbus', 'Vasco da Gama'],
          correctAnswer: 'Ferdinand Magellan',
        ),
        Question(
          question: 'Who was the first female Prime Minister of the United Kingdom?',
          options: ['Margaret Thatcher', 'Theresa May', 'Angela Merkel'],
          correctAnswer: 'Margaret Thatcher',
        ),
      ];
    }
  }

  void _submitAnswer(String selectedOption) {
    if (selectedOption == _questions[_currentQuestionIndex].correctAnswer) {
      setState(() {
        _score++;
      });
    }
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultScreen(score: _score, totalQuestions: _questions.length),
          ),
        );
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(228, 187, 254, 1),
        automaticallyImplyLeading: false,
        title: Text(widget.quizTitle),
      ),
      body: Container(
        color: Color.fromRGBO(228, 187, 254, 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: ClipPath(
                clipper: CustomShapeClipper(),
                child: Container(

                  color: Color.fromRGBO(181, 139, 213, 1),
                  height: 200,
                  child: Center(
                    child: Text(
                      _questions[_currentQuestionIndex].question,
                      style: TextStyle(fontSize: 24.0,color: Colors.white),textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.0), // Vertical spacing between question and options
            ..._questions[_currentQuestionIndex].options.asMap().entries.map((entry) {
              int index = entry.key;
              String option = entry.value;
              // Calculate the letter dynamically (e.g., A, B, C...)
              String optionLetter = String.fromCharCode('A'.codeUnitAt(0) + index);
              return Padding(
                // padding: const EdgeInsets.symmetric(vertical: 8.0),
                padding: EdgeInsets.fromLTRB(45, 10, 45, 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                     minimumSize: Size(250, 60), // Set the minimum width and height
                    backgroundColor: Color.fromRGBO(181, 139, 213, 1), // Background color
                    elevation: 2, // Elevation
                    padding: EdgeInsets.symmetric(horizontal: 16.0), // Padding inside the button
                  ),
                  onPressed: () => _submitAnswer(option),
                  child: Row(
                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white, // Background color
                          borderRadius: BorderRadius.circular(40.0), // Rounded corners
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4.0,
                              offset: Offset(2.0, 2.0),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            optionLetter,
                            style: const TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 45), // Space between letter and option text
                      Text(
                        option,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );

            }).toList(),
          ],
        ),
      ),
    );
  }
}

class Question {
  String question;
  List<String> options;
  String correctAnswer;

  Question({required this.question, required this.options, required this.correctAnswer});
}
