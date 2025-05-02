import 'package:flutter/material.dart';
import 'package:travel_connector/core/color/app_colors.dart';

class CustomTextLabeledForm extends StatefulWidget {
  final String title;
  final String hint;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const CustomTextLabeledForm({
    super.key,
    required this.title,
    required this.hint,
    required this.isPassword,
    required this.controller,
    this.validator,
  });

  @override
  State<CustomTextLabeledForm> createState() => _CustomTextLabeledFormState();
}

class _CustomTextLabeledFormState extends State<CustomTextLabeledForm> {
  bool _isObscured = false;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    final theme = TextTheme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: theme.bodyLarge!.copyWith(
            color: AppColors.darkGrey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          obscureText: _isObscured,
          validator: widget.validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(244, 244, 244, 1),
            contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none),
            suffixIcon: widget.isPassword
                ? IconButton(
              icon: Icon(
                _isObscured ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
            )
                : null,
            hintText: widget.hint,
            hintStyle: TextStyle(
              color: Color.fromRGBO(187, 192, 201, 1),
            ),
          ),
        ),
      ],
    );
  }
}