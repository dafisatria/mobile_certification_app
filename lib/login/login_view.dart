import 'package:flutter/material.dart';
import 'package:mobile_certification_app/home/home_view.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
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
                  TextFormField(
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
                  TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      hintText: 'Password',
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeView(),
                          ));
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
      ),
    );
  }
}
