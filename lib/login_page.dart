import 'package:assignment_twenty/home_page.dart';
import 'package:assignment_twenty/storage_utils.dart';
import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final _key = GlobalKey<FormState>();

  TextEditingController nameClt = TextEditingController();
  TextEditingController emailClt = TextEditingController();
  TextEditingController passwordClt = TextEditingController();

  bool secureText = true;

  final brownColor = Colors.brown;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Registration",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: brownColor,
        centerTitle: true,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15.0),
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _key,
            child: Card(
              elevation: 3.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: brownColor,
                      child: Icon(
                        Icons.person,
                        size: 40.0,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: nameClt,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your name",
                          contentPadding: EdgeInsets.only(
                            left: 15,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Empty Field";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: emailClt,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter your Email",
                          contentPadding: EdgeInsets.only(
                            left: 15,
                          ),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Empty Field";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[350],
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextFormField(
                        controller: passwordClt,
                        obscureText: secureText,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter your Password",
                            contentPadding: EdgeInsets.only(
                              left: 15,
                              top: 15,
                            ),
                            suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  // passwordClt.clear();
                                  secureText = !secureText;
                                });
                              },
                              child: Icon(
                                secureText
                                    ? Icons.remove_red_eye_outlined
                                    : Icons.remove_red_eye,
                                color: brownColor,
                              ),
                            )),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Empty Field";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            _key.currentState!.save();
                            StorageUtils.setLoginData(false);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => HomePage(),
                              ),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: brownColor,
                        ),
                        child: Text(
                          "Registration",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
