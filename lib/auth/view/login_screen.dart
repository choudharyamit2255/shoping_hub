

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shoping_hub/auth/models/user_admin.dart';
import 'package:shoping_hub/auth/provider/auth_provider.dart';
import 'package:shoping_hub/auth/view/sign_up_screen.dart';
import 'package:shoping_hub/core/app_util.dart';
import 'package:shoping_hub/dashboard/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

  void login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      try {
        final user = UserAdmin(
          username: usernameController.text,
          password: passwordController.text,
        );

        String? token = await authProvider.login(user);

        if (token != null) {
          Fluttertoast.showToast(msg: "Login Successfully",backgroundColor: Colors.green);
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return DashboardScreen();
          }));
        }
      } catch (e) {
        AppUtil.showToast("Login failed");
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
            "https://th.bing.com/th/id/OIP.5UdnWIxWkvqz7u5-L7pHEwHaEK?w=270&h=180&c=7&r=0&o=5&dpr=1.6&pid=1.7",),
              fit: BoxFit.cover
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,

          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Padding(
                  padding: const EdgeInsets.only(bottom: 48.0),
                  child: Text("Login..",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 55),),
                ),
                  TextFormField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'enter your username...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your username';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      hintText: 'enter your password...',suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isLoading ? null : login,
                    child: _isLoading
                        ? CircularProgressIndicator(color: Colors.white)
                        : Text('Log in'),
                  ),Row(
                    children: [
                      TextButton(onPressed: (){}, child: Text("Already exists have an account?",style: TextStyle(color: Colors.white),) ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUpScreen()),
                          );
                        },
                        child:Text("SignUp",style: TextStyle(color: Colors.blue))
                      ),
                    ],
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
