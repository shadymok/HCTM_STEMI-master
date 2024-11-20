import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:css_colors/css_colors.dart';
import 'package:video_player/video_player.dart';
import 'package:hive/hive.dart';

// Route other files
import 'package:first_test/inputpage.dart';
import 'package:first_test/prove.dart';
import 'package:first_test/Questionlist.dart';
import 'Question.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = Questionlist(questionGroups: questionGroups);
        break;
      case 1:
        page = InputPage();
        break;
      case 2:
        page = AboutUsPage(); // Link to About Us page
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return Column(
              children: [
                Expanded(child: mainArea),
                SafeArea(
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.monitor_heart),
                        label: 'STEMI',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.info),
                        label: 'Information',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person), // Changed icon to person
                        label: 'About Us',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                )
              ],
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.monitor_heart),
                        label: Text('STEMI'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.info),
                        label: Text('Information'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.person), // Changed icon to person
                        label: Text('About Us'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
  }
}

// Simple About Us Page
class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "About Us",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "This is the About Us page. Here you can include information about your app.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
