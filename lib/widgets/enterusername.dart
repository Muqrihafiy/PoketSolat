
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth.dart';


class UsernamePage extends StatefulWidget{
  UsernamePage({Key? key}) : super(key: key);

  @override
  State<UsernamePage> createState() => _UsernamePageState();
}

class _UsernamePageState extends State<UsernamePage> {
  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  final TextEditingController firstNameController = TextEditingController();

  late String firstName;

  @override
  Widget build(BuildContext context) {


    return Scaffold(

        body: Container(
          color: Colors.black,
          child: Stack(
            children: [
              Positioned.fill(
                  child:Opacity(
                    opacity: 0.3,
                    child: Image.asset('android/assets/img/mosque.png',
                        fit: BoxFit.cover),
                  )
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sila isi nama anda'
                    ),
                    SizedBox(height: 20.0 / 2),
                    Form(
                      key: _formKey,
                      child: Container(
                        decoration: BoxDecoration(
                            color: const Color(0x0fffffff),
                            borderRadius: BorderRadius.circular(10)),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          decoration: InputDecoration(
                            labelText: "First Name",
                            floatingLabelStyle: const TextStyle(
                              color: Color(0xFF1cbb7c),
                              fontWeight: FontWeight.w600,
                            ),
                            labelStyle: TextStyle(
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w600,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 1,
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 2,
                                color: Color(0xFF1cbb7c),
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            contentPadding:
                            const EdgeInsets.fromLTRB(20, 15, 20, 15),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          controller: firstNameController,
                          keyboardType: TextInputType.name,
                          onSaved: (value) {
                            firstNameController.text = value!;
                          },
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          dynamic result = await _auth.signInAnon();
                          if (result == null){
                            print('error');
                          }else {
                            print('sign in');
                            print (result.uid);
                          }

                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            firstName = firstNameController.text;
                            prefs.setString('firstname', firstName);
                            print(firstName);

                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                        }

                      },
                      child: const Text("Save Data"),
                    ),

                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}

