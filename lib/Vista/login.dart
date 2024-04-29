import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Login & Register",
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(190, 126, 52, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const BackButton(),
      ),
      body: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            top: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32)
              ),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.fromLTRB(16, 32, 16, 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text("Registrar", style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 32,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    const Text("Registrate e inicia sesión",
                      style: TextStyle(
                        color: Colors.blueGrey
                      ),
                    ),
                    const SizedBox(height: 90,),
                    const Text("Usuario"),
                    const SizedBox(height: 10,),
                    const Material(
                      elevation: 4,
                        borderRadius: BorderRadius.all(
                            Radius.circular(32),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none
                          ),
                        ),
                    ),

                    const SizedBox(height: 32,),
                    const Text("Contraseña"),
                    const SizedBox(height: 10,),
                    Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(32),
                      child: const TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none
                        ),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text("Olvidaste tu contraseña?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 18, 19, 19)
                            ),
                          ),
                        ),
                    ),

                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}