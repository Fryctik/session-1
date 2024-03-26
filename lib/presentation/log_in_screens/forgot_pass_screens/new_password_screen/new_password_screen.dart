import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:session1/presentation/log_in_screens/common_text_fields/password_text_field.dart';


@RoutePage()
class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 155, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Password',
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
                      'Enter new password',
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
            
            const Column(
                children: [
                  PasswordTextField(labelText: 'Password', hintText: '**********'),
                  PasswordTextField(labelText: 'Confirm Password', hintText: '**********')
                ],
              ),
            
            Container(
                margin: const EdgeInsets.only(top: 80),
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
            
          ],
        ),
      ),
    );
  }
}