import 'cuidador_conect.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CuidadorScreen(),
      );
  }
}
class CuidadorScreen extends StatefulWidget {
  @override
  _CuidadorScreenState createState() => _CuidadorScreenState();
}

class _CuidadorScreenState extends State<CuidadorScreen> {
  final List<Map<String, dynamic>> question = [
    {
        'question': 'Você possui alguma formação ou experiência em cuidados com Idosos?',
        'options': ['Não Possuo', 'Sim, Possuo conhecimento básico', 'Sim, Possuo conhecimento intermediário', 'Sim, Possuo conhecimento avançado'],
        'answers': [true, false, false, false],
    },
  ];
  int _currentQuestionIndex = 0;
  void _proxPergunta() {
    if (_currentQuestionIndex < question.length - 1) {
      setState(() {
        _currentQuestionIndex++;
      });
    }
  }

  void _antPergunta() {
    if (_currentQuestionIndex > 0) {
      setState(() {
        _currentQuestionIndex--;
      });
  }
  }
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidht = MediaQuery.of(context).size.width;
    final currentQuestion = question[_currentQuestionIndex];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/principal.jpeg'),
                fit: BoxFit.fill,
                ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.90,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    spreadRadius: 5,
                    offset: Offset(0, -3),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 100),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            currentQuestion['question'],
                            style: TextStyle(
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: 'Helvetica',
                                        fontSize: 25,
                                      ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        ...currentQuestion['options'].asMap().entries.map((entry) {
                        int idx = entry.key;
                        String option = entry.value;
                        return CheckboxListTile(
                          title: Text(option),
                          value: currentQuestion['answers'][idx],
                          onChanged: (bool? value) {
                            setState(() {
                              currentQuestion['answers'][idx] = value ?? false;
                            });
                          },
                        );
                        }).toList(),
                        SizedBox(
                          width: double.infinity,
                          child:
                              ElevatedButton(
                          onPressed:(){
                            Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ConectScrenn(),)
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            backgroundColor: const Color.fromARGB(255, 2, 122, 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text('Próximo',
                          style: TextStyle(fontSize: 18, color: Colors.white),),
                        ),
                        ),
                        
                       
                      ]
                    )
                  )
                )
              )
            )
          ]
        )
      );
    }
  }