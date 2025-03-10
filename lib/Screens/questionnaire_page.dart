// import 'package:flutter/material.dart';

// class QuestionnairePage extends StatefulWidget {
//   const QuestionnairePage({super.key});

//   @override
//   _QuestionnairePageState createState() => _QuestionnairePageState();
// }

// class _QuestionnairePageState extends State<QuestionnairePage> {
//   int _currentQuestionIndex = 0;
//   final List<Map<String, dynamic>> _questions = [
//     {
//       'question': 'How often do you feel overwhelmed?',
//       'answers': ['Rarely', 'Sometimes', 'Often', 'Always'],
//     },
//     {
//       'question': 'Do you find it difficult to concentrate?',
//       'answers': ['No', 'Sometimes', 'Yes'],
//     },
//     {
//       'question': 'How would you rate your sleep quality?',
//       'answers': ['Excellent', 'Good', 'Fair', 'Poor'],
//     },
//     // Add more questions as needed
//   ];

//   final List<String?> _userAnswers = [];

//   @override
//   void initState() {
//     super.initState();
//     _userAnswers.addAll(List.filled(_questions.length, null));
//   }

//   void _answerQuestion(String answer) {
//     setState(() {
//       _userAnswers[_currentQuestionIndex] = answer;
//       if (_currentQuestionIndex < _questions.length - 1) {
//         _currentQuestionIndex++;
//       } else {
//         _showResults();
//       }
//     });
//   }

//   void _previousQuestion() {
//     setState(() {
//       if (_currentQuestionIndex > 0) {
//         _currentQuestionIndex--;
//       }
//     });
//   }

//   void _showResults() {
//     // Implement your result calculation logic here
//     // For example, you can calculate a score based on the answers
//     // and display a result message.
//     String results = 'Test Completed!\n\nYour Answers:\n';
//     for (int i = 0; i < _questions.length; i++) {
//       results += '${_questions[i]['question']}: ${_userAnswers[i] ?? 'Not answered'}\n';
//     }

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('Test Results'),
//           content: SingleChildScrollView(child: Text(results)),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//                 Navigator.of(context).pop(); // Return to the previous screen (InfoScreen)
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Questionnaire')),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Text(
//               _questions[_currentQuestionIndex]['question'],
//               style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 20),
//             ...(_questions[_currentQuestionIndex]['answers'] as List<String>)
//                 .map((answer) => Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 8.0),
//                       child: ElevatedButton(
//                         onPressed: () => _answerQuestion(answer),
//                         child: Text(answer),
//                       ),
//                     ))
//                 ,
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 if (_currentQuestionIndex > 0)
//                   ElevatedButton(
//                     onPressed: _previousQuestion,
//                     child: const Text('Previous'),
//                   ),
//                 if (_currentQuestionIndex == _questions.length - 1)
//                   const SizedBox()
//                 else
//                   const Spacer(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:async';

class QuestionnairePage extends StatefulWidget {
  const QuestionnairePage({super.key});

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage>
    with SingleTickerProviderStateMixin {
  int _currentQuestionIndex = 0;
  final List<Map<String, dynamic>> _questions = [
    {
      'question': 'How often do you feel overwhelmed?',
      'answers': ['Rarely', 'Sometimes', 'Often', 'Always'],
      'category': 'Logical',
    },
    {
      'question': '2 + 2 = ?',
      'answers': ['3', '4', '5', '6'],
      'category': 'Numerical',
    },
    {
      'question': 'What is an antonym for "happy"?',
      'answers': ['Joyful', 'Sad', 'Content', 'Excited'],
      'category': 'Verbal',
    },
    {
      'question': 'Which way does the arrow point?',
      'answers': ['Up', 'Down', 'Left', 'Right'],
      'category': 'Spatial',
    },
    {
      'question': 'If A is B and B is C, then A is?',
      'answers': ['B', 'C', 'D', 'A'],
      'category': 'Logical',
    },
    {
      'question': '10 * 5 = ?',
      'answers': ['40', '50', '60', '70'],
      'category': 'Numerical',
    },
    {
      'question': 'Complete the sentence: "The cat sat on the..."',
      'answers': ['Dog', 'Mat', 'House', 'Tree'],
      'category': 'Verbal',
    },
    {
      'question': 'Which shape is different?',
      'answers': ['Square', 'Circle', 'Triangle', 'Square'],
      'category': 'Spatial',
    },
    {
      'question': 'If A is B and B is C, then A is?',
      'answers': ['B', 'C', 'D', 'A'],
      'category': 'Logical',
    },
    {
      'question': '10 * 5 = ?',
      'answers': ['40', '50', '60', '70'],
      'category': 'Numerical',
    },
    {
      'question': 'Complete the sentence: "The cat sat on the..."',
      'answers': ['Dog', 'Mat', 'House', 'Tree'],
      'category': 'Verbal',
    },
    {
      'question': 'Which shape is different?',
      'answers': ['Square', 'Circle', 'Triangle', 'Cube'],
      'category': 'Spatial',
    },
  ];

  final List<String?> _userAnswers = [];
  late TabController _tabController;
  int _questionTimeLeft = 10;
  int _examTimeLeft = 140;
  late Timer _questionTimer;
  late Timer _examTimer;
  String? _selectedAnswer;
  List<Map<String, dynamic>> _filteredQuestions = [];
  List<int> _originalQuestionIndices = [];

  @override
  void initState() {
    super.initState();
    _userAnswers.addAll(List.filled(_questions.length, null));
    _tabController = TabController(length: 4, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _filterQuestions(_tabController.index);
    _startQuestionTimer();
    _startExamTimer();
  }

  @override
  void dispose() {
    _questionTimer.cancel();
    _examTimer.cancel();
    _tabController.dispose();
    super.dispose();
  }

  void _startQuestionTimer() {
    _questionTimeLeft = 10;
    _questionTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_questionTimeLeft > 0) {
        setState(() {
          _questionTimeLeft--;
        });
      } else {
        timer.cancel();
        _answerQuestion('Timed Out');
      }
    });
  }

  void _startExamTimer() {
    _examTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_examTimeLeft > 0) {
        setState(() {
          _examTimeLeft--;
        });
      } else {
        timer.cancel();
        _showResults();
      }
    });
  }

  void _answerQuestion(String answer) {
  setState(() {
    if (_originalQuestionIndices.isNotEmpty) {
      final originalIndex = _originalQuestionIndices[_currentQuestionIndex];
      _userAnswers[originalIndex] = answer;
    }
    _selectedAnswer = answer;
    _questionTimer.cancel();
    if (_currentQuestionIndex < _filteredQuestions.length - 1) {
      _currentQuestionIndex++;
      _startQuestionTimer();
      if (_originalQuestionIndices.isNotEmpty &&
          _currentQuestionIndex < _originalQuestionIndices.length) {
        _selectedAnswer = _userAnswers[_originalQuestionIndices[_currentQuestionIndex]];
      } else {
        _selectedAnswer = null;
      }
    } else {
      _moveToNextSection();
    }
  });
}

  void _previousQuestion() {
  if (_questionTimeLeft > 0) { // Check if time is remaining
    setState(() {
      if (_currentQuestionIndex > 0) {
        _currentQuestionIndex--;
        if (_originalQuestionIndices.isNotEmpty) {
          final originalIndex = _originalQuestionIndices[_currentQuestionIndex];
          _selectedAnswer = _userAnswers[originalIndex];
        }
        _questionTimer.cancel();
        _startQuestionTimer();
      }
    });
  }
}

  void _showResults() {
    String results = 'Test Completed!\n\nYour Answers:\n';
    for (int i = 0; i < _questions.length; i++) {
      results +=
          '${_questions[i]['question']}: ${_userAnswers[i] ?? 'Not answered'}\n';
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
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      _filterQuestions(_tabController.index);
      setState(() {
        _currentQuestionIndex = 0;
        if(_originalQuestionIndices.isNotEmpty){
          _selectedAnswer = _userAnswers[_originalQuestionIndices[0]];
        }else{
          _selectedAnswer = null;
        }
        _questionTimer.cancel();
        _startQuestionTimer();
      });
    }
  }

  void _filterQuestions(int tabIndex) {
    final categories = ['Logical', 'Numerical', 'Verbal', 'Spatial'];
    _filteredQuestions = _questions
        .where((question) => question['category'] == categories[tabIndex])
        .toList();

    _originalQuestionIndices.clear();
    for (var filteredQuestion in _filteredQuestions) {
      for (int i = 0; i < _questions.length; i++) {
        if (_questions[i]['question'] == filteredQuestion['question'] &&
            _questions[i]['category'] == filteredQuestion['category']) {
          _originalQuestionIndices.add(i);
          break;
        }
      }
    }
    if(_originalQuestionIndices.isNotEmpty){
      _selectedAnswer = _userAnswers[_originalQuestionIndices[0]];
    }else{
        _selectedAnswer = null;
    }

  }

  void _moveToNextSection() {
    if (_tabController.index < 3) {
      _tabController.animateTo(_tabController.index + 1);
      _examTimeLeft -= (10 - _questionTimeLeft); //Only subtract time when moving to next section.
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Submit Test?'),
            content: const Text('Are you sure you want to submit the test?'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _showResults();
                },
              ),
            ],
          );
        },
      );
    }
  }

  String _formatExamTime(int seconds) {
    int hours = seconds ~/ 3600;
    int minutes = (seconds % 3600) ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  Color _getIndicatorColor(double progress) {
    if (progress > 0.75) {
      return Colors.green;
    } else if (progress > 0.5) {
      return Colors.yellow;
    } else if (progress > 0.25) {
      return Colors.orange;
    } else {
      return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Questionnaire'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Test Information'),
                    content: const Text(
                        'This test measures your logical, numerical, verbal, and spatial reasoning skills.'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Center(
                child: Text('Remaining Time: ${_formatExamTime(_examTimeLeft)}')),
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Logical'),
            Tab(text: 'Numerical'),
            Tab(text: 'Verbal'),
            Tab(text: 'Spatial'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Que. No. ${_currentQuestionIndex + 1}',
                    style:
                        const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(width: 100),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: SizedBox(
                    width: 30,
                    height: 30,
                    child: CircularProgressIndicator(
                      value: _questionTimeLeft / 10,
                      color: _getIndicatorColor(_questionTimeLeft / 10),
                      backgroundColor: Colors.grey[300],
                      strokeWidth: 3,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              _filteredQuestions[_currentQuestionIndex]['question'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ...(_filteredQuestions[_currentQuestionIndex]['answers']
                    as List<String>)
                .map((answer) => RadioListTile<String>(
                      title: Text(answer),
                      value: answer,
                      groupValue: _selectedAnswer,
                      onChanged: (value) {
                        setState(() {
                          _selectedAnswer = value;
                        });
                      },
                    ))
                .toList(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                ElevatedButton(
                  onPressed: _currentQuestionIndex > 0 && _questionTimeLeft > 0
                  ? _previousQuestion
                  : null, // Disable if index is 0 or time is over
                  child: const Text('Previous'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_currentQuestionIndex <
                        _filteredQuestions.length - 1) {
                      if (_selectedAnswer != null) {
                        _answerQuestion(_selectedAnswer!);
                      } else {
                        _answerQuestion("Timed Out");
                      }
                    } else {
                      _moveToNextSection();
                    }
                  },
                  child: const Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
