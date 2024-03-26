import 'package:flutter/material.dart';

class EmailTextField extends StatefulWidget {
  const EmailTextField({
    super.key, required this.labelText, required this.hintText,
  });

  final String labelText;
  final String hintText;

  @override
  State<EmailTextField> createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  final TextEditingController _textController = TextEditingController();
  bool _isValid = true; // Переменная для хранения состояния валидности email

  @override
  void initState() {
    super.initState();
    _textController.addListener(_validateEmail);
  }

  @override
  void dispose() {
    _textController.removeListener(_validateEmail);
    _textController.dispose();
    super.dispose();
  }

  void _validateEmail() {
    final pattern = RegExp(r'^[a-z0-9]+@[a-z0-9]+\.[ru]+$');
    setState(() {
      _isValid = pattern.hasMatch(_textController.text);
    });
  }

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
              fontFamily: 'Roboto',
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 44,
            child: TextFormField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: Color.fromARGB(255, 167, 167, 167),
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  fontFamily: 'Roboto',
                ),
                // Изменяем цвет границы в зависимости от валидности введенного email
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: _isValid ? Colors.grey : Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _isValid ? Colors.grey : Colors.red),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: _isValid ? Colors.blue : Colors.red),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

