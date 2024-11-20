import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Question.dart';
import 'homepage.dart';
import 'prove.dart';
import 'package:url_launcher/url_launcher.dart';

void showProceedPopup(BuildContext context, String nextGroup) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Proceed'),
        content: Text('You can now proceed to the next STEMI group which is $nextGroup.'),
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

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page'),
      ),
      body: Stack(
        children: [
          Center(
            child: Text('Random Word here HELLO!'),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'T');
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class InfoPagePPT extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PPTX'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'STEMI: \nECG DIAGNOSTIC CRITERIA',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  '• ST elevation in 2 contiguous leads + symptoms of ischemia\n',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.start,
                ),
                Text(
                  '• In the absence of LVH and LBBB\n',
                  style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start,
                ),
                Container(
                  padding: EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[50], // Light blue background
                    border: Border.all(color: Colors.black, width: 2.0), // Black border
                    borderRadius: BorderRadius.circular(8.0), // Optional: Rounded corners
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '• > 0.1mV ST elevation in all leads except V2-V3\n\n'
                        '• Cut off point for lead V2 and V3:\n'
                        '   • Males < 40 years - ≥ 0.25mV\n'
                        '   • Males ≥ 40 years - ≥ 0.2mV\n'
                        '   • Females - ≥ 0.15mV\n\n'
                        '• Cut off point for ST elevation in posterior leads:\n'
                        '   • > 0.05mV\n'
                        '   • > 0.1mV in men < 40 years\n\n',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  '• ST elevation in lead aVR may be predictor of left main/3 vessel disease',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.start,
                ),
                Divider(),
                SizedBox(height: 15),
                Text(
                  'Firsly, \nalways look for obvious ECG \nchanges to rule in a STEMI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 15),
                Text(
                  '\nECG Leads and \nvascualar territory',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/ECGleads.png',
                ),
                SizedBox(height: 15),
                Text(
                  '\nProgression of non-reperfused STEMI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/non-reperfused STEMI.png',
                ),
                SizedBox(height: 15),
                Text(
                  '\nPAILS mnemonic for reciprocal STD',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/PAILS.png',
                ),
                SizedBox(height: 15),
                Text(
                  '\nPAILS mnemonic for reciprocal STD',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/PAILS.png',
                ),
                SizedBox(height: 15),
                Text(
                  '\nMorphology of STE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/Morphology of STE.png',
                ),
                SizedBox(height: 10),
                Text(
                  '\nCommon Causes of STE',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Image.asset(
                  'assets/images/common cause.png',
                ),
                // Text(
                //   'Additional note or reference (if needed)',
                //   style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                //   textAlign: TextAlign.center,
                // ),
                // SizedBox(height: 10),
                // GestureDetector(
                //   onTap: () async {
                //     const url = 'https://your-link-here.com';
                //     if (await canLaunch(url)) {
                //       await launch(url);
                //     } else {
                //       throw 'Could not launch $url';
                //     }
                //   },
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Icon(Icons.link, color: Colors.blue),
                //       SizedBox(width: 8),
                //       Text(
                //         'Click here',
                //         style: TextStyle(
                //           fontSize: 16,
                //           color: Colors.blue,
                //           decoration: TextDecoration.underline,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Link Page'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'This is a Link page',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  ''
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  '',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://www.youtube.com/watch?v=oHg5SJYRHA0&ab_channel=cotter548';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageI1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page I'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Inflammation (Acute Pericarditis)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Acute pericarditis may mimic inferior, inferolateral and anterolateral STEMI. It is considered the closest mimic to a STEMI.'
                  '\n\nClassical pericarditis may present with a different nature of chest pain. Unfortunately, pericarditis commonly occurs together with myocarditis. The chest pain of myocarditis is similar to that of ischemic pain, and cardiac troponins would be elevated. Hence, attention to ECG details is needed to differentiate a pericarditis from a STEMI.'
                  '\n\nFor a start, you should consider a pericarditis if the ECG has ‘widespread’ STE, whereby both the limb and chest leads are affected. In spite of this, a ‘wraparound LAD occlusion’ may give a similar ECG changes distribution.'
                  '\n\nThere are several ECG changes that are suggestive. However not all these changes present at the same time.'
                  '\n\nECG changes for acute pericarditis is best summarized by the mnemonic: '
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '\nPERI-CAR-DI-TI-S',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 20),
                Text(
                  '1.	PERI = PR Elevation, Revert Inferior'
                  '\n2.	CAR = Concave ST, Absent Reciprocal'
                  '\n3.	DI = Degree of STE, (in) Inferior leads'
                  '\n4.	TI = T-wave inversion, Isoelectric ST'
                  '\n5.	S = ST:T ratio (in V6)'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/I1.png',
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/I2.png',
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/I3.png',
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/I4.png',
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/I5.png',
                ),
                SizedBox(height: 10),
                SizedBox(height: 20),
                Text(
                  'Another additional feature is Spodick Sign (refers to a downsloping TP line/segment), especially in leads II and lateral chest leads (occur in about 1/3 of pericarditis patient).'
                  '\n\nThe PR elevation with STD in lead aVR is also known as the Knuckle Sign.'
                  '\n\nBesides ECG, the clinical finding of pericardial friction rub on auscultation is highly specific for pericarditis.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '\nFor a quick reference on Pericarditis vs STEMI ECG features, click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/nGoSMq5L98k?si=iYhWF3olpj-b6Mfu';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionnairePage(questionGroup: questionGroups.firstWhere((group) => group.title == 'I'), initialIndex: questionGroups.firstWhere((group) => group.title == 'I').questions.length - 1)),
                  );
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageS2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page S2'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Left Ventricular Hypertrophy (LVH) Voltage-Criteria Only',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Left ventricular hypertrophy (LVH) is a structural condition of the heart where the left ventricular wall is thickened. It is commonly associated with longstanding hypertension. Because it is a structural disorder, echocardiography is the most appropriate tool in making the diagnosis.'
                  '\n\nThe ECG is not sensitive for LVH. A patient might have an LVH on echocardiography but lacks any LVH ECG changes. This is the limitation of QRS amplitudes analysis for diagnosing an LVH on an ECG. Hence QRS amplitudes criteria alone are not specific and will be labelled as ‘LVH by voltage-criteria-only’ if the QRS amplitude fulfils but lack non-voltage criteria. The voltage criteria ‘should not’ be used in adults less than 35 years old.'
                  '\n\nHowever, if both the voltage and non-voltage criteria are fulfilled, the ECG is highly specific (more than 90%) for an LVH.'
                  '\n\nThe non-voltage criteria for LVH are:'
                  '\n\t\t1.	Left ventricular strain pattern in lead V5 & V6, or I & aVL or in all four leads (V5, V6, I and aVL). These strain patterns are actually ‘secondary ST-T changes’'
                  '\n\t\t2.	Delayed intrinsicoid deflection in lead V6 (time from QRS onset to peak of R wave in lead V6 more than 50msec).'
                  '\n\nThe criteria below are usually sufficient for your daily practice.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/LVH.png',
                ),
                SizedBox(height: 10),
                Text(
                  'For further reference regarding LVH ECG features, click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/0JKOidX3Nw0?si=G8zYkElXLQX5Nmmq&t=14';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'T');
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageS32B extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page S3.2B'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Left Ventricular Hypertrophy (LVH)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Left ventricular hypertrophy (LVH) mimics both the inferior and an anteroseptal STEMI. This is because in LVH, leads V1, V2 & V3 (occasionally up to V4) demonstrate deep S wave with negative QRS nett polarity.  '
                  '\n\nST elevation or depression that are seen with primary ST-T changes is usually suggestive of ischemia. ST-T changes are called ‘primary’ if the polarity direction of its T wave is in the same direction of nett polarity of QRS. Any condition that causes abnormal ‘depolarization’ (QRS changes) will result in abnormal ‘repolarization’. In this latter condition, the ST-T changes are called ‘secondary ST-T changes’ whereby the ST segment and T waves are in opposite direction to the nett polarity of the QR complexes'
                  '\n\nIt is prudent that an interpreter analyses the ECG for both LVH and LBBB before analysing the ST segments for a STEMI. Furthermore, if the ECG demonstrates secondary ST-T changes in many leads, we then need to look hard for the presence of structural conditions (e.g. hypertrophy) or conduction disorders (e.g. BBB, ectopy, aberrancy). On the contrary, ECG changes that are consistent with primary ST-T changes, would suggest that ischemia/infarction is more likely to be present'
                  '\n\nLVH too produces pseudo-Wellen T-wave inversions (TWI). In the Wellen ECG, the TWI are seen in leads V1 to V4, whereas in LVH, the TWI usually extend to V4-V6.'
                  '\n\nTo complicate matters further, both LVH and LBBB share many similar ECG features. In one study about LBBB, about 93% of the patients actually had LVH at autopsy. A significant proportion of patients with LVH, will eventually progress to develop LBBB. So, how to recognize an LVH in the presence of LBBB?'
                  '\n\nLVH is a structural condition, and ECG is not sensitive. However, the ECG is more specific for LVH when both the voltage and non-voltage criteria are fulfilled. If the ECG shows LBBB, then assess for the presence of Left Atrial Abnormality (LAA). If LAA (also known as left atrial enlargement LAE) is present, then we can infer that LVH is also present concomitantly with the LBBB.'
                  '\n\nThe criteria below is usually sufficient for daily practice.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/LVH.png',
                ),
                SizedBox(height: 20),
                Text(
                  'The other non-voltage criterion is a delayed intrinsicoid deflection in lead V6. This is actually time from QRS onset to the peak of R wave in V6 more than 50 msec.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  '\nFor further reference regarding LVH ECG features, click on the youtube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/0JKOidX3Nw0?si=G8zYkElXLQX5Nmmq&t=14';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'T');
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageS42 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page S4.2A'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Left Bundle Branch Block (LBBB)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Before you finally diagnose an LVH, you should analyse the ECG again to look for the presence of a Left Bundle Branch Block (LBBB). Both LVH and LBBB are STEMI mimickers and ought to be ruled out first prior to applying the ECG diagnostic criteria for STEMI.'
                  '\n\nThere are instances when LBBB should be suspected. Firstly, the presence of deep S wave (=> 5 big boxes) in leads V1 and/or V2 may indicate either LVH or LBBB. Secondly, the presence of singular (or monophasic) broad R waves in leads I, V5 and V6 should rule-in the diagnosis of a complete LBBB.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/LBBB1.png',
                ),
                SizedBox(height: 20),
                Text(
                  'The singular (monophasic) R in LBBB is broad, may appear ‘square’, ‘M-pattern’ or ‘notched’. ‘Septal Q waves’ are absent in V5, V6, and I.'
                  '\n\nLBBB does mimic a STEMI because it causes abnormal \'depolarization\' (QRS changes), resulting in abnormal \'repolarization\'. The ST-T changes in LBBB are called \'secondary ST-T changes'' whereas the ST segment and T waves are in opposite direction to the nett polarity of the QR amplitudes.'
                  '\n\nYou can also recall the ‘WiLLiaM-MaRRoW’ mnemonic. The ‘W’ in WiLLiaM refers to QRS morphological changes in lead V1, and its ‘M’ refers to the QRS morphological changes in lead V6, and ‘LL’ refers to ‘LEFT’ BBB.'
                  '\n\nIn addition, machine interpretation is quite reliable in three ECG diagnoses; Normal Sinus Rhythm, Complete RBBB and Complete LBBB. You can use this information to your advantage. ',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/LBBB2.png',
                ),
                Text(
                  '\nLBBB masks anterior STEMI. You should then analyse the LBBB using the ‘Sgarbossa-Smith-Modified ECG Criteria in order to rule in a concomitant STEMI in the presence of LBBB.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/LBBB3.png',
                ),
                Text(
                  '\nIf the height of ‘Discordant STE’ exceeds 25% of length of its S wave, then a concomitant STEMI present too. Other independent criteria include Concordant STE height of 1mm, and STD of 1mm in any lead among V1, V2 or V3.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  '\nFor further reference regarding LBBB ECG features, click on the youtube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/HPLR_lixSpY?si=Xcyuc3mZ7Qhh7meW';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'T');
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageS42B extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page S4.2B'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Paced Ventricular Rhythm',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Before you finally make a diagnosis of an LBBB, you should always look hard for the presence of a ‘pacing spike’. A pacing spike will appear as a linear vertical artifact or a small big dot that is always present at the beginning of each QRS complex within an ECG lead. However, this pacing spike does not have to be present in all ECG leads.'
                  '\n\nThe presence of pacing spike will make a diagnosis of paced ventricular rhythm.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                Text(
                  '\nFor further reference regarding paced ECG rhythms, click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/dTcw-L3oUQ4?si=bajo8o7ZPEG-7h02';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                 child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'T');
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageS5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page S5'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Prinzmetal Angina (Coronary Vasospasm)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'In this variant of angina, the patient will experience ischemic, and a 12-lead ECG will demonstrate STE changes that are ‘indistinguishable’ from that of a STEMI. The STT changes are ‘ischemic’, with straight/convex STE, usually in Right Coronary Artery (RCA) distribution with reciprocal STD'
                  '\n\nThe ischemic pain could be severe and possibly leads to a cardiorespiratory collapse / arrest. However, once the vessel relaxes, the chest pain resolves and ST elevations will disappear'
                  '\n\nThe symptom usually resolves with administration of nitrate. So, if you encounter an ischemic-chest pain patient who is relieved by means of sublingual glyceryl trinitrate (GTN), then you ought to repeat the ECG to see the STE ‘magically disappear within minutes.'
                  '\n\nIt could be a pitfall if you are too ‘trigger-finger’ in administering fibrinolysis as you are trying your best to achieve the 30-minute-door-to-needle in STEMI reperfusion target.'
                  '\n\nThis condition responds well to nitrates and calcium channel blocker. A beta blocker should not be used as it will aggravates the condition.'
                  '\n\nCase Illustration:'
                  '\nThis is a 12-lead ECG taken from a female patient who is experiencing acute ischemic chest pain while in the emergency department. A sublingual GTN is administered. The first ECG at 7:53am shows an STE in inferior leads with highest STE in lead III, with reciprocal STD in lead aVL and is suspicious for a right sided involvement and posterior extension. A right-sided ECG taken at 8:01am (8 minutes apart) shows no right ventricle involvement (no STE in V4R) and a posterior-lead ECG taken at 8:05am shows no posterior extension. However, in these two latter ECGs, the STE seen prior in inferior leads have resolved and completely return to baseline. These are evolving ECG changes of a coronary vasospasm right before our eyes.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/Vasospasm1.png',
                ),
                SizedBox(height: 10),
                Text(
                  'To view further, click on this YouTube link:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/SYamY6hfxyk?si=m0u2MAX51ctwQ6vC';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuestionnairePage(questionGroup: questionGroups[0], initialIndex: questionGroups[0].questions.length - 1)),
                  );
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New InfoPages for T questions
class InfoPageT12 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page T1.2'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Right Ventricle Hypertrophy (RVH)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Right ventricular hypertrophy (RVH) is a structural disorder hence an echocardiography is the most appropriate tool to assess its presence. The ECG is not sensitive.'
                  '\n\nRVH ECG changes are obscured by the larger effect on ECG of electrical forces generated by the larger mass of the left ventricle. Only when the changes (or hypertrophy) are significant enough will we be able to see RVH changes on an ECG.'
                  '\n\nYou may refer to RVH ECG changes as below:',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/RVH.jpg',
                ),
                SizedBox(height: 20),
                Text(
                  'An RVH will produce tall R in the right sided leads (V1&V2, occasionally V3) with secondary STT changes. RVH will produce right axis deviation (RAD). However, not all RVH cause RAD. About 90% of RVH do.'
                  '\n\nIf there is no RAD but you still have a suspicion for an RVH because of the patient’s risk factors, clinical conditions and/or suggestive clinical examination findings, you may then refer to other ECG changes effected by RVH. Or you may simply perform an echo if skill and machine are readily available.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'To view further on RVH ECG changes, click on this YouTube link:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/uP-G47Y7IBw?si=PVT2YIUR8amFeElo';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'E'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageT13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page T1.3'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Posterior STEMI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Posterior STEMI ECG changes are akin to the dark side of the moon, on a standard (anterior) 12-lead ECG. One may order a posterior lead ECG by reorganize leads V4, V5 and V6 in their appropriate sites posteriorly and labelled as V7, V8 and V9 respectively. Their horizontal sites are in the same horizontal plane of that V6. Their vertical sites are:'
                  '\n\n•	V7 at left posterior axillary line \n•	V8 at the same line of tip of left scapula \n•	V9 is at the left paraspinal line'
                  '\n\nOn a standard traditional 12-lead ECG, a posterior STEMI is suspected if you see STD in V1 to V3 with an inferior STEMI. Furthermore, a posterior STEMI is diagnosed via ‘indirect approach’ when all the following three ECG features are present in any one lead from either leads V1, V2 or V3. They are:'
                  '\n\n1.	Tall R (R wave that is longer than its S wave, or R:S ratio is more than 1).\n2.	ST depression, either upsloping or horizontal.\n3.	Upright T wave. Just look at the terminal half of the T wave, if it is positive then it is upright.'
                  '\n\nYou can also look for STE of at least 0.5mm in just any one lead from V7, V8 and V9. This is a ‘direct’ approach.'
                  '\n\nHowever, if you have already diagnosed a posterior STEMI based on the ‘indirect’ approach, you diagnosis will remain true, even in the absence of ST elevation on the posterior-lead ECG V7, V8 or V9.'
                  '\n\nOccasionally a posterior STEMI occurs in isolation, not part of an inferior STEMI. Hence, this recognition of a posterior STEMI on standard anterior ECG is an important to an interpreter.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'To view further on Posterior STEMI, click on this YouTube link:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/BJT_uYYnokY?si=bw8dubUUkDaB95jg';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'E'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageT2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page T2'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Hyperkalemia',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Hyperkalemia is considered the ‘syphilis’ for an ECG. This is because hyperkalemia mimics many ECG changes, similar to neurosyphilis that mimics several neurological disorders.'
                  '\n\nOne of the earliest ECG manifestations of hyperkalemia is tall and tented T waves. This is best visualized at leads V4, V5 and V6.'
                  '\n\nA T wave is classified as ‘tall’ if the height of T wave is at two-third or more of its R wave. A T wave is deemed ‘tented’ if it has a narrow base relative to its height.'
                  '\n\nThe presence of tall and tented T wave should alert an interpreter to the probability of hyperkalemia. This is in contrast to Hyper-Acute T wave (HATW), whereby HATW will demonstrate a tall and broad-based T wave.'
                  '\n\nYou should also look for other ECG changes of hyperkalemia, such as:'
                  '\n\n•	Tall & Tented T wave\n•	Prolonged PR interval\n•	Flattening of P wave\n•	Broad QRS complex\n•	Sine wave pattern (the QRS merges directly with T wave without returning to its isoelectric line).'
                  '\n\nFor those of you who loves mnemonic, here is one for Hyperkalemia: U TOP MURDERER!'
                  '\n\nHyperkalemia: U TOP MURDERER! \nU= Unspecific signs & symptoms \nT= Tall Tented T \nO= Outpour (nausea, vomiting & diarrhoea) \nP= Prolonged PR & Palpitations \nM= Muscle cramps (Pain: Chest, Abdo) & (body) weakness \nU=Urine-less: Oliguria, Anuria \nR= Respiratory paralysis (dyspnoea) \nD= Decreased Contractility (Low CO/BP). \nE= Elevate ST & Electric Line (Sine Wave) \nR= Reflexes: Hypo or Hyper \nE= Extra Wide QRS \nR= Raised R (amplified)'
                  '\n\nA ‘superwide’ QRS of 200msec (5 sb) usually denotes to two causes; Hyperkalemia and Toxicity (Sodium Channel Toxicity, TCA, severe acidosis).'
                  '\n\nAnd a ‘extra superwide’ QRS of 240msec (6 sb) or more usually means only one diagnosis, that is Hyperkalemia.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'For further reference on hyperkalemia and ECG changes, click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/2Dn-V681xRE?si=rQCKLbxdEZrRFN1v';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'E'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageT3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page T3'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Brugada Sign',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Brugada syndrome/sign is considered the modern wonder of ECG! People initially thought that all ECG ‘knowledge’ is already known after a century years until Josep and Pedro Brugada published this new and unique clinical entity in 1992. Six years later, Ramon Brugada discovered the genetic basis; SCN5 coding for this autosomal dominant condition.'
                  '\n\nIf a patient experiences clinical symptoms such as unexplained syncope, or witnessed VT or VF and having this Brugada Sign in the ECG, we should clinch the diagnosis as Brugada Syndrome.'
                  '\n\nThis syndrome is commoner in the eastern than the western part of the world. Although it is ‘rare’, it is believed that it is ‘underdiagnosed’. It is more common in Southeast Asia, particularly Thailand, hence the mnemonic.'
                  '\n\nWhen a patient suffers a cardiac arrest and prolonged, death ensues and the patient ‘died suddenly’ even though appears to be ‘healthy’. If it is short-lived, the patient suffers a ‘syncope’ and will consult doctor especially in primary care, general practice and emergency department. The patient is ‘physically’ healthy and the ECG changes may be the only ‘clue’ to this syndrome. Hence, recognition matters.'
                  '\n\nIn the ECG, look for the presence of these changes (called Brugada Sign) in lead V1 or V2 (occasionally V3):'
                  '\n\n•	RBBB-like or RSR pattern, and \n•	‘downsloping’ ST elevation, and \n•	inverted T wave'
                  '\n\nThese changes may occur in transient only. And you may increase the chance to pick it up by placing the electrodes for lead V1 and V2 by one to intercostal spaces higher than standard site.'
                  '\n\nIf Brugada Sign is present, the patient merits a cardiology consult for assessment with a view for medication as treatment or placement of intraventricular cardioverter-defibrillator device based on outcome of risk assessment.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'For further reference on Brugada Syndrome and ECG changes, click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/DQBWmThTShk?si=tyaoojR_FFBy-Cgd';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'E'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageT4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page T4'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Hypothermia',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Hypothermic patient does not usually present with acute ischemic chest pain. However, hypothermia is one of the mimics for STE conditions.'
                  '\n\nHypothermia is a condition when the core body temperature drops to less than 35’ Celcius. It is categorized into mild, moderate and severe.'
                  '\n\nA ‘giant’ J-wave in hypothermia is called Osborn wave. Other ECG changes include bradyarrhythmias with various blocks, slow atrial fibrillation, and prolonged QT.'
                  '\n\nOne may misinterpret the giant J-wave as an STE. If you see a ‘STEMI’ in a hypothermic patient, you may want to re-analyse the ECG again.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'For further reference on hypothermia and Osborn J-wave, click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/qhvmqwqcAPg?si=VQQsrIB3OPfeNZJT';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'E'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New InfoPages for E questions
class InfoPageE1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page E1'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Early Repolarisation Syndrome (ERS) / Pattern',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'It is previously known as Benign Early Repolarisation (BER). However, after several studies have indicated that a significant number of these patients developed cardiovascular complications, the word ‘Benign’ is thus deemed unsuitable. Hence, it is now called Early Repolarisation Pattern, or Syndrome if the patient has some clinical entities.'
                  '\n\nEarly repolarisation pattern / syndrome usually demonstrates some degree of STE, primarily in the precordial (anterolateral) leads. The presence of STE in inferior leads may indicate that the patient is in a higher risk category.'
                  '\n\nClassically, the STE seen in ERS usually have the ‘fish-hook’ appearance of the J-wave, and most sensitive in lead V4. The J-point may appear as a slurring of the terminal QRS with smooth transition to ST segment, or another as a notch (positive spike) at the end of QRS.'
                  '\n\nWith ERS, you should see no pathological Q wave, no reciprocal STD and no evolving/dynamic STT changes.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'For further reference on early repolarisation pattern / syndrome, click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/HiAwuivG63g?si=m5wfy-dIlFAsDhNs';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'M'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageE2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page E2'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Cerebrovascular Event',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'This is obvious from the outset because the patient will not be presenting with acute ischemic chest pain. However, a colleague may ask you to refer a patient to a cardiologist, after seeing ST segment and/or T wave changes on the ECG.'
                  '\n\nIn subarachnoid haemorrhage, it is not uncommon to see T-wave inversions, including the ‘giant’ ones.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'For further reference on ECG changes associated with intracranial haemorrhage click on the YouTube link below: ',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/OhPGRmjMeMQ?si=DWq5nHocit1XHGP9';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'M'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageE3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page E3'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Excess Catecholamines',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Excessive catecholamines secretion occur in Takotsubo cardiomyopathy (aka Stress Cardiomyopathy) and the affected patient may present with chest pain and ECG showing STE that mimics an anterior STEMI and occasionally with deep T wave inversion mimicking a Wellen ECG.'
                  '\n\nThe typical patients are elderly male and female patients with the likely triggering factors are physical and emotional respectively. It requires a high index of suspicion, and the ECG may be indistinguishable from a ‘true’ STEMI. A primary PCI would be able to differentiate between the two.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Image.asset(
                  'assets/images/PIC.jpg',
                ),
                SizedBox(height: 20),
                Text(
                  'For a quick reference on Takotsubo cardiomyopathy click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/rU3j8nXS4NU?si=MOZNDXv8lxjkYNGl';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Quick Reference',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),  
                SizedBox(height: 10),
                Text(
                  'For a more in-depth reference on Takotsubo cardiomyopathy including its echocardiography and left ventriculography findings click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/1U-tJSaO8SY?si=d-z_Vc9F__-nMQEY';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'M'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// New InfoPages for M questions
class InfoPageM1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page M1'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Left Ventricular Aneurysm (LVA)',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'Left ventricular aneurysm produces ‘myocardial bulging’ on echocardiogram. It is suspected if STE on ECG persists beyond its expected time of resolution.'
                  '\n\nThe natural progression of STEMI changes (transmural infarction) will eventually lead to the resolution of the elevated ST segment to its baseline.'
                  '\n\nThis resolution is achieved sooner, in about 2 weeks, after fibrinolysis is performed. Without fibrinolysis, the natural resolution takes about within 6 weeks, and usually none has a persisted STE beyond 9 weeks.'
                  '\n\nLVA changes usually affects the anterolateral leads. The STE changes should be persisted and similar to patient’s previous ECGs.'
                  '\n\nThe following ECG features are suggestive.'
                  '\n\n1.	Well-formed Pathological Q wave (broad >1sb, deep > 1/ 3of R, \n2.	Convex / Coving ST \n3.	Shallow TWI (usually 1/3 of its Q wave, rarely > 2/3 of its R wave'
                  '\n\nYou should suspect an LVA if the changes above are present in the leads that are previously involved in myocardial infarction, that persists beyond its expected time of resolution.'
                  ,
                  style: TextStyle(fontSize: 16),
                ),  
                SizedBox(height: 10),
                Text(
                  'For a quick reference on left ventricular aneurysm click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/GogWE4GGhWw?si=QtrLT95bUyYVQe8w';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'I'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class InfoPageM2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Info Page M2'),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Information page for Wolff-Parkinson-White (WPW) Syndrome',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Text(
                  'The letter ‘W’ in WPW is inverted to become the letter ‘M’ in the S.T.E.M.I. mnemonic.'
                  '\n\nWPW is a congenital conduction disorder whereby an accessory pathway (AP) exists via Bundle of Kent that rapidly conducts electrical impulses from the atria to the ventricles, bypassing the AV node (AVN).'
                  '\n\nThe classical ECG changes are:'
                  '\n\n1.	Short PR interval (< 120 msec, < 3sb) \n2.	‘Delta’ wave (slurring or slow rise of initial portion of QRS complex) \n3.	Broad QRS complex (>120msec)'
                  '\n\nWPW can produce two types of tachyarrhythmias:'
                  '\n\n1.	Atrioventricular re-entry tachycardia (AVRT) Either orthodromic or antidromic.'
                  '\n2.	WPW combined with atrial fibrillation (AF w WPW).'
                  '\n\nAny conduction disorder that affects depolarisation, will affect repolarisation. In WPW, you will observe secondary STT changes. Thus, WPW may mimic:'
                  '\n\n1.	Anteroseptal STEMI \n2.	Q-wave infarct in inferior leads'
                  ,
                  style: TextStyle(fontSize: 16),
                ),  
                SizedBox(height: 10),
                Text(
                  'For a quick reference on WPW ECG click on the YouTube link below:',
                  style: TextStyle(fontSize: 14, fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    const url = 'https://youtu.be/QStk4uUQ7fU?si=wxtvz5iVA92fGeRs';
                    if (await canLaunch(url)) {
                      await launch(url);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(FontAwesomeIcons.youtube, color: Colors.red),
                      SizedBox(width: 8),
                      Text(
                        'Click here',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  showProceedPopup(context, 'I'); // Update to show the correct next group
                },
                child: Text('Continue'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
