import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OptionsScreen(),
    );
  }
}

class OptionsScreen extends StatelessWidget {
  final List<OptionItem> options =[
    OptionItem('Música','lib/assets/images/musica.png'),
    OptionItem('Exercício de Relaxamento','lib/assets/images/exercicio.png'),
    OptionItem('Aulas e Tutoriais','lib/assets/images/aula.png'),
    OptionItem('Jogos','lib/assets/images/jogos.png'),
    OptionItem('Eventos e Atividades Locais','lib/assets/images/evento.png'),

  ];

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
           icon: Row(
            children: [
              Icon(Icons.arrow_back_ios, color: Colors.white),
              SizedBox(width: 4),
              Text('Voltar', style: TextStyle(color: Colors.white, fontSize: 16)
              ),
            ],
           ),
           onPressed: () {
             Navigator.pop(context);
           },
        ),
        title: Text('Lazer',
        style: TextStyle(color: Colors.white, fontSize: 25),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(221, 20, 181, 202),
      ), 
      body: Column(
        children: [   
          SizedBox(height: 10),
          Expanded(
            child: Padding(padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 18 / 1,
              ),
              itemCount: options.length,
              itemBuilder: (context, index) {
                final option = options[index];
                return GestureDetector(
                  onTap: () {
                    print('Opção selecionada: ${option.title}');
                    showDialog(context: context, 
                    builder: (context) => AlertDialog(
                      title: Text('Ação'),
                      content: Text('Você deseja realizar a ação ${option.title}!'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Ok'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 105, 231, 204),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(2.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 110,
                          height: 900,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[200],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(option.imagePath, fit: BoxFit.cover),
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(option.title, 
                          style: TextStyle(
                            fontSize: 25, 
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                          ),
                        ),
                      ],
                    )
                  )
                );
              }
            ),
            )
          )
        ]
      ),
    );
  }
}

class OptionItem{
  final String title;
  final String imagePath;

  OptionItem(this.title,this.imagePath);
}