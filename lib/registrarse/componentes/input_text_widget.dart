import './input_widget.dart';
import 'package:flutter/material.dart';

class InputTextWidget extends StatefulWidget {
  const InputTextWidget({super.key, required this.hintText});
  final String hintText;

  @override
  State<InputTextWidget> createState() => _InputTextWidgetState();
}

class _InputTextWidgetState extends State<InputTextWidget> {
  bool isVisible = false;
  bool isPasswordLongEnough = false;
  bool isPasswordEqual = false;
  @override
  Widget build(BuildContext context) {
    return InputWidget(
      hintText: widget.hintText,
      inputTextType: TextInputType.name,
      appendComponent: Text(''),
    );
  }
}
