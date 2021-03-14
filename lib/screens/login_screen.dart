import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String name = "";
  bool changeBtn = false;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "assets/images/login_image.png",
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome $name",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 32.0,
              ),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter User Name",
                      labelText: "Username",
                    ),
                    onChanged: (val) => {
                      setState(() => {
                            name = val,
                          }),
                    },
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      labelText: "Password",
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    child: AnimatedContainer(
                      width: changeBtn ? 40 : 150,
                      height: 40,
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 500),
                      child: changeBtn
                          ? Icon(
                              Icons.done,
                              color: Colors.white,
                            )
                          : Text(
                              "Login",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(changeBtn ? 40 : 5),
                        color: Colors.deepPurple,
                      ),
                    ),
                    onTap: () async => {
                      setState(() => {
                            changeBtn = true,
                          }),
                      await Future.delayed(Duration(milliseconds: 500)),
                      Navigator.pushNamed(context, Routes.home),
                    },
                  )
                  // ElevatedButton(
                  //   onPressed: () => {
                  //     print("login pressed"),
                  //     Navigator.pushNamed(context, Routes.home)
                  //   },
                  //   child: Text("Login"),
                  //   style: TextButton.styleFrom(
                  //     minimumSize: Size(
                  //       150,
                  //       40,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
