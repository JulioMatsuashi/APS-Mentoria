import 'package:flutter/material.dart';
import 'package:tccfacul/pages/create_account_page.dart';
import 'package:tccfacul/pages/login_page.dart';

class InitalPage extends StatefulWidget {
  const InitalPage({Key key}) : super(key: key);

  @override
  State<InitalPage> createState() => _InitalPageState();
}

class _InitalPageState extends State<InitalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                width: 300,
                child: Image.asset('assets/logo.jpeg'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Bem-vindo à Level Up',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Antes de começarmos, me diga: Você é aluno ou mentor?',
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      const Text(
                        'Aluno',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                        ),
                        onTap: () async {
                          var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CreateAccountPage(value: 1),
                            ),
                          );

                          if (result != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                  Column(
                    children: [
                      const Text(
                        'Mentor',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        child: Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                        ),
                        onTap: () async {
                          var result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CreateAccountPage(value: 2),
                            ),
                          );

                          if (result != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginPage(),
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ),
                  );
                },
                child: const Text(
                  'Já tem cadastro? Faça Login',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
