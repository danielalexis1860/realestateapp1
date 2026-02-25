import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // Replace with your actual backend URL
  static const String baseUrl = "http://YOUR_BACKEND_URL/api";

  /// Sends OTP to the given email.
  /// Returns true if successful, false otherwise.
  static Future<bool> sendOtp(String email) async {
    try {
      final Uri url = Uri.parse("$baseUrl/send-otp");

      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email}),
      );

      // Debug info
      print("OTP API Response: ${response.statusCode} ${response.body}");

      if (response.statusCode == 200) {
        // Optional: Check backend JSON message
        final Map<String, dynamic> data = jsonDecode(response.body);
        if (data.containsKey('success') && data['success'] == true) {
          return true;
        }
        // Fallback if backend does not return 'success' field
        return true;
      } else {
        // Non-200 HTTP code
        print("Failed to send OTP. Status: ${response.statusCode}");
        return false;
      }
    } catch (e) {
      // Network or JSON parsing error
      print("Error sending OTP: $e");
      return false;
    }
  }
}
