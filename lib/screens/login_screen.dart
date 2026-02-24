import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  // ✅ Email validation function
  bool isValidEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

  Future<void> sendOtp() async {
    if (!_formKey.currentState!.validate()) {
      return; // Stop if email is invalid
    }

    String email = emailController.text.trim();

    setState(() => isLoading = true);

    try {
      // ✅ Call API (still happens)
      await ApiService.sendOtp(email);
    } catch (e) {
      // ✅ Ignore API errors
      debugPrint("OTP Error: $e");
    } finally {
      setState(() => isLoading = false);
    }

    // ✅ ALWAYS navigate to Profile Screen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProfileScreen(email: email),
      ),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Email Login"),),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Enter Email",
                  hintText: "username@example.com", // ✅ Shows format
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  }
                  if (!isValidEmail(value.trim())) {
                    return "Email must be in the format username@example.com";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading ? null : sendOtp,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: isLoading
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Text("Continue"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}