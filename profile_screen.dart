import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'property_listing_screen.dart';

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

  /// Mauritius Cities
  final List<String> mauritiusCities = [
    "Port Louis",
    "Curepipe",
    "Quatre Bornes",
    "Vacoas",
    "Rose Hill",
    "Grand Baie",
    "Flic en Flac",
  ];

  String selectedCity = "Port Louis";

  /// Budget Options
  final List<String> budgetRanges = [
    "Rs 5,000 - Rs 10,000",
    "Rs 10,000 - Rs 15,000",
    "Rs 15,000 - Rs 20,000",
  ];

  String? selectedBudget;

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
    await prefs.setString("city", selectedCity);
    await prefs.setString("budget", selectedBudget ?? "");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Profile Saved Successfully")),
    );
  }

  @override
  Widget build(BuildContext context) {
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

              /// Student / Non-Student
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

              /// City Dropdown
              DropdownButtonFormField(
                value: selectedCity,
                decoration: const InputDecoration(
                  labelText: "Preferred City",
                  border: OutlineInputBorder(),
                ),
                items: mauritiusCities
                    .map((city) => DropdownMenuItem(
                          value: city,
                          child: Text(city),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCity = value!;
                  });
                },
              ),

              const SizedBox(height: 20),

              /// Budget Dropdown
              DropdownButtonFormField(
                value: selectedBudget,
                decoration: const InputDecoration(
                  labelText: "Select Budget Range",
                  border: OutlineInputBorder(),
                ),
                items: budgetRanges
                    .map((budget) => DropdownMenuItem(
                          value: budget,
                          child: Text(budget),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedBudget = value;
                  });
                },
                validator: (value) =>
                    value == null ? "Please select budget range" : null,
              ),

              const SizedBox(height: 30),

              /// SAVE PROFILE
              ElevatedButton(
                onPressed: saveProfile,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("Save Profile"),
              ),

              const SizedBox(height: 15),

              /// GO TO PROPERTY LISTINGS
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PropertyListingScreen(
                        city: selectedCity,
                        budget: selectedBudget ?? "",
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  backgroundColor: Colors.green,
                ),
                child: const Text("View Property Listings"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
