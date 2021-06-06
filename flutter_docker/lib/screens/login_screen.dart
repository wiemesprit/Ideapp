import 'package:flutter/material.dart';
import 'package:flutter_docker/main.dart';
import 'package:get/get.dart';
import 'generated_app.dart';
import 'register_screen.dart';

class LoginPage extends StatefulWidget {
  final String appName;
  LoginPage(this.appName);
  @override
  State<StatefulWidget> createState() => new _State(appName);
}

class _State extends State<LoginPage> {
  final String appName;
  _State(this.appName);
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 32),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Hero(
                      tag: 'app-logo',
                      child: Container(
                          width: 164, child: Image.asset('assets/splash.png')),
                    ),
                    Text(
                      this.appName,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                child: TextField(
                  obscureText: true,
                  controller: passwordController,
                  decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock)),
                ),
              ),
              SizedBox(height: 4),
              Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.only(right: 18),
                child: TextButton(
                  onPressed: () {
                    //forgot password screen
                    // Get.to(() => ResetPw());
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text('Forgot Password?',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontWeight: FontWeight.w600)),
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
                'Login',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                print(nameController.text);
                print(passwordController.text);

                if (nameController.text.isBlank) {
                  print('Wrong nameController');
                  Get.snackbar('Error', 'Please insert a username');
                  return;
                }
                if (passwordController.text.isBlank) {
                  print('Wrong passwordController');
                  Get.snackbar('Error', 'Please insert a password');
                  return;
                }

                final result = MyApp.users.where((element) =>
                    (element.username == (nameController.text ?? '') ||
                        element.email == (nameController.text ?? '')) &&
                    element.pass == (passwordController.text ?? ''));

                if (result.isEmpty) {
                  Get.snackbar(
                    'Error',
                    'Invalid username/password',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                  return;
                }

                MyApp.currentUser = result.first;
                Get.off(() => GeneratedApp());
              },
            ),
          ),
          SizedBox(height: 4),
          Container(
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('No account yet?'),
                SizedBox(width: 6),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),
                  child: Text(
                    'Register now',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () => Get.to(() => SignUp()),
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
