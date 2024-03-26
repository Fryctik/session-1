import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:session1/presentation/log_in_screens/common_text_fields/email_text_field.dart';
import 'package:session1/presentation/log_in_screens/common_text_fields/password_text_field.dart';
import 'package:session1/presentation/routes/routes.dart';

@RoutePage()
class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {

  bool? isCheched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 155, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Welcome Back',
                      style: TextStyle(
                        color: Color.fromARGB(255, 58, 58, 58),
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                        fontFamily: 'Roboto'
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 3),
                      child: const Text(
                        'Fill in your email and password to continue',
                        style: TextStyle(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily: 'Roboto'
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    EmailTextField(labelText: 'Email Address', hintText: '***********@mail.com'),
                    PasswordTextField(labelText: 'Password', hintText: '**********'),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          side: const BorderSide(color: Color.fromARGB(255, 167, 167, 167)),
                          value: isCheched, 
                          activeColor: const Color.fromARGB(255, 5, 95, 250),
                          onChanged: (newBool) {
                            setState(() {
                              isCheched = newBool;
                            });
                          }
                        ),
                        const Text(
                          'Remember password',
                          style: TextStyle(
                            color: Color.fromARGB(255, 167, 167, 167),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto'
                          ),
                        )
                      ],
                    ),
                    InkWell(
                      onTap: (){
                        ForgotPasswordRoute();
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 95, 250),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto'
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

          
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 70),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 46,
                  child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 167, 167, 167),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))
                    ),
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Roboto'
                      ),
                    )
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Color.fromARGB(255, 167, 167, 167),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Roboto'
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.pushRoute(SignUpRoute());
                        },
                        child: const Text(
                          ' Sign Up',
                          style: TextStyle(
                            color: Color.fromARGB(255, 5, 95, 250),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Roboto'
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:  15).copyWith(bottom: 5),
                  child: const Text(
                    'or log in using',
                    style: TextStyle(
                      color: Color.fromARGB(255, 167, 167, 167),
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Roboto'
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Image.asset('assets/icons/google-icon.png'),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
