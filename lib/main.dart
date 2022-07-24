import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Validation',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: const MyHomePage(title: 'Validation Ui'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  late String _email, _phonenumber;
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();

  late FocusNode _focusNodeName;
  late FocusNode _focusNodeEmail;
  late FocusNode _focusNodeMobileNumber;
  late FocusNode _focusNodePassword;
  late FocusNode _focusNodeConfirmPassword;

  void _valid() {
    if (globalKey.currentState!.validate()) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('correct validation')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('validation failled')));
    }
  }

  @override
  void initState() {
    _focusNodeName = FocusNode();
    _focusNodeEmail = FocusNode();
    _focusNodeMobileNumber = FocusNode();
    _focusNodePassword = FocusNode();
    _focusNodeConfirmPassword = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _focusNodeName.dispose();
    _focusNodeEmail.dispose();
    _focusNodeMobileNumber.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Spacer(
                flex: 3,
              ),
              // textfield Name
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    Expanded(
                        flex: 80,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Name';
                            }
                            return null;
                          },
                          focusNode: _focusNodeName,
                          keyboardType: TextInputType.name,
                          textCapitalization: TextCapitalization.sentences,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 1),
                          textDirection: TextDirection.ltr,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.pink),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'User Name',
                            labelStyle: TextStyle(color: Colors.pink),
                            hintText: 'Enter User Name',
                            hintStyle: TextStyle(color: Colors.deepOrange),
                            prefixIcon: Icon(
                              Icons.account_circle,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                        )),
                    const Spacer(
                      flex: 10,
                    )
                  ],
                ),
              ),
              // textfield Email
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    Expanded(
                        flex: 80,
                        child: TextFormField(
                          maxLength: 40,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Email';
                            }
                            if (!RegExp(
                                    '^[a-zA-Z0-9.a-zA-Z0-9.!#%&*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
                                .hasMatch(value)) {
                              return 'Please Enter valid Email';
                            }
                            return null;
                          },
                          onSaved: (String? email) {
                            _email = email!;
                          },
                          focusNode: _focusNodeEmail,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.sentences,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 1),
                          textDirection: TextDirection.ltr,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.pink),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'User Email',
                            labelStyle: TextStyle(color: Colors.pink),
                            hintText: 'Enter User Email',
                            hintStyle: TextStyle(color: Colors.deepOrange),
                            prefixIcon: Icon(
                              Icons.email_sharp,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                        )),
                    const Spacer(
                      flex: 10,
                    )
                  ],
                ),
              ),
              // textfield mobile number
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    Expanded(
                        flex: 80,
                        child: TextFormField(
                          focusNode: _focusNodeMobileNumber,
                          keyboardType: TextInputType.number,
                          maxLength: 11,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter PhoneNumber';
                            }
                            if (value.length < 11) {
                              return 'Please Enter valid PhoneNumber';
                            }
                            return null;
                          },
                          onSaved: (String? phone) {
                            _phonenumber = phone!;
                          },
                          textCapitalization: TextCapitalization.sentences,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 1),
                          textDirection: TextDirection.ltr,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.pink),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'User Mobile',
                            labelStyle: TextStyle(color: Colors.pink),
                            hintText: 'Enter User MobileNumber',
                            hintStyle: TextStyle(color: Colors.deepOrange),
                            prefixIcon: Icon(
                              Icons.phone_iphone_rounded,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                        )),
                    const Spacer(
                      flex: 10,
                    )
                  ],
                ),
              ),
              // textfield  password
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    Expanded(
                        flex: 80,
                        child: TextFormField(
                          validator: (value) {
                            int counterAlpha = 0;
                            int counterNumber = 0;
                            int counterSymbol = 0;
                            if (value!.length > 8) {
                              value.runes.forEach((int element) {
                                String char = String.fromCharCode(element);
                                if (char.contains(RegExp(r'[A-Z]')) ||
                                    char.contains(RegExp(r'[a-z]'))) {
                                  counterAlpha++;
                                } else if (char.contains(RegExp(r'[0-9]'))) {
                                  counterNumber++;
                                } else if (char.contains(
                                    RegExp(r'[@#!%^&*()=\|/?><-_$]'))) {
                                  counterSymbol++;
                                }
                              });
                              if (counterAlpha >= 2 &&
                                  counterNumber >= 2 &&
                                  counterSymbol >= 2) {
                                return null;
                              } else {
                                return 'Please enter stronge password';
                              }
                            }
                            return 'Password length should be greater or equal 8';
                          },
                          controller: _password,
                          focusNode: _focusNodePassword,
                          keyboardType: TextInputType.multiline,
                          obscureText: true,
                          textCapitalization: TextCapitalization.sentences,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 1),
                          textDirection: TextDirection.ltr,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.pink),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'User Password',
                            labelStyle: TextStyle(color: Colors.pink),
                            hintText: 'Enter User Password',
                            suffixIcon: Icon(Icons.remove_red_eye),
                            hintStyle: TextStyle(color: Colors.deepOrange),
                            prefixIcon: Icon(
                              Icons.lock_outlined,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                        )),
                    const Spacer(
                      flex: 10,
                    )
                  ],
                ),
              ),
              // textfield confirm password
              Expanded(
                flex: 15,
                child: Row(
                  children: [
                    const Spacer(
                      flex: 10,
                    ),
                    // textfield confirm password
                    Expanded(
                        flex: 80,
                        child: TextFormField(
                          obscureText: true,
                          controller: _confirmpassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter password Again';
                            }
                            if (_password.text != _confirmpassword.text) {
                              return 'Password Do Not Match';
                            }
                            return null;
                          },
                          focusNode: _focusNodeConfirmPassword,
                          keyboardType: TextInputType.emailAddress,
                          textCapitalization: TextCapitalization.sentences,
                          style: const TextStyle(
                              color: Colors.deepPurple,
                              fontSize: 20,
                              fontStyle: FontStyle.italic,
                              letterSpacing: 1),
                          textDirection: TextDirection.ltr,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 3, color: Colors.pink),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            labelText: 'Confirm Password',
                            labelStyle: TextStyle(color: Colors.pink),
                            hintText: 'Enter User confirm password',
                            hintStyle: TextStyle(color: Colors.deepOrange),
                            prefixIcon: Icon(
                              Icons.password_sharp,
                              size: 20,
                              color: Colors.red,
                            ),
                          ),
                        )),
                    const Spacer(
                      flex: 10,
                    )
                  ],
                ),
              ),
              // button container
              Expanded(
                  flex: 15,
                  child: Row(
                    children: [
                      const Spacer(
                        flex: 20,
                      ),
                      // button submitt
                      Expanded(
                        flex: 60,
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: OutlinedButton(
                              onPressed: _valid,
                              child: const Text('Submit',
                                  style: TextStyle(
                                      color: Colors.indigo, fontSize: 40))),
                        ),
                      ),
                      const Spacer(
                        flex: 20,
                      )
                    ],
                  )),
              const Spacer(
                flex: 7,
              )
            ],
          ),
        ),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _focusNodeName.requestFocus();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
