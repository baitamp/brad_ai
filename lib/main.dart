import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> questions = [
    // เพิ่มคำถามอีก 10 ข้อ
    Question(
      question: 'เมืองหลวงของไทยคืออะไร?',
      answers: [
        'กรุงเทพฯ',
        'เชียงใหม่',
        'ภูเก็ต',
        'อยุธยา',
      ],
      correctAnswer: 'กรุงเทพฯ',
    ),

    // เพิ่มคำถามอีก 9 ข้อ
    Question(
      question: 'ถนนสายแรกในประเทศไทยคือถนนอะไร?',
      answers: [
        'ถนนเจริญกรุงฯ',
        'ถนนเพชรเกษม',
        'ทางหลวงหมายเลข 1',
        'ถนนพหลโยธิน',
      ],
      correctAnswer: 'ถนนเจริญกรุงฯ',
    ),

    // เพิ่มคำถามอีก 8 ข้อ
    Question(
      question: 'ทางรถไฟสายแรกของไทยคือทางรถไฟสายอะไร?',
      answers: [
        'ทางรถไฟสายกรุงเทพฯ',
        'ทางรถไฟสายมรณะ',
        'ทางรถไฟบางปะอิน',
        'ทางรถไฟสายกรุงเทพฯ-ปากน้ำ',
      ],
      correctAnswer: 'ทางรถไฟสายกรุงเทพฯ-ปากน้ำ',
    ),

    // เพิ่มคำถามอีก 7 ข้อ
    Question(
      question: 'วนอุทยานแห่งชาติที่อยู่สูงที่สุดในไทยคือที่ไหน?',
      answers: [
        'วนอุทยานดอยหัวแม่คำ จ.ตาก',
        'วนอุทยานน้ำตกปะหละทะ จ.นครสวรรค์',
        'วนอุทยานภูกระดึง จ.เลย',
        'วนอุทยานเขาหลวง จ.น่าน',
      ],
      correctAnswer: 'ภูกระดึง จ.เลย',
    ),

    // เพิ่มคำถามอีก 6 ข้อ
    Question(
      question: 'จังหวัดที่มีฝนตกมากที่สุดในไทยคือจังหวัดอะไร',
      answers: [
        'จ.สงขลา',
        'จ.ระนอง',
        'จ.พังงา',
        'จ.ปัตตานี',
      ],
      correctAnswer: 'จ.ระนอง',
    ),

    // เพิ่มคำถามอีก 5 ข้อ
    Question(
      question: 'จังหวัดที่ปลูกชามากที่สุดในไทย',
      answers: [
        'จ.เชียงใหม่',
        'จ.สมุทรปาการ',
        'จ.เพชรบุรี',
        'จ.อุทัยทานี',
      ],
      correctAnswer: 'จ.เชียงใหม่',
    ),

    // เพิ่มคำถามอีก 4 ข้อ
    Question(
      question: 'จังหวัดที่ปลูกพริกไทยมากที่สุดในไทย',
      answers: [
        'จ.จันทบุรี',
        'จ.นครปฐม',
        'จ.ภูเก็ต',
        'จ.ชุมพร',
      ],
      correctAnswer: 'จ.จันทบุรี',
    ),

    // เพิ่มคำถามอีก 3 ข้อ
    Question(
      question: 'ปลาที่ชาวประมงจับได้มากที่สุดในไทยคือปลาอะไร',
      answers: [
        'ปลาหมอ',
        'ปลาตะเพียน',
        'ปลากระพง',
        'ปลาทู',
      ],
      correctAnswer: 'ปลาทู',
    ),

    // เพิ่มคำถามอีก 2 ข้อ
    Question(
      question: 'นักดาราศาสตร์คนแรกของไทย',
      answers: [
        'ร.4',
        'ร.3',
        'ร.2',
        'ร.1',
      ],
      correctAnswer: 'ร.4',
    ),

    // เพิ่มคำถามอีก 1 ข้อ
    Question(
      question: 'ดีบุกขุดได้มากที่ในไทยอยู่ที่จังหวัดอะไร',
      answers: [
        'จ.ภูเก็ต',
        'จ.เชียงราย',
        'จ.สมุทรสงคราม',
        'จ.ประจวบคีรีขันต์',
      ],
      correctAnswer: 'จ.ภูเก็ต',
    ),
    
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(questions[currentQuestionIndex].question),
            ...questions[currentQuestionIndex].answers.map((answer) {
              return ListTile(
                title: Text(answer),
                onTap: () {
                  if (answer == questions[currentQuestionIndex].correctAnswer) {
                    score++;
                  }
                  setState(() {
                    if (currentQuestionIndex < questions.length - 1) {
                      currentQuestionIndex++;
                    } else {
                      // แสดงผลลัพธ์
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('ผลลัพธ์'),
                          content: Text('คุณได้คะแนน $score จาก ${questions.length} คะแนน'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('ปิด'),
                            ),
                          ],
                        ),
                      );
                    }
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String question;
  final List<String> answers;
  final String correctAnswer;

  Question({
    required this.question,
    required this.answers,
    required this.correctAnswer,
  });
}
