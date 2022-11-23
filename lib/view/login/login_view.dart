import 'package:apk_1/view/register/register_view.dart';
import 'package:flutter/material.dart';
import 'package:apk_1/view/dashboard/dashboard_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      // backgroundColor: [Color(0xff4338CA), Color(0xff6D28D9)],
      body: Container(
        padding: const EdgeInsets.all(40),
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              "Welcome to MyApp!",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 50),
            TextFormField(
              decoration: const InputDecoration(labelText: "Enter Username"),
            ),
            const SizedBox(height: 15),
            TextFormField(
              decoration: const InputDecoration(labelText: "Enter Password"),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff6D28D9)),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const DashboardPage())));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xffffffff),
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have any account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const RegisterPage())));
                  },
                  child: const Text("Click Here!"),
                )
              ],
            )
          ],
        )),
      ),
    );
  }
}
