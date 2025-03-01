import 'package:flutter/material.dart';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({super.key});

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  int _currentQuestionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How often do you feel overwhelmed?',
      'answers': ['Rarely', 'Sometimes', 'Often', 'Always'],
    },
    {
      'question': 'Do you find it difficult to concentrate?',
      'answers': ['No', 'Sometimes', 'Yes'],
    },
    {
      'question': 'How would you rate your sleep quality?',
      'answers': ['Excellent', 'Good', 'Fair', 'Poor'],
    },
    // Add more questions as needed
  ];

  final List<String?> _userAnswers = [];

  @override
  void initState() {
    super.initState();
    _userAnswers.addAll(List.filled(_questions.length, null));
  }

  void _answerQuestion(String answer) {
    setState(() {
      _userAnswers[_currentQuestionIndex] = answer;
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showResults();
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
      }
    });
  }

  void _showResults() {
    // Implement your result calculation logic here
    // For example, you can calculate a score based on the answers
    // and display a result message.
    String results = 'Test Completed!\n\nYour Answers:\n';
    for (int i = 0; i < _questions.length; i++) {
      results += '${_questions[i]['question']}: ${_userAnswers[i] ?? 'Not answered'}\n';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Test Results'),
          content: SingleChildScrollView(child: Text(results)),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop(); // Return to the previous screen (InfoScreen)
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Questionnaire')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              _questions[_currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...(_questions[_currentQuestionIndex]['answers'] as List<String>)
                .map((answer) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () => _answerQuestion(answer),
                        child: Text(answer),
                      ),
                    ))
                ,
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                if (_currentQuestionIndex > 0)
                  ElevatedButton(
                    onPressed: _previousQuestion,
                    child: const Text('Previous'),
                  ),
                if (_currentQuestionIndex == _questions.length - 1)
                  const SizedBox()
                else
                  const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
