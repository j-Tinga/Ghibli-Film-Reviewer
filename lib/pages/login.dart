import 'package:cis2203_final_exam/mixins/ValidationMixin.dart';
import 'package:cis2203_final_exam/pages/MainPage.dart';
import 'package:cis2203_final_exam/widgets/CustomTextFormField.dart';
import 'package:cis2203_final_exam/widgets/PasswordField.dart';
import 'package:cis2203_final_exam/widgets/PrimaryButton.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static const String routeName = "login";
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with ValidationMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController userTextController = TextEditingController();
  final TextEditingController passwordTextController = TextEditingController();
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://i.pinimg.com/originals/86/4e/3a/864e3a57433b7731bb9b06482491f1ba.jpg",
                    ),
                    fit: BoxFit.cover,
                    colorFilter: new ColorFilter.mode(
                        Colors.black.withOpacity(0.2), BlendMode.dstATop),
                  ),
                ),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            "Ghibi",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 56,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "A Studio Ghibli Film Library",
                            style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          CustomTextFormField(
                            labelText: "Username",
                            hintText: "Enter Username",
                            iconData: Icons.person,
                            textEditingController: userTextController,
                            textInputType: TextInputType.emailAddress,
                            validation: validateUsername,
                          ),
                          SizedBox(height: 20.0),
                          PasswordField(
                              labelText: "Password",
                              hintText: "Enter your password",
                              textEditingController: passwordTextController,
                              onTap: setPasswordVisibility,
                              validation: validatePassword,
                              obscureText: obscureText),
                          SizedBox(
                            height: 20.0,
                          ),
                          PrimaryButton(
                              text: "Login",
                              iconData: Icons.login,
                              onPress: login),
                          SizedBox(
                            height: 20.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          )
                        ],
                      ),
                    ),
                  ),
                ))));
  }

  void login() {
    if (formKey.currentState!.validate()) {
      navsToMain(context);
    }
  }

  void setPasswordVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void navsToMain(BuildContext context) {
    Navigator.pushNamed(context, MainPage.routeName);
  }
}
