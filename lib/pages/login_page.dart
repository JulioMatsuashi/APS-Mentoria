import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _email = TextEditingController();
  final _senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: SingleChildScrollView(
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
                    'Bem-vindo',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'A melhor plataforma de mentoria do Brasil',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _textFormFieldEmail('Email', controller: _email),
                  const SizedBox(
                    height: 10,
                  ),
                  _textFormFieldPassword('Senha', controller: _senha),
                  const SizedBox(
                    height: 10,
                  ),
                  loginButton()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _textFormFieldEmail(
    String label, {
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.email_rounded),
        labelStyle: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
        labelText: label,
      ),
    );
  }

  _textFormFieldPassword(
    String label, {
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.lock),
        labelStyle: const TextStyle(
            color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 15),
        labelText: label,
      ),
    );
  }

  SizedBox loginButton() {
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue.shade900,
        ),
        child: const Text(
          "Entrar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        onPressed: () async {
          try {
            await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _email.text, password: _senha.text);
          } catch (e) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(e.code),
              ),
            );
          }
        },
      ),
    );
  }
}
