import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/theme/theme.dart';

class AppTextFieldInput extends StatefulWidget {
  final String? label;
  final String hintText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const AppTextFieldInput({
    super.key,
    this.label,
    required this.hintText,
    this.obscureText = false,
    this.controller,
    this.textInputAction,
    this.validator,
    this.suffixIcon,
  });

  @override
  State<AppTextFieldInput> createState() => _AppTextFieldInputState();
}

class _AppTextFieldInputState extends State<AppTextFieldInput> {
  final node = FocusNode();
  var hasfocus = false.obs;
  var hide = false.obs;

  @override
  void initState() {
    hide.value = widget.obscureText;
    node.addListener(() {
      hasfocus.value = node.hasFocus;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
          colorScheme:
              ThemeData().colorScheme.copyWith(primary: AppTheme.primaryColor)),
      child: Obx(
        () => TextFormField(
          focusNode: node,
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          style: const TextStyle(fontSize: 14),
          validator: widget.validator,
          obscureText: hide.value,
          decoration: AppTheme.textFieldInputDecoration.copyWith(
            counterText: "",
            contentPadding: const EdgeInsets.symmetric(
              vertical: 14,
              horizontal: 14,
            ),
            labelText: widget.label,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: AppTheme.capColor,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
            suffixIcon: widget.obscureText ? seeTextIcon() : widget.suffixIcon,
          ),
        ),
      ),
    );
  }

  Widget seeTextIcon() {
    return Obx(
      () => IconButton(
        onPressed: () => hide.value = !hide.value,
        icon: Icon(
          hide.value ? Icons.visibility_off_outlined : Icons.visibility,
          color: hasfocus.value ? AppTheme.primaryColor : AppTheme.capColor,
        ),
      ),
    );
  }
}
