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
    OptionItem('Calendário','lib/assets/images/calendario.png'),
    OptionItem('Meu Paciente','lib/assets/images/paciente.png'),
    OptionItem('Comunidade','lib/assets/images/comunidade.png'),
    OptionItem('Lazer','lib/assets/images/lazer.png'),
    OptionItem('Dicas','lib/assets/images/dicas.png'),
    OptionItem('Direito dos Idosos','lib/assets/images/direitos.png'),
    OptionItem('Autocuidado','lib/assets/images/autocuidado.png'),
    OptionItem('Compras','lib/assets/images/compras.png'),
    OptionItem('Lembretes','lib/assets/images/lembretes.png'),
    OptionItem('Personalize seus Lembretes','lib/assets/images/personalizar.png'),
    OptionItem('Vagas para Cuidador','lib/assets/images/vagas.png'),
    OptionItem('Consulta Médica Online','lib/assets/images/consulta.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding:const EdgeInsets.all(16.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('lib/assets/images/usuario.png'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Olá, Usuário',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)
                      ),
                      Text(
                        'Bem-Vindo!',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    print('Botão de Emergência Pressionado');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red
                  ),
                  child: Text(
                    'Emergência',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pesquise aqui...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              onChanged: (value) {
                print( 'Texto digitado: $value');
              },
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: Padding(padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 3 / 1,
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
                      color: Colors.white,
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
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(option.imagePath,
                        width: 50,
                        height: 50,
                        ),
                        SizedBox(height: 10),
                        Text(option.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold
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