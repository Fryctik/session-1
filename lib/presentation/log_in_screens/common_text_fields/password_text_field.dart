import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key, required this.labelText, required this.hintText,
  });

  final String labelText;
  final String hintText;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {

  bool _isObscure = true;
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: const TextStyle(
              color: Color.fromARGB(255, 167, 167, 167),
              fontWeight: FontWeight.w500,
              fontSize: 14,
              fontFamily: 'Roboto'
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 44,
            child: TextField(
              controller: _textController,
              obscureText: _isObscure,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 167, 167, 167),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'Roboto'                
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 237, 58, 58))
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color:Color.fromARGB(255, 237, 58, 58))
                ),
                suffixIcon: IconButton(
                  icon: _isObscure ? const Icon(Icons.visibility_off, size: 14,) : const Icon(Icons.visibility, size: 14),
                  onPressed: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  }
                )
              ),
            ),
          )
        ]
      ),
    );
  }
}