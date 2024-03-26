import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:session1/presentation/log_in_screens/common_text_fields/email_text_field.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 155, 24, 0),
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
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: EmailTextField(labelText: 'Email Address', hintText: '***********@mail.com'),
            ),
            Padding(
            padding: const EdgeInsets.only(top: 50),
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
                      'Send OTP',
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
                        'Remebmer password? Back to',
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
          ],
        ),
      ),
    ])));
  }
}