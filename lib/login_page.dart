import 'package:flutter/material.dart';
import 'package:flutter_application_3/home_page.dart';

class MyLoginPage extends StatefulWidget {
  const MyLoginPage({super.key});

  @override
  State<MyLoginPage> createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String useremail = "sulifia@pensmail.com";
  String pass = "123456";
  String notif = " ";

   void login(String email, String password) {
  
      if (email == useremail && password == pass ) {
        setState(() 
          {
            notif = " ";
          });
        Navigator.push(context, 
          MaterialPageRoute(builder: (context) => HalamanKonversi())
          );
      } else {
        setState(() 
          {
            notif = " email atau password salah";
          });
      }
  }

  @override
  Widget build(BuildContext context) {
    
    String? validateEmail(String? value) {
      const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
          r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
          r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
          r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
          r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
          r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
          r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
      final regex = RegExp(pattern);

      return value!.isEmpty || !regex.hasMatch(value)
          ? 'Enter a valid email address'
          : null;
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF3B82F6),
        title: const Text(
          "Log In to Your Account",
          style: TextStyle(
              color: Colors.black, 
              fontFamily: 'Cardo',
              fontSize: 25,
              fontWeight: FontWeight.bold,),
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
              controller: emailController,
              validator: validateEmail,
              decoration: InputDecoration(hintText: "Enter Email")),  
              ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
                controller: passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(hintText: "Enter Password")),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () => login(emailController.text.toString(),
                  passwordController.text.toString()),
              child: Container(
                height: 40,
                width: 100,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Color(0xFF10B981),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(notif,
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