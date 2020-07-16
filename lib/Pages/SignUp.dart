import 'package:flutter/material.dart';
import 'package:project_work_atul/Pages/LoginPage.dart';

import 'package:project_work_atul/common/loading.dart';
import 'package:project_work_atul/provider/userProvider.dart';
import 'package:provider/provider.dart';
import '../db/Users.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  UserServices _userServices = UserServices();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _nameText = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();
  String gender;
  String groupValue = "Male";
  bool hidePass = true;

  final _key = GlobalKey<ScaffoldState>();

  final _formKey = GlobalKey<FormState>();
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
                  color: Colors.grey[350].withOpacity(0.2),
                  child: Image.asset('images/BakkiicookiiLogo.png',
                      width: 200, height: 200)),
              Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Container(
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
                                          controller: _nameText,
                                          decoration: InputDecoration(
                                              hintText: "Name",
                                              icon: Icon(Icons.person),
                                              border: InputBorder.none),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "The Name field cannot be empty";
                                            }
                                            return null;
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
                                          controller: _email,
                                          decoration: InputDecoration(
                                              hintText: "Email",
                                              icon: Icon(Icons.alternate_email),
                                              border: InputBorder.none),
                                          // ignore: missing_return
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
                                    color: Colors.grey.withOpacity(0.7),
                                    elevation: 0.0,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 12.0),
                                      child: ListTile(
                                        title: TextFormField(
                                          controller: _confirmPassword,
                                          obscureText: hidePass,
                                          decoration: InputDecoration(
                                              hintText: "Confirm Password",
                                              icon: Icon(Icons.lock),
                                              border: InputBorder.none),
                                          validator: (value) {
                                            if (value.isEmpty) {
                                              return "The Password field cannot be empty";
                                            } else if (value.length < 6) {
                                              return "The password has to be atlaeast 6 character";
                                            } else if (_password.text !=
                                                value) {
                                              return "The password did not match";
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
                                              if (!await user.signUp(
                                                  _nameText.text,
                                                  _email.text,
                                                  _password.text)) {
                                                _key.currentState.showSnackBar(
                                                    SnackBar(
                                                        content: Text(
                                                            "Sign Up Failed")));
                                              }
                                            }
                                          },
                                          minWidth:
                                              MediaQuery.of(context).size.width,
                                          child: Text(
                                            "Sign Up",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          )),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Login()));
                                    },
                                    child: Text(
                                      "Already Registered ? Login",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Or Sign Up With",
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
