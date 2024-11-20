import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import 'package:first_test/Myappstate.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int _currentPageIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _currentPageIndex = prefs.getInt('info_page_progress') ?? 0;
      _pageController = PageController(initialPage: _currentPageIndex);
    });
  }

  Future<void> _saveProgress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('info_page_progress', _currentPageIndex);
  }

  @override
  void dispose() {
    _saveProgress();
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int pageIndex) {
    setState(() {
      _currentPageIndex = pageIndex;
    });
    _saveProgress();
  }

  final List<Widget> _pages = [
    ListView(
      padding: EdgeInsets.all(16.0),
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              'assets/images/MMU.png',
              width: 150,
              height: 100,
            ),
            Image.asset(
              'assets/images/HCTM.jpg',
              width: 150,
              height: 100,
            ),
          ],
        ),
        SizedBox(height: 20),
        Text(
          'S.T.E.M.I. Catching Mimics With Mnemonic',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          'I am here to guide you how to catch STEMI mimics with a mnemonic',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          'Faizal Amri Hamzah\nMBBCh BAO M.Med(EM) FADUSM',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Text(
          'S.T.E.M.I. as acronym for STEMI',
          style: TextStyle(fontSize: 16),
          textAlign: TextAlign.center,
        ),
        Divider(),
        SizedBox(height: 20),
        Text(
          'How to use the mnemonic?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/Part A0.1.png'),
        Divider(),
        SizedBox(height: 20),
        Text(
          'Firstly, always look for obvious STEMI changes.',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          '• Studies have shown that the majority of STE in chest pain cohort patients is not due to AMI.',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        Text(
          '• However, since we are trying to RULE IN STEMI, hence it is prudent to look for evidence to support it.',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        Divider(),
        SizedBox(height: 20),
        Text(
          'ECG Leads and vascular territory',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/Part A1.png'),
        Divider(),
        SizedBox(height: 20),
        Text(
          'Progression of non-reperfused STEMI',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/Part A2.png'),
        Divider(),
        SizedBox(height: 20),
        Text(
          'PAILS = Reciprocal changes',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/Part A3.png'),
        Divider(),
        SizedBox(height: 20),
        Text(
          'Morphology of STE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Text(
          '‘Normal’ => concave,\nConvex => AMI,\nBut Concave can be either AMI or Normal',
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/Part A4.png'),
        Divider(),
        SizedBox(height: 20),
        Text(
          'Which STD is sign of ischemia?',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/Part A5.png'),
        SizedBox(height: 20),
        Text(
          'QRS merges with the T wave',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/Part A6.png'),
        Divider(),
        SizedBox(height: 20),
        Text(
          'Tombstone STE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/Part A7.png'),
        Divider(),
        SizedBox(height: 20),
        Text(
          'Shark Fin STE',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        Image.asset('assets/images/Part A8.png'),
      ],
    ),
  ];


  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Information Page'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: _currentPageIndex > 0
                ? () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                : null,
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: _currentPageIndex < _pages.length - 1
                ? () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                : null,
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        onPageChanged: _onPageChanged,
        children: _pages,
      ),
    );
  }
}