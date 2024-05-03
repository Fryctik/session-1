import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class OtpVereficationScreen extends StatefulWidget {
  const OtpVereficationScreen({super.key});

  @override
  State<OtpVereficationScreen> createState() => _OtpVereficationScreenState();
}

class _OtpVereficationScreenState extends State<OtpVereficationScreen> {

  List<TextEditingController> _controllers = List.generate(6, (index) => TextEditingController());


  int _minutes = 1;
  int _seconds = 0;
  bool _isTimeExpired = false;
  late Timer _timer;

  void timer () {
    _isTimeExpired = false;
    _minutes = 1;
    _seconds = 0;
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        if (_minutes == 0 && _seconds == 0) {
          _timer.cancel();
          _isTimeExpired = true;
        } else if (_seconds == 0) {
          _minutes--;
          _seconds = 59;
        } else {
          _seconds--;
        }
      });
    });
  }

  @override
  void initState() {
    timer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String timerString = '${_minutes.toString()}:${_seconds.toString().padLeft(2, '0')}';
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 158, 24, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'OTP Verification',
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
                'Enter the 6 digit numbers sent to your email',
                style: TextStyle(
                  color: Color.fromARGB(255, 167, 167, 167),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'Roboto'
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(6, (index) {
                  return Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color.fromARGB(255, 167, 167, 167)),
                    ),
                    child: TextField(
                      controller: _controllers[index],
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        counterStyle: TextStyle(color: Colors.transparent),
                        contentPadding: EdgeInsets.symmetric(vertical: 5)
                      ),
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.transparent,
                      maxLength: 1,
                      onChanged: (value) {
                        if (value.isNotEmpty) {
                          FocusScope.of(context).nextFocus();
                        }
                      },
                    ),
                  );
                })
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'If you didn’t receive code, ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 167, 167, 167),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Roboto'
                    ),
                  ),
                  _isTimeExpired 
                  ? InkWell(
                    onTap: (){
                      timer();
                    },
                    child: const Text(
                      'resend',
                      style: TextStyle(
                        color: Color.fromARGB(255, 5, 96, 250),
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        fontFamily: 'Roboto'
                      ),
                    ),
                  )
                  : Text(
                    ' resend after $timerString',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 167, 167, 167),
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      fontFamily: 'Roboto'
                    ),
                  )
                  
                ],
              )
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