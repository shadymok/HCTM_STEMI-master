import 'package:flutter/material.dart'; //this is logic
import 'Question.dart';
import 'Questionlist.dart';
import 'homepage.dart';
import 'infopage.dart';

class QuestionnairePage extends StatefulWidget {
  final QuestionGroup questionGroup;
  final int initialIndex;

  QuestionnairePage({required this.questionGroup, this.initialIndex = 0});

  @override
  _QuestionnairePageState createState() => _QuestionnairePageState();
}

class _QuestionnairePageState extends State<QuestionnairePage> {
  int currentQuestionIndex = 0;
  List<bool?> answers = [];
  int? lastYesIndex;

  @override
  void initState() {
    super.initState();
    currentQuestionIndex = widget.initialIndex;
    answers = List.filled(widget.questionGroup.questions.length, null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.questionGroup.title),
        leading: currentQuestionIndex > 0
            ? BackButton(
                onPressed: () {
                  setState(() {
                    currentQuestionIndex--;
                  });
                },
              )
            : null,
      ),
      body: Container(
        color: widget.questionGroup.color.withOpacity(0.2),
        child: Column(
          children: [
            if (currentQuestionIndex < widget.questionGroup.questions.length)
              Expanded(
                child: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ..._buildQuestionContent(widget.questionGroup.questions[currentQuestionIndex]),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            if (currentQuestionIndex < widget.questionGroup.questions.length)
              if (widget.questionGroup.title == 'More Info')
                _buildMoreInfoButtons() // Custom buttons for "More Info" page
              else if (widget.questionGroup.title == 'I')
                _buildContinueButtonForI()
              else if (_isContinueButtonQuestion(currentQuestionIndex) || _isS5Question(currentQuestionIndex))
                _buildContinueButton()
              else if (_isSynopsisQuestion(currentQuestionIndex))
                widget.questionGroup.title == 'I' ? _buildSynopsisContinueButtonForI() : _buildSynopsisButtons()
              else
                _buildYesNoButtons(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildQuestionContent(Question question) {
    return question.contents.map((content) {
      switch (content.type) {
        case ContentType.text:
          return Text(
            content.data,
            style: TextStyle(
              fontSize: 20, // Normal font size
            ),
          );
        case ContentType.image:
          return Image.asset(content.data); // Assumes image is an asset, modify if needed
        case ContentType.i_text:
          return Text(
            '${content.data}',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 14, // Slightly smaller font size
            ),
          );
        case ContentType.b_text:
          return Text(
            content.data,
            style: TextStyle(
              fontSize: 20, // same size with normal text but bold
              fontWeight: FontWeight.bold,
            ),
          );
        default:
          return Container();
      }
    }).toList();
  }

  Widget _buildMoreInfoButtons() {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: 400,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPagePPT()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Square border radius
                  ),
                ),
                child: Text(
                  'STEMI ECG Features',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5),
              width: 400,
              height: 150,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => InfoPageLink()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // Square border radius
                  ),
                ),
                child: Text(
                  'Random',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildYesNoButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                answers[currentQuestionIndex] = true;
              });
              Future.delayed(Duration(milliseconds: 200), () {
                if (widget.questionGroup.title == 'S') {
                  _handleYesForS();
                } else {
                  _handleYesForOtherGroups();
                }
              });
            },
            child: Container(
              height: 150,
              color: answers[currentQuestionIndex] == true ? Colors.green : Colors.grey,
              child: Center(
                child: Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                answers[currentQuestionIndex] = false;
              });
              Future.delayed(Duration(milliseconds: 200), () {
                if (widget.questionGroup.title == 'S') {
                  _handleNoForS();
                } else {
                  _handleNoForOtherGroups();
                }
              });
            },
            child: Container(
              height: 150,
              color: answers[currentQuestionIndex] == false ? Colors.red : Colors.grey,
              child: Center(
                child: Text(
                  'No',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContinueButton() {
    return GestureDetector(
      onTap: () {
        if (_isS5Question(currentQuestionIndex)) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoPageS5()),
          );
        } else if (currentQuestionIndex < widget.questionGroup.questions.length - 1) {
          setState(() {
            currentQuestionIndex++;
          });
        } else {
          _navigateToFinalInfoPage();
        }
      },
      child: Container(
        height: 150,
        color: Colors.blue,
        child: Center(
          child: Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButtonForI() {
    return GestureDetector(
      onTap: () {
        if (currentQuestionIndex == widget.questionGroup.questions.length - 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoPageI1()),
          );
        } else if (currentQuestionIndex < widget.questionGroup.questions.length - 2) {
          setState(() {
            currentQuestionIndex++;
          });
        } else {
          _showSynopsisPopupForI();
        }
      },
      child: Container(
        height: 150,
        color: Colors.blue,
        child: Center(
          child: Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSynopsisButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
                (Route<dynamic> route) => false,
              );
            },
            child: Container(
              height: 150,
              color: Colors.red,
              child: Center(
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: GestureDetector(
            onTap: () {
              String nextCategory = _getNextCategory(widget.questionGroup.title);
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Proceed to Next Group'),
                    content: Text('You can now proceed to the next STEMI group. Which is $nextCategory.'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                          _navigateToNextQuestionGroup();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              height: 150,
              color: Colors.green,
              child: Center(
                child: Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSynopsisContinueButtonForI() {
    return GestureDetector(
      onTap: () {
        _showSynopsisPopupForI();
      },
      child: Container(
        height: 150,
        color: Colors.green,
        child: Center(
          child: Text(
            'Continue',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  bool _isContinueButtonQuestion(int index) {
    return _isS3_1Question(index) || _isS4_1Question(index) || _isT1_1Question(index);
  }

  bool _isS1Question(int index) {
    return index >= 0 && index <= 5; // Adjusted for S1.F
  }

  bool _isS2Question(int index) {
    return index == 6; // Adjusted for S1.F
  }

  bool _isS3_1Question(int index) {
    return index == 7; // Adjusted for S1.F
  }

  bool _isS3_2Question(int index) {
    return index == 8; // Adjusted for S1.F
  }

  bool _isS4_1Question(int index) {
    return index == 9; // Adjusted for S1.F
  }

  bool _isS4_2Question(int index) {
    return index == 10; // Adjusted for S1.F
  }

  bool _isS5Question(int index) {
    return index == 11; // S5
  }

  bool _isT1_1Question(int index) {
    return widget.questionGroup.title == 'T' && index == 0;
  }

  bool _isTQuestion(int index) {
    return widget.questionGroup.title == 'T' && index >= 1 && index <= 7;
  }

  bool _isTLastQuestion(int index) {
    return widget.questionGroup.title == 'T' && index == 6;
  }

  bool _isEQuestion(int index) {
    return widget.questionGroup.title == 'E' && index >= 0 && index <= 2;
  }

  bool _isMQuestion(int index) {
    return widget.questionGroup.title == 'M' && index >= 0 && index <= 1;
  }

  bool _isT4Question(int index) {
    return widget.questionGroup.title == 'T' && index == 5;
  }

  bool _isSynopsisQuestion(int index) {
    return index == widget.questionGroup.questions.length - 1;
  }

  bool _allS1QuestionsNo() {
    for (int i = 0; i <= 5; i++) {
      if (answers[i] != false) {
        return false;
      }
    }
    return true;
  }

  bool _anyS1QuestionsYes() {
    for (int i = 0; i <= 5; i++) {
      if (answers[i] == true) {
        return true;
      }
    }
    return false;
  }

  bool _allS1QuestionsAnswered() {
    for (int i = 0; i <= 5; i++) {
      if (answers[i] == null) {
        return false;
      }
    }
    return true;
  }

  void _jumpToS2() {
    setState(() {
      currentQuestionIndex = 6; // Adjusted for S1.F
    });
  }

  void _jumpToS3_1() {
    setState(() {
      currentQuestionIndex = 7; // Adjusted for S1.F
    });
  }

  void _jumpToS3_2() {
    setState(() {
      currentQuestionIndex = 8; // Adjusted for S1.F
    });
  }

  void _jumpToS4_1() {
    setState(() {
      currentQuestionIndex = 9; // Adjusted for S1.F
    });
  }

  void _jumpToS5() {
    setState(() {
      currentQuestionIndex = 11; // Adjusted for S1.F
    });
  }

  void _handleYesForS() {
    if (_isS1Question(currentQuestionIndex)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Skipping Questions'),
            content: Text('You will be skipping the other S questions and going to S2.'),
            actions: <Widget>[
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                  _jumpToS2();
                },
              ),
            ],
          );
        },
      );
    } else if (_isS3_2Question(currentQuestionIndex)) {
      _jumpToS4_1();
    } else if (_isS4_2Question(currentQuestionIndex)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoPageS42B()),
      );
    } else if (currentQuestionIndex < widget.questionGroup.questions.length - 1) {
      setState(() {
        lastYesIndex = currentQuestionIndex;
        currentQuestionIndex++;
      });
    } else {
      _navigateToFinalInfoPage();
    }
  }

  void _handleNoForS() {
    if (_isS1Question(currentQuestionIndex)) {
      if (_allS1QuestionsAnswered() && _allS1QuestionsNo()) {
        _jumpToS3_1();
      } else if (_allS1QuestionsAnswered()) {
        _jumpToS2();
      } else {
        setState(() {
          currentQuestionIndex++;
        });
      }
    } else if (_isS2Question(currentQuestionIndex)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoPageS2()),
      );
    } else if (_isS3_2Question(currentQuestionIndex)) {
      if (_allS1QuestionsNo()) {
        _jumpToS5();
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPageS32B()),
        );
      }
    } else if (_isS3_1Question(currentQuestionIndex)) {
      setState(() {
        currentQuestionIndex++;
      });
    } else if (_isS4_2Question(currentQuestionIndex)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoPageS42()),
      );
    } else if (currentQuestionIndex < widget.questionGroup.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      _navigateToFinalInfoPage();
    }
  }

  void _handleYesForI() {
    if (currentQuestionIndex == widget.questionGroup.questions.length - 2) { // Assuming second last question before synopsis
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoPageI1()),
      );
    } else {
      setState(() {
        lastYesIndex = currentQuestionIndex;
        currentQuestionIndex++;
      });
    }
  }

  void _handleNoForI() {
    if (currentQuestionIndex == widget.questionGroup.questions.length - 2) { // Assuming second last question before synopsis
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoPageI1()),
      );
    } else {
      setState(() {
        currentQuestionIndex++;
      });
    }
  }

  void _handleYesForOtherGroups() {
    if (widget.questionGroup.title == 'I') {
      _handleYesForI();
    } else {
      if (_isS4_2Question(currentQuestionIndex)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPageS42B()),
        );
      } else if (_isTQuestion(currentQuestionIndex)) {
        _navigateToTInfoPage(currentQuestionIndex);
      } else if (_isEQuestion(currentQuestionIndex)) {
        _navigateToEInfoPage(currentQuestionIndex);
      } else if (_isMQuestion(currentQuestionIndex)) {
        _navigateToMInfoPage(currentQuestionIndex);
      } else if (currentQuestionIndex < widget.questionGroup.questions.length - 1) {
        setState(() {
          lastYesIndex = currentQuestionIndex;
          currentQuestionIndex++;
        });
      } else {
        _navigateToFinalInfoPage();
      }
    }
  }

  void _handleNoForOtherGroups() {
    if (widget.questionGroup.title == 'I') {
      _handleNoForI();
    } else {
      if (_isT4Question(currentQuestionIndex)) {
        _showSynopsis();
      } else if (_isTLastQuestion(currentQuestionIndex)) {
        _showSynopsis();
      } else if (_isS2Question(currentQuestionIndex)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPageS2()),
        );
      } else if (_isS3_1Question(currentQuestionIndex) || _isS3_2Question(currentQuestionIndex)) {
        if (answers[currentQuestionIndex] == true) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoPageS32B()),
          );
        } else {
          setState(() {
            currentQuestionIndex++;
          });
        }
      } else if (_isS4_2Question(currentQuestionIndex)) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPageS42()),
        );
      } else if (currentQuestionIndex < widget.questionGroup.questions.length - 1) {
        setState(() {
          currentQuestionIndex++;
        });
      } else {
        _navigateToFinalInfoPage();
      }
    }
  }

  void _navigateToTInfoPage(int index) {
    Widget infoPage;
    switch (index) {
      case 1:
        infoPage = InfoPageT12();
        break;
      case 2:
        infoPage = InfoPageT13();
        break;
      case 3:
        infoPage = InfoPageT2();
        break;
      case 4:
        infoPage = InfoPageT3();
        break;
      case 5:
        infoPage = InfoPageT4();
        break;
      default:
        throw UnimplementedError('No InfoPage for this T question');
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => infoPage),
    );
  }

  void _navigateToEInfoPage(int index) {
    Widget infoPage;
    switch (index) {
      case 0:
        infoPage = InfoPageE1();
        break;
      case 1:
        infoPage = InfoPageE2();
        break;
      case 2:
        infoPage = InfoPageE3();
        break;
      default:
        throw UnimplementedError('No InfoPage for this E question');
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => infoPage),
    );
  }

  void _navigateToMInfoPage(int index) {
    Widget infoPage;
    switch (index) {
      case 0:
        infoPage = InfoPageM1();
        break;
      case 1:
        infoPage = InfoPageM2();
        break;
      default:
        throw UnimplementedError('No InfoPage for this M question');
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => infoPage),
    );
  }

  void _navigateToFinalInfoPage() {
    if (_isSynopsisQuestion(currentQuestionIndex)) {
      _showSynopsisPopup();
    } else {
      switch (widget.questionGroup.title) {
        case 'T':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoPageT4()),
          );
          break;
        case 'E':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoPageE3()),
          );
          break;
        case 'M':
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => InfoPageM2()),
          );
          break;
        default:
          break;
      }
    }
  }

  void _showSynopsisPopup() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Consultation Recommendation'),
          content: Text(widget.questionGroup.title == 'I'
              ? "If you haven't found a diagnosis yet, seek expert consultation."
              : "You can now proceed to the next STEMI group E."),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                if (widget.questionGroup.title == 'I') {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                    (Route<dynamic> route) => false,
                  );
                } else {
                  _navigateToNextQuestionGroup();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showSynopsisPopupForI() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Consultation Recommendation'),
          content: Text("If you haven't found a diagnosis yet, seek expert consultation."),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                  (Route<dynamic> route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _navigateToNextQuestionGroup() {
    switch (widget.questionGroup.title) {
      case 'S':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuestionnairePage(questionGroup: questionGroups[1], initialIndex: 0)), // T
        );
        break;
      case 'T':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuestionnairePage(questionGroup: questionGroups[2], initialIndex: 0)), // E
        );
        break;
      case 'E':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuestionnairePage(questionGroup: questionGroups[3], initialIndex: 0)), // M
        );
        break;
      case 'M':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => QuestionnairePage(questionGroup: questionGroups[4], initialIndex: 0)), // I
        );
        break;
      case 'I':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoPage()),
        );
        break;
      default:
        break;
    }
  }

  void _showSynopsis() {
    setState(() {
      currentQuestionIndex = widget.questionGroup.questions.length - 1;
    });
  }
}

String _getNextCategory(String currentTitle) {
  switch (currentTitle) {
    case 'S':
      return 'T';
    case 'T':
      return 'E';
    case 'E':
      return 'M';
    case 'M':
      return 'I';
    case 'I':
      return 'Consultation';
    default:
      return 'Unknown';
  }
}
