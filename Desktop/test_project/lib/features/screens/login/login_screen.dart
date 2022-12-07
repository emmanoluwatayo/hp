// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:test_project/features/main_navigation/main_navigation_screen.dart';
import 'package:test_project/features/screens/login/widgets/checkbox.dart';
import 'package:test_project/features/screens/login_number/login_num_screen.dart';
import 'package:test_project/features/utils/app_colors.dart';
import 'package:test_project/network/dio_client.dart';

import '../../widgets/widgets.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final dioClient = DioClient();
  var value = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Welcome Back!",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    "Michael",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 27,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 27,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          "Email",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.inputLabelColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textFielColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: TextFormInput2(
                            controller: emailController,
                            validator: (string) => null,
                            obscureText: false,
                            labelText: "Email",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 24),
                        child: Text(
                          "Password",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: AppColors.inputLabelColor),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.textFielColor),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: TextFormInput2(
                              controller: passwordController,
                              validator: (string) => null,
                              obscureText: false,
                              labelText: "password",
                              suffixIcon:
                                  Icon(Icons.visibility, color: Colors.grey)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              LabeledCheckbox(),
                              Text(
                                "Remember Login",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: AppColors.inputLabelColor),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14,
                                  color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 73,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 24, right: 24),
                      child: AuthButton(
                        text: "Login",
                        onPress: () async {
                          // var loginUser = await dioClient.createUser(
                          //     emailController.text, passwordController.text);

                          // print(loginUser);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainNavigationScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 70,
                      ),
                      child: Row(
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppColors.confirmationColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 53,
                    ),
                    Text(
                      "-or log in with-",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      height: 27,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUpNumber(),
                          ),
                        );
                      },
                      child: ContactDetailsContainer(
                          icon: Icons.call, text: "Phone Number"),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
