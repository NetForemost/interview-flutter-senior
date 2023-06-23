import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: APITestPage(),
    );
  }
}

class APITestPage extends StatefulWidget {
  @override
  _APITestPageState createState() => _APITestPageState();
}

class _APITestPageState extends State<APITestPage> {
  String _apiResponse = '';

  Future<void> fetchData() async {
    const url = 'https://api.publicapis.org/entries'; // Replace with your API endpoint
    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          _apiResponse = data.toString();
        });
      } else {
        setState(() {
          _apiResponse = 'Error: ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _apiResponse = 'Error: $e';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API Test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: fetchData,
              child: Text('Fetch Data'),
            ),
            SizedBox(height: 16),
            Text(
              _apiResponse,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
