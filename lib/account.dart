import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:email_validator/email_validator.dart'; // email validator
// using shared_preferences to store data in local storage
class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _UserCardState();
}

class _UserCardState extends State<RegisterPage> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  String _username = '';
  String _email = '';

  Future<void> _saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _usernameController.text);
    await prefs.setString('email', _emailController.text);
    setState(() {
      _username = _usernameController.text;
      _email = _emailController.text;
    });
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _username = prefs.getString('username') ?? '';
      _email = prefs.getString('email') ?? '';
    });
  }
  // update the state 
  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change account details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            Form(autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              validator: (value) => EmailValidator.validate(value!) ? null : "Please enter a valid email"
            ),),
            const SizedBox(height: 20),
            // button to save it 
            ElevatedButton(
              onPressed: _saveUserData,
              child: const Text('Save'),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Text('Username: $_username'),
                    Text('Email: $_email'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}