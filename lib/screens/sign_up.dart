import 'package:bookreco/component/components.dart';
import 'package:bookreco/screens/login_Screen.dart';
import 'package:bookreco/widgets/button_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  var userController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  String? email, password;
  bool isLoading = false;
  bool isPassword = true;
  late String passwordValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 35,
                  ),
                  const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Must not be Empty';
                      }
                      return null;
                    },
                    ispassword: false,
                    suffixIcon: null,
                    controller: userController,
                    type: TextInputType.name,
                    hint: 'User Name',
                    prefixIcon: const Icon(Icons.person),
                    onChange: null,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Must not be Empty';
                      }
                      return null;
                    },
                    ispassword: false,
                    suffixIcon: null,
                    controller: emailController,
                    type: TextInputType.emailAddress,
                    hint: 'Email Address',
                    prefixIcon: Icon(Icons.email),
                    onChange: (data) {
                      email = data;
                    },
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    validation: (value) {
                      if (value!.isEmpty) {
                        return 'This Field Must not be Empty';
                      }
                      return null;
                    },
                    onChange: (data) {
                      password = data;
                    },
                    controller: passwordController,
                    ispassword: isPassword,
                    type: TextInputType.visiblePassword,
                    hint: 'Password',
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                          isPassword ? Icons.visibility_off : Icons.visibility),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    controller: null,
                    validation: (value) {
                      if (value != passwordController.value.text) {
                        return 'Confirm Your Password';
                      }
                      return null;
                    },
                    type: TextInputType.visiblePassword,
                    hint: 'Confirm Your Password',
                    ispassword: isPassword,
                    prefixIcon: null,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isPassword = !isPassword;
                        });
                      },
                      icon: Icon(
                          isPassword ? Icons.visibility_off : Icons.visibility),
                    ),
                    onChange: null,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomButon(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});

                        try {
                          await SignUpMethod();
                          GoTohomePage(context, email!);
                        } on FirebaseAuthException catch (ex) {
                          if (ex.code == 'weak-password') {
                            showSnackBar(context, 'weak password');
                          } else if (ex.code == 'email-already-in-use') {
                            showSnackBar(context, 'wrong password');
                          }
                        } catch (ex) {
                          print(ex);
                          showSnackBar(context, 'email already exists');
                        }
                        Future.delayed(
                          const Duration(seconds: 1),
                          () {
                            isLoading = false;
                            setState(() {});
                          },
                        );
                      } else {}
                    },
                    text: 'Register ',
                    isLoading: isLoading,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already a user?',
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const loginScreen(),
                          ));
                        },
                        child: const Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> SignUpMethod() async {
    UserCredential user = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email!, password: password!);
  }
}
