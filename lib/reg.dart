import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projectmehema/custom_shape.dart';
//import 'package:projectmehema/home.dart';
import 'package:projectmehema/login.dart';

final _formKey = GlobalKey<FormState>();

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //create the controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  String? validateEmail(String? email) {
    RegExp emailRegex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    final isEmailValid = emailRegex.hasMatch(email ?? '');
    if (!isEmailValid) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 150,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: ClipPath(
            clipper: CustomShape(),
            child: Container(
              height: 250,
              width: MediaQuery.of(context).size.width,
              color: const Color.fromARGB(255, 0, 140, 255),
              child: const Center(
                  child: Text(
                ",shdmosxÑ fjuq",
                style: TextStyle(
                    color: Colors.white, fontSize: 50, fontFamily: 'FM-Gemunu'),
              )),
            ),
          )),
      //for the form to be in center
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                const Text('mßYS,l kduh',//User Name , 
                style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'FM-Bindumathi',
                        fontSize: 20)),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'mßYS,l kduh we;=<;a lrkak',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(120, 0, 0, 0),
                          fontFamily: 'FM-Bindumathi',
                          fontSize: 15)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a username';
                    } else if (value.length < 3) {
                      return 'Username must be atleast 3 characters long';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                //some space between name and email
                const SizedBox(
                  height: 10,
                ),
                const Text('B ;emE<', //Email
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontFamily: 'FM-Bindumathi',
                        fontSize: 20)),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'B ;emE, we;=<;a lrkak',
                      hintStyle: TextStyle(
                          color: Color.fromARGB(120, 0, 0, 0),
                          fontFamily: 'FM-Bindumathi',
                          fontSize: 15)),
                  validator: validateEmail,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),

                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'uqrmoh', //password
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontFamily: 'FM-Bindumathi',
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'uqrmoh we;=<;a lrkak', //password again
                      hintStyle: TextStyle(
                          color: Color.fromARGB(120, 0, 0, 0),
                          fontFamily: 'FM-Bindumathi',
                          fontSize: 15)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the password';
                    } else if (value.length < 6) {
                      return 'Password must be atleast 6 characters!';
                    } else if (value.length > 15) {
                      return 'Password mustn\'t be more than 15 characters!';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'uqrmoh kej;;a', //confirm pass
                  style: TextStyle(
                      fontFamily: 'FM-Bindumathi',
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20),
                ),
                const SizedBox(
                  height: 5,
                ),
                TextFormField(
                  obscureText: true,
                  controller: confirmPasswordController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'uqrmoh kej; we;=<;a lrkak',
                      hintStyle: TextStyle(
                          fontFamily: 'FM-Bindumathi',
                          fontSize: 15,
                          color:
                              Color.fromARGB(120, 0, 0, 0)) //enter confirm pass
                      ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the password';
                    } else if (value.length < 6) {
                      return 'Password must be atleast 6 characters!';
                    } else if (value.length > 15) {
                      return 'Password mustn\'t be more than 15 characters!';
                    } else if (value != passwordController.text) {
                      return 'Password doesn\'t match!';
                    }
                    return null;
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    errorMessage,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: emailController.text,
                                password: passwordController.text)
                            .then((value) {
                          //print("New Account Created!");
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        }).onError((error, stackTrace) {
                          //print("${error.toString()}");
                          setState(() {
                            errorMessage = 'Email already exists!';
                          });
                        });
                      } catch (e) {
                        //print(e);
                      }
                    }
                    // FirebaseAuth.instance.createUserWithEmailAndPassword(
                    //   email: emailController.text,
                    //   password: passwordController.text)
                    // .then((value) {
                    //     print("Created New Account");
                    //     Navigator.push(context,
                    //       MaterialPageRoute(builder: (context) => HomeScreen()));
                    // }).onError((error, stackTrace) {
                    //   print('Error ${error.toString()}');
                    // });

                    //print(nameController.text);
                    // print(emailController.text);
                    //print(passwordController.text);
                    //print(addressController.text);
                  },
                  style:
                      ElevatedButton.styleFrom(minimumSize: const Size(20, 50)),
                  child: const Text(
                    ',shdmosxÑ fjuq', //Signup
                    style: TextStyle(
                      fontFamily: 'FM-Gemunu',
                      fontSize: 30,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                signInOption(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'l,ska ,shdmosxÑ jqKdo@',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'FMDerana',
            fontSize: 20,
          ),
        ), //Already have an account
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            );
          },
          child: const Text(
            'f,d.a fjuq',
            style: TextStyle(
              fontFamily: 'FM-Bindumathi',
              fontSize: 15,
              color: Color.fromARGB(255, 0, 128, 255),
            ),
          ), // login
        ),
      ],
    );
  }
} //project
