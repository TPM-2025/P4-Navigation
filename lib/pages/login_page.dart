import 'package:asisten_tpm_4/pages/home_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool isError = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 48, 20, 20),
        child: ListView(
          children: [
            Text("Login Page", style: TextStyle(fontSize: 24)),
            SizedBox(height: 12),
            TextField(
              controller: _username,
              decoration: InputDecoration(
                hintText: "Usernames",
                filled: true,
                fillColor: isError ? Colors.red.shade100 : Colors.transparent,
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _password,
              obscureText: true,
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: isError ? Colors.red.shade100 : Colors.transparent,
              ),
            ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: () {
                if (_username.text == "rafli" && _password.text == "123") {
                  setState(() {
                    isError = false;
                  });
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => HomePage(username: _username.text),
                    ),
                  );
                } else {
                  setState(() {
                    isError = true;
                  });
                }
                String message =
                    isError ? "Username atau password salah" : "Login berhasil";
                SnackBar snackBar = SnackBar(content: Text(message));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
