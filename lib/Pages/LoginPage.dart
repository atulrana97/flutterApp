import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project_work_atul/common/loading.dart';
import '../provider/userProvider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './SignUp.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  SharedPreferences preferences;
  final _formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  bool hidePass = true;

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      body: user.status == Status.Authenticating
          ? Loading()
          : Stack(children: <Widget>[
              Image.asset(
                'images/backgroundforLogin.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                  alignment: Alignment.topCenter,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey[350].withOpacity(0.2),
                            blurRadius: 5.0)
                      ]),
                  child: Image.asset('images/BakkiicookiiLogo.png',
                      width: 200, height: 200)),
              Padding(
                padding: EdgeInsets.only(top: 200.0),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[350].withOpacity(0.2),
                              blurRadius: 5.0)
                        ]),
                    alignment: Alignment.center,
                    child: Center(
                        child: Form(
                            key: _formKey,
                            child: ListView(
                              children: <Widget>[
                                SizedBox(
                                  height: 40,
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey.withOpacity(0.7),
                                    elevation: 0.0,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          controller: _email,
                                          decoration: InputDecoration(
                                              hintText: "Email",
                                              icon: Icon(Icons.alternate_email),
                                              border: InputBorder.none),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              Pattern pattern =
                                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                              RegExp regex =
                                                  new RegExp(pattern);
                                              if (!regex.hasMatch(value))
                                                return 'Please make sure your email address is valid';
                                              else
                                                return null;
                                            }
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey.withOpacity(0.7),
                                    elevation: 0.0,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          controller: _password,
                                          obscureText: hidePass,
                                          decoration: InputDecoration(
                                              hintText: "Password",
                                              icon: Icon(Icons.lock),
                                              border: InputBorder.none),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "The Password field cannot be empty";
                                            } else if (value.length < 6) {
                                              return "The password has to be atlaeast 6 character";
                                            }
                                            return null;
                                          },
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(Icons.remove_red_eye),
                                          onPressed: () {
                                            setState(() {
                                              if (hidePass == true) {
                                                hidePass = false;
                                              } else {
                                                hidePass = true;
                                              }
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(
                                      14.0, 8.0, 14.0, 8.0),
                                  child: Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.deepOrange.withOpacity(0.8),
                                    elevation: 0.0,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: MaterialButton(
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              if (!await user.signIn(
                                                  _email.text,
                                                  _password.text)) {
                                                _key.currentState.showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            "Sign in Failed")));
                                              }
                                            }
                                          },
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            "Login",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )),
                                    ),
                                  ),
                                ),
                                Divider(color: Colors.white.withOpacity(0.5)),
                                Text(
                                  "Forgot Password",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15),
                                  textAlign: TextAlign.center,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => SignUp()));
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    "Or Sign In With",
                                    style: TextStyle(
                                        fontSize: 28, color: Colors.grey),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          14.0, 8.0, 14.0, 8.0),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Image.asset(
                                            'images/facebook_icon.png',
                                            width: 80),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          14.0, 8.0, 14.0, 8.0),
                                      child: MaterialButton(
                                        onPressed: () {},
                                        child: Image.asset(
                                            'images/google_icon.png',
                                            width: 60),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            )))),
              ),
            ]),
    );
  }
}
