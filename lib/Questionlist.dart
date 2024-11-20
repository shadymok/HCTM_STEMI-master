import 'package:flutter/material.dart';
import 'Question.dart';
import 'prove.dart';

class Questionlist extends StatelessWidget {
  final List<QuestionGroup> questionGroups;

  Questionlist({required this.questionGroups});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ECG Condition Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GridView.builder(
            itemCount: questionGroups.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
            ),
            itemBuilder: (BuildContext context, int index) {
              return ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: questionGroups[index].color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        QuestionnairePage(questionGroup: questionGroups[index]),
                  ),
                ),
                child: questionGroups[index].title == 'More Info'
                    ? Icon(
                        Icons.info, // Use the info icon for the extra page
                        size: 46.0,
                        color: Colors.white,
                      )
                    : Text(
                        questionGroups[index].title,
                        style: TextStyle(
                          fontSize: 24.0,
                          color: Colors.white,
                        ),
                      ),
              );
            },
          ),
        ),
      ),
    );
  }
}
