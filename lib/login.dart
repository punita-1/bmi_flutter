import 'package:bmi_flutter/main.dart';
import 'package:bmi_flutter/signup.dart';
import 'package:flutter/material.dart';
// import 'package:revise/signup_screen.dart';
// import 'home_screen.dart';



class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isPasswordVisible = false;
  bool _isSubmitButtonEnabled = false;

  void _validateForm() {
    setState(() {
      _isSubmitButtonEnabled = _formKey.currentState!.validate();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            onChanged: _validateForm,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Join the community!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add email validation logic here (e.g., regex pattern)
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _passwordController,
                  obscureText: !isPasswordVisible,
                  decoration:  InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),

                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Add password validation logic here (e.g., minimum length)
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isSubmitButtonEnabled
                      ? () {
                    // Handle login logic (e.g., authentication)
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  }
                      : null,
                  child: const Text('Submit'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Handle skip logic (e.g., directly go to home screen)
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: const Text('Skip'),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Handle signup button logic (navigate to signup screen)
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: const Text('Sign Up'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
