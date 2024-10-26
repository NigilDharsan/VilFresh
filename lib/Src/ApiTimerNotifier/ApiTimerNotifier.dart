import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:vilfresh/Src/Home_DashBoard_Ui/LoginModel.dart';
import 'package:vilfresh/utilits/ConstantsApi.dart';
import 'package:vilfresh/utilits/Generic.dart';

// Create a class to manage the API call timer
class ApiTimerService {
  Timer? _timer;
  static const Duration _duration = Duration(minutes: 3);

  ApiTimerService() {
    SingleTon().justLogged == false ? _callApi() : ();

    _startPeriodicApiCall(); // Start the timer automatically
  }

  // Function to start the periodic API call
  void _startPeriodicApiCall() {
    if (_timer == null || !_timer!.isActive) {
      _timer = Timer.periodic(_duration, (Timer timer) async {
        await _callApi();
      });
    }
  }

  // API call function
  Future<void> _callApi() async {
    LoginData? user = await getUserInformation();
    String? accesstoken = await getToken();

    var headers = {
      "Accept": "application/json",
      "content-type": "application/json"
    };
    var body =
        jsonEncode({'User_ID': user?.userId ?? "", 'Old_Token': accesstoken});
    try {
      var response = await http.post(Uri.parse(ConstantApi.refreshTokenUrl),
          body: body, headers: headers);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);

        print('API Call Success: ${response.body}');
        accessToken(jsonResponse['Refresh_Token']);
      } else {
        print('API Call Failed: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  // Dispose the timer (optional, if you want to clean up later)
  void dispose() {
    _timer?.cancel();
  }
}

// Declare a simple Provider
final apiTimerProvider = Provider<ApiTimerService>((ref) {
  return ApiTimerService(); // This starts the service when the provider is first read
});
