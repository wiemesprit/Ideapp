import 'package:flutter/material.dart';
import 'package:flutter_docker/main.dart';
import 'package:flutter_docker/screens/login_screen.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _State();
}

class _State extends State<SignUp> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 32),
              Container(
                alignment: Alignment.center,
                child: Hero(
                  tag: 'app-logo',
                  child: Container(
                      width: 164, child: Image.asset('assets/splash.png')),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  keyboardType: TextInputType.text,
                  controller: usernameController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              // textColor: Colors.white,
              // color: Colors.green,
              child: Text(
                'Register',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                print(usernameController.text);
                print(passwordController.text);
                print(emailController.text);

                if (usernameController.text.isBlank) {
                  Get.snackbar('Error', 'Please insert a username');
                  return;
                }
                if (passwordController.text.isBlank) {
                  Get.snackbar('Error', 'Please insert a password');
                  return;
                }
                if (!emailController.text.isEmail) {
                  Get.snackbar('Error', 'Please insert a valid email');
                  return;
                }

                final newUser = User(usernameController.text,
                    emailController.text, passwordController.text);

                MyApp.users.add(newUser);

                Get.back();
              },
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Already have an account?'),
                SizedBox(width: 6),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Login now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => Get.back(),
                )
              ],
            ),
          ),
          SizedBox(height: 2),
        ],
      ),
    );
  }
}
