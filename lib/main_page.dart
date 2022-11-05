import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _userName = "", _eMail = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Main Page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: ListView(
            children: [
              TextFormField(
                //initialValue: "Sinem ALAGÖZ",
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.length < 4) {
                    _userName = value;
                    return "Must be at least 4 characters.";
                  } else {
                    return null;
                  }
                  //value!.length > 4 ? "En az 4 karakter olamalı." : null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                // initialValue: "Sinem ALAGÖZ",
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "E-Mail",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (!EmailValidator.validate(value!)) {
                    _eMail = value;
                    return "This is not an email.";
                  } else {
                    return null;
                  }
                  
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print("the form is valid");
                      ScaffoldMessenger.of(context).showSnackBar(
                        
                        SnackBar(
                          backgroundColor: Colors.teal,
                          content: Text(
                          "User Name: $_userName \n E-Mail: $_eMail"
                        ),)
                      );
                    }

                    // print("object");
                  },
                  child: const Text("Submit"))
            ],
          ),
        ),
      ),
    );
  }
}
