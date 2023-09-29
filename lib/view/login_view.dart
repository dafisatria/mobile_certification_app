import 'package:flutter/material.dart';

import 'package:mobile_certification_app/model/database.instance.dart';

import 'home_view.dart';

class LoginView extends StatefulWidget {
  String? newPassword;
  LoginView({
    Key? key,
    this.newPassword,
  }) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool isObscured = true;
  String password = 'user';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 70, 16, 0),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/cost.png',
                  height: 200,
                ),
                const Text(
                  'My Cash Book v1.0',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  controller: usernameController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Username',
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isObscured = !isObscured;
                            });
                          },
                          icon: Icon(Icons.visibility_off))),
                  obscureText: isObscured,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (widget.newPassword == null) {
                      if (usernameController.text == 'user' &&
                          passwordController.text == password) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(
                                password: password,
                              ),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Username atau password anda salah!',
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                        ));
                      }
                    } else {
                      if (usernameController.text == 'user' &&
                          passwordController.text == widget.newPassword) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeView(
                                password: password,
                              ),
                            ));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                            'Username atau password anda salah!',
                          ),
                          backgroundColor:
                              Theme.of(context).colorScheme.onSecondary,
                        ));
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(MediaQuery.of(context).size.width, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
