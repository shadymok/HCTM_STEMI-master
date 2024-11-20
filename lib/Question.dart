import 'package:first_test/Questionlist.dart';
import 'package:flutter/material.dart';

enum ContentType { text, image, i_text, b_text}

class QuestionContent {
  final String data;
  final ContentType type;

  QuestionContent({required this.data, required this.type});
}

class Question {
  final List<QuestionContent> contents;

  Question({required this.contents});
}

class QuestionGroup {
  final String title;
  final Color color;
  final List<Question> questions;
  final Map<String, String> diagnosisLogic; // Key is a combination of answers, value is the diagnosis

  QuestionGroup({
    required this.title,
    required this.color,
    required this.questions,
    required this.diagnosisLogic,
  });
}
// \u2022 - bullet, 
// \u25C6 - diamond bullet, 
// \u25E6 - white bullet,
// \t - spacing
// \n - next line
List<QuestionGroup> questionGroups = [
  QuestionGroup(
    title: 'S',
    color: Colors.grey,
    questions: [
      Question(contents: [
        QuestionContent(data: 'S1 A', type: ContentType.b_text),
        QuestionContent(data: 'Size & Strain (LHV) ', type: ContentType.text),
        QuestionContent(data: '\n\u2022 1st S wave in V1 + R wave in V5/V6  >35mm.', type: ContentType.text),
      ]), // S1 A.
      Question(contents: [
        QuestionContent(data: 'S1 B', type: ContentType.b_text),
        QuestionContent(data: 'Size & Strain (LHV)', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 2nd Deepest S + the tallest R > 45mm',
        type: ContentType.text),
      ]), //S1 B.
      Question(contents: [
        QuestionContent(data: 'S1 C', type: ContentType.b_text),
        QuestionContent(data: 'Size & Strain (LHV)', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 3rd S wave in V3 + R in aVL'
        '\n\t\t\u25E6 28mm, male'
        '\n\t\t\u25E6 20mm, female',
        type: ContentType.text),
      ]), //S1 C.
      Question(contents: [
        QuestionContent(data: 'S1 D', type: ContentType.b_text),
        QuestionContent(data: 'Size & Strain (LHV)', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 4th R wave in aVL > 11mm',
        type: ContentType.text),
      ]), //S1 D.
      Question(contents: [
        QuestionContent(data: 'S1 E', type: ContentType.b_text),
        QuestionContent(data: 'Size & Strain (LHV)', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 5th R wave in Lead 1 > 12mm',
        type: ContentType.text),
      ]), //S1 E.
      Question(contents: [
        QuestionContent(data: 'S1 F', type: ContentType.b_text),
        QuestionContent(data: 'Size & Strain (LHV)', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022Extra Size = [R wave in aVL + S wave in V3] [QRS duration (in msec)] > 2,440 mVmsec.',
        type: ContentType.text),
        QuestionContent(data: '(this is presumably the best index. Sensitivity 51% and specificity 95%)', type: ContentType.i_text),
      ]), //S1. F
      Question(contents: [
        QuestionContent(data: 'S2', type: ContentType.b_text),
        QuestionContent(data: 'Size & Strain (for LHV)', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 S2 Strain pattern STD with TWI in: ' 
        '\n\t\t\t\u25E6 V5 & V6, or'
        '\n\t\t\t\u25E6 I & aVL, or'
        '\n\t\t\t\u25E6 All of the above', 
        type: ContentType.text), 
      ]), //S2
      Question(contents: [
        QuestionContent(data: 'S3.1', type: ContentType.b_text),
        QuestionContent(data: 'LVH and LBBB Share \nSimilar ECG Features', type: ContentType.b_text),
        QuestionContent(data: '\n\n\u2022\tBefore you conclude the diagnosis of an LVH, you should analyzethe ECG further for the presence of a \Left Bundle Branch Block.', 
        type: ContentType.text),
      ]), //S3.1
      Question(contents: [
        QuestionContent(data: 'S3.2', type: ContentType.b_text),
        QuestionContent(data: 'Singular R (for LBBB)', type: ContentType.b_text),
        QuestionContent(data: '\nLook for presence of singular R wave (broad monophasic) in:' 
         '\n\u2022 I & aVL, or'
         '\n\u2022 V5 & V6, or'
         '\n\u2022 all of the above', 
        type: ContentType.text),
      ]), //S3.2
      Question(contents: [
        QuestionContent(data: 'S4.1', type: ContentType.b_text),
        QuestionContent(data: 'LBBB and Paced \nVenticular Rhythm Share \nSimilar ECG Features', type: ContentType.b_text),
        QuestionContent(data: '\n\n\u2022\tPrior to making the diagnosis of an LBBB, you should analyze the ECG further for the presence of Paced Ventricular Rhythm', 
        type: ContentType.text),
      ]), //S4.1
      Question(contents: [
        QuestionContent(data: 'S4.2', type: ContentType.b_text),
        QuestionContent(data: 'Spike (ventricular pacing)', type: ContentType.b_text),
        QuestionContent(data: '\nAlways look for the presence of ‘spike’ at the ' 
        'beginning of broad QRS complex with an LBBB features.'
        'Presence of spike will diagnose it as a paced ventricular rhythm',
        type: ContentType.text),
      ]), //S4.2
      Question(contents: [
        QuestionContent(data: 'Non-Ischemic Vasospasm (Prinzmetal Angina)', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 Pattern on ST elevation very similar & indistinguishable to acute STEMI' 
        '\n\u2022 ECG changes are transient & reversible with vasodilators'
        '\n\u2022 Usually not a/w myocardial necrosis', 
        type: ContentType.text), 
      ]), //S5.
      Question(contents: [
        QuestionContent(data: 'SYNOPSIS', type: ContentType.b_text),
        QuestionContent(data: '\nS components'
        '\n\u2022 S1 & S2 = Size & Strain'
        '\n\u2022 S3 = Singular R'
        '\n\u2022 S4 = Spike'
        '\n\u2022 S5 = Spasm'
        '\n\nDiagnosis/Condition'
        '\n\u2022 LVH'
        '\n\u2022 LBBB'
        '\n\u2022 Paced Ventricular Rhythm'
        '\n\u2022 Prinzmetal angina (coronary vasospasm)',
        type: ContentType.text),
      ]), //SYNOPSIS
    ],
    diagnosisLogic: {
      '10000': 'Left ventricular hypertrophy (LVH)', //condition need to check again
      '01000': 'Left ventricular hypertrophy (LVH)', //condition need to check again
      '11000': 'Left ventricular hypertrophy (LVH)',
      '11100': 'LBBB',
      '11110': 'Paced Venticular Rhythm',
      '11111': 'Prinzmetal angina (coronary vasospasm)',
    },
  ),
  QuestionGroup(
    title: 'T',
    color: Colors.orange,
    questions: [
      Question(contents: [
        QuestionContent(data: 'T1 = Tall R wave in V1/V2/V3', type: ContentType.b_text),
        QuestionContent(data: 'assets/images/T1.png',
        type: ContentType.image),
      ]), //T1.1
      Question(contents: [
        QuestionContent(data: 'Tall R wave = R is longer than S', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 Check for presence of RAD' 
        '\n\u2022 If yes = RVH'
        '\n\u2022 Note: 90% of RVH have RAD. If concern for RVH exist but not tall by proportion, then measure:' 
        '\n\t\t\t\u25E6 R in V1 > 7mm'
        '\n\t\t\t\u25E6 S in V6 >7mm', 
        type: ContentType.text),
        QuestionContent(data: '\n\u2022 RVH have secondary ST-T changes' 
        '\n\u2022 May mimic NSTEMI'
        '\n\u2022 Mimic S1Q3T3'
        '\n\u2022 Cant diagnose LPFB', 
        type: ContentType.text),
      ]), //T1.2
      Question(contents: [
        QuestionContent(data: 'Diagnosis of posterior STEMI', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 Directly',type: ContentType.text),
        QuestionContent(data: '\t\u25E6 Posterior lead ECG V7, V8 & V9'
        '\t\n\u25E6 0.5mm STE in any one lead',
        type: ContentType.text),
        QuestionContent(data: '\n\u2022 Indirectly',type: ContentType.text),
        QuestionContent(data: 'All three changes needed to be present but only in one lead (V1 to V3)'
        '\t\n\u25E6 Tall R wave (R>S)'
        '\t\n\u25E6 STD esp flat'
        '\t\n\u25E6 Upright T wave', 
        type: ContentType.text)
      ]), //T1.3
      Question(contents: [
        QuestionContent(data: 'Hyperkalemia', type: ContentType.b_text),
        QuestionContent(data: 'assets/images/T2.png', type: ContentType.image),
        QuestionContent(data: '\n\u2022 The ''syphilis'' of clinical ECG' 
        '\n\n\u2022 Features include:', 
        type: ContentType.text),
        QuestionContent(data: '\u25E6 Peak T wave' 
        '\n\u25E6 Prolonged PR interval'
        '\n\u25E6 Flattening of P waves'
        '\n\u25E6 Wide QRS complex'
        '\n\u25E6 Sine wave', 
        type: ContentType.b_text),
      ]), //T2
      Question(contents: [
        QuestionContent(data: 'Brugada Syndrome', type: ContentType.b_text),
        QuestionContent(data: 'assets/images/T3.1.png', type: ContentType.image),
        QuestionContent(data: 'assets/images/T3.2.png', type: ContentType.image),
        QuestionContent(data: 'Note: ECG morphologies may transform from one type to the other or may normalize completely',
        type: ContentType.b_text),
      ]), //T3
      Question(contents: [
        QuestionContent(data: 'Hypothermia - Osborn Waves', type: ContentType.b_text),
        QuestionContent(data: 'assets/images/T4.png', type: ContentType.image),
        QuestionContent(data: '\u2022 The Osborn wave (J wave or J-point notching):' 
        '\n\t\t\t\u25E6 Positive deflection at J point' 
        '\n\t\t\t\u25E6 Negative deflection in aVR and V1'
        '\n\t\t\t\u25E6 Prominent in precordial leads', 
        type: ContentType.text),
        QuestionContent(data: '\n\u2022 Bradycardia (including AV block) are also common in moderate and severe hypothermia',
        type: ContentType.text),
      ]), //T4
      Question(contents: [
        QuestionContent(data: 'SYNOPSIS', type: ContentType.b_text),
        QuestionContent(data: '\nT components'
        '\n\u2022 T1 = Tall R in V1/V2/V3'
        '\n\u2022 T2 = Tall and tented T'
        '\n\u2022 T3 = Thailand'
        '\n\u2022 T4 = Temperature',
        type: ContentType.text),
        QuestionContent(data: '\nDiagnosis/Condition'
        '\n\u2022 RVH or Posterior STEMI'
        '\n\u2022 Hyperkalemia'
        '\n\u2022 Brugada syndrome'
        '\n\u2022 Hypothermia',
        type: ContentType.text),
      ]), //Synopsis T
    ],
    diagnosisLogic: {
      '1000': 'RVH or Posterior STEMI',
      '0100': 'Hyperkalemia',
      '1100': 'Hyperkalemia',
      '1110': 'Brugada Syndrome',
      '1111': 'Hypothermia'
    },
  ),
  QuestionGroup(
    title: 'E',
    color: Colors.lightBlue,
    questions: [
      Question(contents: [
        QuestionContent(data: 'Early Repolarization Syndrome (ERS)', type: ContentType.b_text),
        QuestionContent(data: 'assets/images/E1.png', type: ContentType.image),
        QuestionContent(data: '\nIn 2015, Hancock et al proposed: '
        '\n\n\u2022 The QRS slur or notch (termed a J wave) must be on the downslope of the R wave and be above the isoelectric line;'
        '\n\u2022 The peak of the J point must be elevated ≥ 0.1 mV in two or more contiguous leads except V1-V3'
        '\n\u2022 The QSR duration must be < 120 ms',
        type: ContentType.text,
        ),
      ]), //E1
      Question(contents: [
        QuestionContent(data: 'Cerebrovascular Event', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 Clinical presentation usually obvious' 
        '\n\t\t\u25E6 Hemorrhagic stroke' 
        '\n\t\t\u25E6 ICB'
        '\n\t\t\u25E6 Raised ICP'
        '\n\t\t\u25E6 SAH', 
        type: ContentType.text),
      ]), //E2
      Question(contents: [
        QuestionContent(data: 'Takotsubo Syndrome (TTS)/Stress CMP', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 May mimic anteroseptal STEMI'
        '\n\u2022 It is difficult to differentiate by ECG alone'
        '\n\u2022 Suspicion based on presentation, new ECG changes'
        '\n\u2022 ECG involve may cross territory'
        '\n\u2022 Trigger: Post menopausal women = Emotional trigger'
        '\n\u2022 Male = Physical trigger'
        '\n\u2022 Mayo Clinic criteria', 
        type: ContentType.text),
      ]), //E3
      Question(contents: [
        QuestionContent(data: 'SYNOPSIS', type: ContentType.b_text),
        QuestionContent(data: '\nE components'
        '\n\u2022 E1 = Early Repolarization'
        '\n\u2022 E2 = Event Cerebrovascular'
        '\n\u2022 E3 = Excess catecholamines'
        '\n\nDiagnosis/Condition'
        '\n\u2022 ERS/BER'
        '\n\u2022 Changes secondary to brain insult'
        '\n\u2022 Takotsubo syndrome',
        type: ContentType.text),
      ]),//Synopsis E
    ],
    diagnosisLogic: {
      '100': 'ERS/BER',
      '110': 'Changes secondary to brain insult',
      '111': 'Takotsubo syndrome',
      '010': '010 test',
    },
  ),
  QuestionGroup(
    title: 'M',
    color: Colors.green,
    questions: [
      Question(contents: [
        QuestionContent(data: 'Left Ventricular Aneurysm (LVA)', type: ContentType.b_text),
        QuestionContent(data: '\u2022 Persistent STE following trans-mural infarct ' 
        '\n\t\t\t\u25E6 2/52 if thrombolysis'
        '\n\t\t\t\u25E6 6/52 if w/o intervention'
        '\n\n\u2022 Mostly in precordial leads (V1-V6)', 
        type: ContentType.text),
        QuestionContent(data: '\n\u2022 Features include:' 
        '\n\t\t\u25E6 Convex (coving) STE morphology (KIV concave)'
        '\n\t\t\u25E6 Well formed Q wave'
        '\n\t\t\u25E6 Shallow T wave inversion ~ 1/3'
        '\n\t\t\t\t\t\u2022 Not 2/3 of Q wave depth ', 
        type: ContentType.text),
      ]), //M1
      Question(contents: [
        QuestionContent(data: 'Wolff-Parkinson-White Syndrome', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 Recognized by' 
        '\n\t\t\t\u25E6 Delta wave – slurring on the upstroke of R wave'
        '\n\t\t\t\u25E6 Short PR interval'
        '\n\n\u2022 Abnormal depolarization with secondary ST-T changes'
        '\n\n\u2022 May mimic and obscure AMI'
        '\n\t\t\t\u25E6 Affect inferior & anterior leads'
        '\n\n\u2022 Delta wave - a pseudo-infarct pattern (Q wave)', 
        type: ContentType.text),
      ]), //M2
      Question(contents: [
        QuestionContent(data: 'SYNOPSIS', type: ContentType.b_text),
        QuestionContent(data: '\nM components'
        '\n\u2022 M1 = Myocardial Bulging'
        '\n\u2022 M2 = M-inverted to-‘W’',
        type: ContentType.text),
        QuestionContent(data: '\nDiagnosis/Condition'
        '\n\u2022 Left Ventricular Aneurysm'
        '\n\u2022 WPW Syndrome',
        type: ContentType.text),
      ]), //Synopsis M
    ],
    diagnosisLogic: {
      '10': 'Left Ventricular Aneurysm',
      '01': 'WPW Syndrome',
      '11': 'WPW Syndrome',
    },
  ),
  QuestionGroup(
    title: 'I',
    color: Colors.red,
    questions: [
      Question(contents: [
        QuestionContent(data: 'Pericarditis', type: ContentType.b_text),
        QuestionContent(data: '\nI = Inflammatory', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 The closest mimic (consider for every STEMI)'
        '\n\u2022 Some AMI may cause pericarditis', 
        type: ContentType.text),
        QuestionContent(data: '\u2022 Not all ECG features are present at the same time', type: ContentType.text),
        QuestionContent(data: '\u2022 STE in pericarditis MUST involve both chest and limb leads.', type: ContentType.text),
        QuestionContent(data: '\u2022 The supportive ECG features are contained in the mnemonic below:'
        '\n\t\t\t\u25E6 PERI-CAR-DI-TI-S',
        type: ContentType.text),
      ]), //I1
      Question(contents: [
        QuestionContent(data: 'PERI = PR Elevation, REvert Inferior', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 PR elevaton in lead a VR with ST depression'
        '\n\n\u2022 PR depression in inferior leads and other (chest) leads', 
        type: ContentType.text),
      ]), //I2
      Question(contents: [
        QuestionContent(data: 'CAR = Concave Absent Reciprocal', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 Concave ST elevation'
        '\n\n\u2022 Absent reciprocal STD'
        '\t\t\n\u25E6 No STD except in lead a VR'
        '\n\n\u2022 Also absent pathological Q wave',
        type: ContentType.text),
      ]), //I3
      Question(contents: [
        QuestionContent(data: 'DI = Degree ST, Inferior Lead', type: ContentType.b_text),
        QuestionContent(data: '\n\u2022 Analyze the degree of STE height in inferior leads (Leads II vs III)'
        '\n\n\u2022 STE in lead II > III = Support Pericarditis'
        '\n\n\u2022 STE in lead III > II = Supports AMI', 
        type: ContentType.text),
      ]), //I4
      Question(contents: [
        QuestionContent(data: 'TI = T inversion & Isoelectric ST', type: ContentType.b_text),
        QuestionContent(data: 
        '\n\n\u2022 T wave inversion in pericarditis occurs with ST segment has returned to isoelectric line'
        '\n\n\u2022 If TWI occurs while ST segment is still elevated = Supports AMI', 
        type: ContentType.text),
      ]), //I5
      Question(contents: [
        QuestionContent(data: 'S = ST/T ratio in V6', type: ContentType.b_text),
        QuestionContent(data: '\n\n\u2022 This ECG finding is highly specific for pericarditis: '
        '\t\t\n\u25E6 ST/T ratio in lead V6 > 0.25 (>25%)'
        '\n\n\u2022 However, recall that "SpPIN"'
        '\n\n\u2022 If the ratio is fulfilled, pericarditis is strongly diagnosed.'
        '\n\n\u2022 On the contrary, if it is not fulfilled = it does not rule out pericarditis.'
        '\n\n\u2022 One shall look for other supportive ECG changes', 
        type: ContentType.text),
      ]), //I6
      Question(contents: [
        QuestionContent(data: 'SYNOPSIS', type: ContentType.b_text),
        QuestionContent(data: '\nPERI.CAR.DI.TI.S. Components'
        '\n\u2022 PERI'
        '\n\u2022 CAR'
        '\n\u2022 DI'
        '\n\u2022 TI'
        '\n\u2022 S',
        type: ContentType.text),
        QuestionContent(data: '\nECG Features'
        '\n\u2022 PR elevation aVR, Revert Inferior'
        '\n\u2022 Concave ST, Absent Reciprocal'
        '\n\u2022 Degree ST, Inferior leads'
        '\n\u2022 T Inversion, Isoelectric ST'
        '\n\u2022 ST-T ratio in V6 ',
        type: ContentType.text),
      ]), //Synopsis I
    ],
    diagnosisLogic: {
      '1': 'Pericarditis',
    },
  ),
  QuestionGroup(
    title: 'More Info',
    color: Colors.pink,
    questions: [
      Question(contents: [
        QuestionContent(data: 'More Info Page', type: ContentType.b_text),
      ]), 
    ],
    diagnosisLogic: {
      '0': '',
    },
  ), //this is extra page for more info
];