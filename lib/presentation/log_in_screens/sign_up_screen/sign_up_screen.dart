import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:session1/presentation/log_in_screens/common_text_fields/common_text_field.dart';
import 'package:session1/presentation/log_in_screens/common_text_fields/email_text_field.dart';
import 'package:session1/presentation/log_in_screens/common_text_fields/password_text_field.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 78, 24, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Create an account',
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
                          'Complete the sign up process to get started',
                          style: TextStyle(
                            color: Color.fromARGB(255, 167, 167, 167),
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            fontFamily: 'Roboto'
                          ),
                        ),
                      ),
                      const CommonTextField(labelText: 'Full name', hintText: 'Ivanov Ivan'),
                      const CommonTextField(labelText: 'Phone number', hintText: '+7(999)999-99-99'),
                      const EmailTextField(labelText: 'Email Address', hintText: '***********@mail.com'),
                      const PasswordTextField(labelText: 'Password', hintText: '**********'),
                      const PasswordTextField(labelText: 'Confirm Password', hintText: '**********'),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 14,
                              height: 14,
                              child: Checkbox(

                                value: isChecked, 
                                activeColor: const Color.fromARGB(255, 5, 95, 250),
                                side: const BorderSide(color: Color.fromARGB(255, 0, 108, 236)),
                                onChanged: (newBool){
                                  setState(() {
                                    isChecked = newBool;
                                  });
                                }
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: Row(
                                children: [
                                  const Text(
                                    'By ticking this box, you agree to our',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 167, 167, 167),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Roboto'
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      
                                    },
                                    child: const Text(
                                      'Terms and conditions and private policy',
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        fontFamily: 'Roboto',
                                        color: Color.fromARGB(255, 197, 155, 29)
                                      )
                                    ),
                                  ),
                                  
                                ],
                              )
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), 
                ),
                
                 Padding(
            padding: const EdgeInsets.fromLTRB(24, 90, 24, 20),
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
                          
                        },
                        child: const Text(
                          ' Sign in',
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
            ),
          )
        ],
      ),
    );
  }
}