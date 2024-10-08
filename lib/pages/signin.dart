import 'package:flutter/material.dart';
import 'package:pet_adoption_app_project/const.dart';
import 'package:pet_adoption_app_project/pages/forgotpassword.dart';
import 'package:pet_adoption_app_project/pages/home.dart';
import 'package:pet_adoption_app_project/pages/signup.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // On/Off password view mode
  bool isVisible = false;

  // Loading
  bool isLoginTrue = false;

  // Global key form
  final formKey = GlobalKey<FormState>();

  void _signIn() {
    if (formKey.currentState!.validate()) {
      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      String validEmail = 'petadoption@gmail.com';
      String validPassword = 'pet1234';

      if (email == validEmail && password == validPassword) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid email or password')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  Image.asset("assets/ScreenAssets/Logo_nobackground.png",
                      width: 180),
                  const Text(
                    "WELCOME BACK!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: orange),
                  ),
                  const Text("We're so happy to see you again!",
                      style: TextStyle(color: subtitle)),
                  const SizedBox(height: 7),

                  // Email Part
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.email),
                          border: InputBorder.none,
                          label: Text("Email")),
                    ),
                  ),

                  // Password
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is Required";
                        } else if (value.length < 6) {
                          return "Password must be more than 6 characters";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Password",
                          suffixIcon: IconButton(
                            icon: Icon(isVisible
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                          )),
                    ),
                  ),

                  // Forgot Password
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPasswordPage()));
                          },
                          child: const Text("Forgot Password"))
                    ],
                  ),

                  // Login Button
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: green,
                    ),
                    child: TextButton(
                      onPressed: _signIn,
                      child: Center(
                          child: isLoginTrue
                              ? const CircularProgressIndicator(color: white)
                              : const Text("LOGIN",
                                  style: TextStyle(color: white))),
                    ),
                  ),

                  // Sign Up
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?",
                          style: TextStyle(color: subtitle)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUp()));
                          },
                          child: const Text("Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold)))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
