import 'package:bookreco/component/components.dart';
import 'package:bookreco/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  String? email, password;
  bool isLoading = false;

  bool isPassword = true;
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Container(
            height: 650,
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.82,
                  child: Image.asset(
                    'images/background.jpg',
                    fit: BoxFit.fill,
                    height: 650,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 25, left: 25, right: 25, top: 90),
                  child: Container(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 90,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              'Bookreco',
                              style: TextStyle(
                                  fontSize: 35,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          onChanged: (data) {
                            email = data;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field Must Not Be Empty';
                            }
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                              errorStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Username or Email',
                              filled: true,
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.brown, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon:
                                  Icon(Icons.email, color: Colors.black),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          onChanged: (data) {
                            password = data;
                          },
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'This Field Must Not Be Empty';
                            }
                          },
                          obscureText: isPassword,
                          keyboardType: TextInputType.visiblePassword,
                          decoration: InputDecoration(
                              errorStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Password',
                              filled: true,
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              fillColor: Colors.white,
                              hoverColor: Colors.white,
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.brown, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              prefixIcon:
                                  const Icon(Icons.lock, color: Colors.black),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    isPassword = !isPassword;
                                  });
                                },
                                icon: Icon(
                                    isPassword
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    color: Colors.black),
                              ),
                              border: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 2),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: const ButtonStyle(
                                  fixedSize: MaterialStatePropertyAll(
                                      Size.fromWidth(140)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      //Color.fromARGB(235, 168, 82, 12)
                                      Color.fromARGB(221, 82, 30, 6))),
                              onPressed: () async {
                                if (formKey.currentState!.validate()) {
                                  isLoading = true;
                                  setState(() {});

                                  try {
                                    await LoginUser();
                                    GoTohomePage(context, email!);
                                  } on FirebaseAuthException catch (ex) {
                                    if (ex.code == 'user-not-found') {
                                      showSnackBar(context, 'user not found');
                                    } else if (ex.code == 'wrong-password') {
                                      showSnackBar(context, 'wrong password');
                                    }
                                  } catch (ex) {
                                    print(ex);
                                    showSnackBar(context, 'there was an error');
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
                              child: Center(
                                child: isLoading
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        'Login',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),
                                      ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '__________OR__________',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: const ButtonStyle(
                                    fixedSize: MaterialStatePropertyAll(
                                        Size.fromWidth(110)),
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color.fromARGB(235, 243, 242, 241))),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const signUp(),
                                  ));
                                },
                                child: const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> LoginUser() async {
    UserCredential user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email!, password: password!);
  }
}
