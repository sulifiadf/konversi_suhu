import 'package:flutter/material.dart';
import 'home_page.dart';
import 'package:provider/provider.dart';
import '../providers/login_providers.dart';

class MyLoginPage extends StatelessWidget {
  const MyLoginPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3B82F6),
        title: const Text(
          "Log In to Your Account",
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Cardo',
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        child: Column(
          children: [
            Form(
              autovalidateMode: AutovalidateMode.always,
              child: TextFormField(
                decoration: InputDecoration(hintText: "Enter Email"),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
              decoration: InputDecoration(hintText: "Enter Password"),
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                final loginProvider = Provider.of<LoginProvider>(context, listen: false);
                if (loginProvider.login(context)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(loginProvider.notif)),
                  );
                }
              },
              child: Container(
                height: 40,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF10B981),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '', // Notification text placeholder
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
