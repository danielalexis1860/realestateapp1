import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  final String? email;

  const ProfileScreen({super.key, this.email});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  String userType = "Student";
  String? selectedSchool;

  // Example location-based schools
  final Map<String, List<String>> schoolsByLocation = {
    "North": ["University of North", "North Tech Institute"],
    "South": ["South Business School", "Southern University"],
  };

  String selectedLocation = "North";

  @override
  void initState() {
    super.initState();
    if (widget.email != null) {
      emailController.text = widget.email!;
    }
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("firstName", firstNameController.text.trim());
    await prefs.setString("lastName", lastNameController.text.trim());
    await prefs.setString("email", emailController.text.trim());
    await prefs.setString("phone", phoneController.text.trim());
    await prefs.setString("userType", userType);

    if (userType == "Student") {
      await prefs.setString("school", selectedSchool ?? "");
      await prefs.setString("location", selectedLocation);
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Saved Successfully")),
    );

    // Navigate to Home (replace with your actual HomeScreen)
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SuccessScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<String> schools = schoolsByLocation[selectedLocation]!;

    return Scaffold(
      appBar: AppBar(title: const Text("Update Profile")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              /// First Name
              TextFormField(
                controller: firstNameController,
                decoration: const InputDecoration(
                  labelText: "First Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter first name" : null,
              ),
              const SizedBox(height: 20),

              /// Last Name
              TextFormField(
                controller: lastNameController,
                decoration: const InputDecoration(
                  labelText: "Last Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value!.isEmpty ? "Enter last name" : null,
              ),
              const SizedBox(height: 20),

              /// Email
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter email";
                  }
                  if (!value.contains("@")) {
                    return "Enter valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              /// Phone
              TextFormField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Enter phone number" : null,
              ),
              const SizedBox(height: 25),

              /// Student / Non-Student Selection
              const Text("Are you a student?"),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Student"),
                      value: "Student",
                      groupValue: userType,
                      onChanged: (value) {
                        setState(() {
                          userType = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile(
                      title: const Text("Non-Student"),
                      value: "Non-Student",
                      groupValue: userType,
                      onChanged: (value) {
                        setState(() {
                          userType = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Location Dropdown (Only for Students)
              if (userType == "Student") ...[
                DropdownButtonFormField(
                  value: selectedLocation,
                  decoration: const InputDecoration(
                    labelText: "Select Location",
                    border: OutlineInputBorder(),
                  ),
                  items: schoolsByLocation.keys
                      .map(
                        (location) => DropdownMenuItem(
                          value: location,
                          child: Text(location),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedLocation = value!;
                      selectedSchool = null;
                    });
                  },
                ),
                const SizedBox(height: 20),

                /// School Dropdown
                DropdownButtonFormField(
                  value: selectedSchool,
                  decoration: const InputDecoration(
                    labelText: "Select School",
                    border: OutlineInputBorder(),
                  ),
                  items: schools
                      .map(
                        (school) => DropdownMenuItem(
                          value: school,
                          child: Text(school),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedSchool = value;
                    });
                  },
                  validator: (value) {
                    if (userType == "Student" && value == null) {
                      return "Please select a school";
                    }
                    return null;
                  },
                ),
              ],

              const SizedBox(height: 30),

              ElevatedButton(
                onPressed: saveProfile,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("Save Profile"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Temporary Success Screen (Replace with HomeScreen)
class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Success")),
      body: const Center(
        child: Text("Profile Saved & User Logged In"),
      ),
    );
  }
}