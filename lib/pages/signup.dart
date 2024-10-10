import 'package:flutter/material.dart';
import 'package:pet_adoption_app_project/const.dart';
import 'package:pet_adoption_app_project/pages/home.dart';
import 'package:pet_adoption_app_project/pages/signin.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Controller
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confpasswordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confpasswordController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();

  // Password view modde
  bool isVisible = false;
  bool isSignIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/ScreenAssets/Logo_nobackground.png",
                      width: 180),
                  const Text(
                    "Create Your Account!",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: orange),
                  ),
                  const Text("Create your account by fill the details below!",
                      style: TextStyle(color: subtitle)),
                  const SizedBox(height: 10),

                  // Username
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      controller: _usernameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username is Required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.person),
                          border: InputBorder.none,
                          label: Text("Username")),
                    ),
                  ),

                  // Email
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value!.isEmpty) {
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
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is Required";
                        } else if (_passwordController.text !=
                            _confpasswordController.text) {
                          return "Password not match";
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

                  // Confirm Password
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.deepPurple.withOpacity(.3),
                    ),
                    child: TextFormField(
                      controller: _confpasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Password is Required";
                        } else if (value.length < 6) {
                          return "Password must more than 6 characters";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Confirm Password",
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

                  // Phone Number
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.3)),
                    child: TextFormField(
                      controller: _phoneController,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Phone Number is Required";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          icon: Icon(Icons.phone),
                          border: InputBorder.none,
                          label: Text("Phone Number")),
                    ),
                  ),

                  const SizedBox(height: 8),

                  // SignIn
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: green),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      },
                      child: Center(
                          child: isSignIn
                              ? const CircularProgressIndicator(
                                  color: white,
                                )
                              : const Text('Sign Up',
                                  style: TextStyle(color: white))),
                    ),
                  ),

                  //
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?",
                          style: TextStyle(color: subtitle)),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignIn()));
                          },
                          child: const Text("Login",
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
