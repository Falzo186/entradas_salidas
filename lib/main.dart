import 'dart:async';
import 'package:entradas_salidas/Controlador/Controlador_Login.dart';
import 'package:entradas_salidas/Controlador/Controlador_camiones.dart';
import 'package:flutter/material.dart';
import 'package:entradas_salidas/Vista/Vista_registrar.dart';
import 'Vista/Vista_MenuAlmacen.dart';
import 'Vista/Vista_MenuVigilante.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async{
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tu Aplicacion",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: Color.fromARGB(255, 232, 114, 4), elevation: 0.0),
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromARGB(0, 0, 0, 0)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3), 
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()), 
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 79, 212, 184),
              Color.fromARGB(255, 70, 209, 191),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
          'lib/assets/camion.png', 
          width: 300,
          height: 300,
          color: Colors.white, 
              ),
              const SizedBox(
          height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class AnimatedLogo extends StatefulWidget {
  const AnimatedLogo({Key? key}) : super(key: key);

  @override
  _AnimatedLogoState createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State
<StatefulWidget> with SingleTickerProviderStateMixin{
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this as TickerProviderStateMixin,
    );
    _controller.forward(); 
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (__, _) {
        return Transform.scale(
          scale: _controller.value * 0.5 + 1.0, 
          child: Image.asset(
            'lib/assets/camion.png', 
            width: 300,
            height: 300,
            color: Colors.white,
          ),
        );
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showPassword = false;
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  ControladorLogin controlador = ControladorLogin();
  ControladorCamiones controladorCamiones = ControladorCamiones();
  

  @override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.7, 
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 79, 212, 184),
                Color.fromARGB(255, 70, 209, 191),
              ],
            ),
          ),
          child: Stack(
    children: [
      Positioned(
        top: 40, 
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'lib/assets/camion.png', width: 90,
          color: Colors.white, 
              ),
             ),
            ], 
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.7, 
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(90),
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: ElevatedButton(
                          onPressed: () async {
                          if (await controlador.login(_email, _password)){
                            if(await controlador.getTipoUsuario(_email) == 1){
                              Navigator.of(context, rootNavigator: true).push(
                                MaterialPageRoute(
                                  builder: (context) => const Inicio(),
                                ),
                              );
                          }else {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => const  AlmacenesMenu(),
                              ),
                            );
                          }
                          }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                          ),
                          child: const Text(
                            'INGRESAR',
                            style: TextStyle(color: Color.fromARGB(255, 70, 209, 191), fontSize: 20),
                          ),
                        ),
                      ),
                      Container(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true).push(
                              MaterialPageRoute(
                                builder: (context) => const RegistroUsuarios(),
                              ),
                            );
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                          ),
                          child: const Text(
                            'REGISTRARSE',
                            style: TextStyle(color: Color.fromARGB(255, 70, 209, 191), fontSize: 20),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 40),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.white,
                             borderRadius: BorderRadius.circular(10),
                             boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              const Padding(
                              padding: EdgeInsets.only(left: 8), 
                              child: Text('Usuario',style: TextStyle(color: Colors.black, fontSize: 17),
                           ),
                       ),
                            TextFormField(
                            decoration: const InputDecoration(
                              hintText: '',
                              hintStyle: TextStyle(color: Colors.grey,fontSize: 17,),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(horizontal: 10),
                            ),
                            style: const TextStyle(color: Colors.black),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Introduce aquí tu usuario';
                              }
                              return null;
                            },
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                               }
                             );
                            },
                            ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery.of(context).size.width * 0.7,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                            BoxShadow(color: Colors.black12,blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            Row(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 8), 
                                  child: Text('Contraseña',style: TextStyle(color: Colors.black, fontSize: 17),
                                  ),
                                  ),
                                  Expanded(child: Container()),
                                  IconButton(
                                    icon: Icon(_showPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined, 
                                    color: const Color.fromARGB(255, 70, 209, 191), 
                                    size: 25),
                                    onPressed: () { 
                                      setState(() {
                                        _showPassword = !_showPassword; 
                                        });
                                      }
                                    ),
                                  ],
                                ),
                                TextFormField(
                                  obscureText: !_showPassword, 
                                  decoration: const InputDecoration(
                                    hintText: '',
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                                    ),
                                    style: const TextStyle(color: Colors.black),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Ingrese su contraseña';
                                        }
                                        return null;
                                        },
                                        onChanged: (value) {
                                          setState(() {
                                            _password = value;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 25.0),
                                ],
                              ),
                            ),
                          ],
                        )
                      ),
                    ),
                  ),
                ],
              ),
          );
        }


}





