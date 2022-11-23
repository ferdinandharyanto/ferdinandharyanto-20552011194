import 'package:apk_1/view/login/login_view.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController dateInput = TextEditingController();

  @override
  void initState() {
    dateInput.text = "";
    super.initState();
  }

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
              "Register",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 50),
            TextFormField(
              decoration: const InputDecoration(labelText: "Enter Name"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              decoration: const InputDecoration(labelText: "Enter Email"),
            ),
            const SizedBox(height: 5),
            TextField(
              controller: dateInput,
              decoration: const InputDecoration(
                  icon: Icon(Icons.calendar_today),
                  labelText: "Enter Birth Date"),
              readOnly: true,
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100));
                if (pickedDate != null) {
                  // ignore: avoid_print
                  print(pickedDate);
                  String formattedDate =
                      DateFormat('yyyy-MM-dd').format(pickedDate);
                  // ignore: avoid_print
                  print(formattedDate);
                  setState(() {
                    dateInput.text = formattedDate;
                  });
                }
              },
            ),
            const SizedBox(height: 5),
            TextFormField(
              decoration: const InputDecoration(labelText: "Enter Username"),
            ),
            const SizedBox(height: 5),
            TextFormField(
              decoration: const InputDecoration(labelText: "Enter Password"),
              obscureText: true,
              enableSuggestions: false,
              autocorrect: false,
            ),
            const SizedBox(
              height: 60,
            ),
            TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xff6D28D9)),
                onPressed: () {
                  var snackBar = const SnackBar(
                      content: Text('Account has been created!'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  Navigator.pop(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const LoginPage())));
                },
                child: const Text(
                  "Register",
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
                const Text("Do you have account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => const LoginPage())));
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
