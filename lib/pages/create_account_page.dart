import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountPage extends StatefulWidget {
  final int value;
  const CreateAccountPage({this.value, Key key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeCompleto = TextEditingController();
  final _email = TextEditingController();
  final _senha = TextEditingController();

  bool checkBox = false;
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
                    'Inscreva-se',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  _textFormFieldNomeCompleto('Nome completo',
                      controller: _nomeCompleto),
                  const SizedBox(
                    height: 10,
                  ),
                  _textFormFieldEmail('Email', controller: _email),
                  const SizedBox(
                    height: 10,
                  ),
                  _textFormFieldPassword('Senha', controller: _senha),
                  const SizedBox(
                    height: 10,
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        Checkbox(
                          value: checkBox,
                          activeColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              checkBox = value;
                            });
                          },
                        ),
                        const Text(
                            'Concordo com os termos de privacidade e de conduta')
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  createAccountButton()
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

  _textFormFieldNomeCompleto(
    String label, {
    TextEditingController controller,
    FormFieldValidator<String> validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: const Icon(Icons.person),
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

  SizedBox createAccountButton() {
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.blue.shade900,
        ),
        child: const Text(
          "Registrar-se",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
        onPressed: () async {
          try {
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _email.text, password: _senha.text);

            await FirebaseFirestore.instance
                .collection(defineUser(widget.value))
                .doc(_email.text)
                .set({
              'email': _email.text,
              'nomeCompleto': _nomeCompleto.text,
              'senha': _senha.text
            });
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Conta Criada'),
              ),
            );
            Navigator.pop(context, true);
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

  defineUser(int value) {
    switch (value) {
      case 1:
        return 'alunos';
        break;
      case 2:
        return 'mentores';
        break;
      default:
    }
  }
}
