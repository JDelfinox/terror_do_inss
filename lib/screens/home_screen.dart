import 'package:flutter/material.dart';
import 'package:terror_do_inss/screens/cad_nome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Raiz do aplicativo
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tela de Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
      debugShowCheckedModeBanner: false, // Remove a banner de debug
    );
  }
}

class LoginScreen extends StatelessWidget {
  // Controladores para os campos de texto
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Método para lidar com o login
  void handleLogin(BuildContext context) {
    String email = emailController.text;
    String password = passwordController.text;
    
    if (email == "teste" && password == "1234") {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => CadastroNomeScreen()),
        );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Usuário ou Senha INCORRETOS')), 
          );
    }
  }


  // Método para lidar com a recuperação de senha
  void handleRecoverPassword(BuildContext context) {
    // Adicione a lógica de recuperação de senha
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Recuperar senha pressionado')),
    );
  }

  // Método para lidar com o login via Google
  void handleGoogleLogin(BuildContext context) {
    // Adicione a lógica de login com Google
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Entrar com Google pressionado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Obtendo as dimensões da tela
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/images/idosos.jpeg'),
                fit: BoxFit.fill, // Ajusta a imagem para cobrir toda a tela
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.05, // 10% da altura da tela a partir do topo
            left: 0,
            right: 0,
            child: Center(
              child: Image.asset(
                'lib/assets/images/logo_app.png', // Caminho para a sua logo
                height: 70.0, // Ajuste o tamanho conforme necessário
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: screenHeight * 0.5, // 50% da altura da tela
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    spreadRadius: 5.0,
                    offset: Offset(0.0, -3.0),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //Campo de Email
                      TextField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: const Color.fromARGB(115, 136, 135, 135)),
                          ),
                          prefixIcon: Icon(Icons.email, color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      //Campo de Senha
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: 'Senha',
                          hintStyle: TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 255, 255, 255),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: BorderSide(color: const Color.fromARGB(115, 136, 135, 135)),
                          ),
                          prefixIcon: Icon(Icons.lock, color: Colors.grey,),
                        ),
                      ),
                      SizedBox(height: 10.0,),
                      //Botão de Entrar
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => handleLogin(context),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            backgroundColor: const Color.fromARGB(255, 2, 122, 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          child: Text(
                            'Entrar',
                            style: TextStyle(fontSize: 18.0, color: Colors.white),
                            )
                          ),
                      ),
                      SizedBox(height: 20.0,),
                      //Opção Entrar com Google
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          onPressed: () => handleGoogleLogin(context),
                          icon: Image.asset('lib/assets/images/google.png', width: 30.0, height: 30.0, ),
                          label: Text('Entrar com Google'),
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16.0),
                            side: BorderSide(color:   Colors.grey),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30.0),
                      // Barra inferior de Registro
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Não tem conta? ', style: TextStyle(color: Colors.grey)),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context,
                            MaterialPageRoute(builder: (context) => CadastroNomeScreen(),)
                            );
                            },
                            child: Text(
                              'Registre-se Aqui',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                decoration: TextDecoration.underline,
                              ),
                            )
                          ),
                        ]
                      )
                    ],
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