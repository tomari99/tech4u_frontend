import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech4u/api/models/user_model.dart';

import 'package:tech4u/api/service/auth.dart';

// enum Auth {
//   signin,
//   signup,
// }

class AuthDialogBox extends StatefulWidget {
  bool? isSignup;
  AuthDialogBox({Key? key, this.isSignup}) : super(key: key);

  @override
  _AuthDialogBoxState createState() => _AuthDialogBoxState();
}

class _AuthDialogBoxState extends State<AuthDialogBox> {
  final AuthService authService = AuthService();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  late bool _isSame = true;
  late bool _isSuccess = false;
  late bool _hasError = false;
  late String _errorMessage = '';

  void signUpUser({required email, required password, required name}) {
    authService
        .signUpUser(
            user: User(
                userName: name,
                email: email,
                password: password,
                isAdmin: false),
            context: context)
        .then((response) {
      setState(() {
        _isSuccess = true;
      });
    }).catchError((error) {
      setState(() {
        _errorMessage = error;
        _isSuccess = false;
        _hasError = true;
      });
    });
  }

  void signInUser({required String email, required String password}) {
    authService.signInUser(email: email, password: password).then((res) {});
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Sign Up'),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ],
      ),
      content: SizedBox(
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your sign-in and sign-up form fields here, such as text fields for email and password
            // Example:\
            (widget.isSignup == true
                ? TextField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                  )
                : Container()),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            (widget.isSignup == true
                ? TextField(
                    controller: _confirmPass,
                    obscureText: true,
                    decoration:
                        const InputDecoration(labelText: 'Confirm Password'),
                  )
                : Container()),
            (_isSame
                ? Container()
                : const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      "Password must be the same",
                      style: TextStyle(color: Colors.red, fontSize: 13),
                    ),
                  )),

            (_hasError
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red, fontSize: 13),
                    ),
                  )
                : Container()),
            (_isSuccess
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        const Text(
                          "Account Created Successfully",
                          style: TextStyle(color: Colors.green, fontSize: 13),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            "log in now",
                            style: TextStyle(
                                color: Colors.lightBlue,
                                fontSize: 13,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  )
                : Container())
          ],
        ),
      ),
      actions: [
        TextButton(
            onPressed: () {
              // Handle sign-in functionality here
              String email = _emailController.text;
              String password = _passwordController.text;
              String name = _nameController.text;
              String confirmPass = _confirmPass.text;
              if (widget.isSignup == true) {
                if (password == confirmPass) {
                  setState(() {
                    _isSame = true;
                  });
                  signUpUser(email: email, password: password, name: name);
                  // Navigator.pop(context);
                } else {
                  setState(() {
                    _isSame = false;
                  });
                }
              } else {
                signInUser(email: email, password: password);
              }
              // Call sign-in API or perform necessary authentication logic
              // ...
              // Close the dialog
            },
            child: widget.isSignup == true
                ? const Text('Sign Up')
                : const Text('Log in')),
        // TextButton(
        //   onPressed: () {
        //     // Handle sign-up functionality here
        //     String email = _emailController.text;
        //     String password = _passwordController.text;
        //     // Call sign-up API or perform necessary authentication logic
        //     // ...
        //     // Close the dialog
        //     Navigator.pop(context);
        //   },
        //   child: Text('Sign Up'),
        // ),
      ],
    );
  }
}
