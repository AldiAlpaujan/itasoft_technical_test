import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:itasoft_technical_test/theme/theme.dart';

class AppTextFieldInput extends StatefulWidget {
  final String label;
  final String hintText;
  final TextInputAction? textInputAction;
  final TextEditingController? controller;
  final bool isDropDown;
  final bool isArea;
  final bool readOnly;
  final bool numberOnly;
  final bool obscureText;
  final bool isCurrency;
  final bool? enabled;
  final int? maxLength;
  final String? dropDownInitialValue;
  final Widget? preffixIcon;
  final Widget? suffixIcon;
  final List<String>? dropDownItems;
  final Function()? onTap;
  final Function(String)? onChanged;
  final Function(double)? onCurrencyChanged;
  final String? Function(String?)? validator;

  const AppTextFieldInput({
    super.key,
    required this.label,
    required this.hintText,
    this.isArea = false,
    this.readOnly = false,
    this.numberOnly = false,
    this.isDropDown = false,
    this.isCurrency = false,
    this.obscureText = false,
    this.controller,
    this.textInputAction,
    this.onTap,
    this.dropDownItems,
    this.validator,
    this.suffixIcon,
    this.onCurrencyChanged,
    this.enabled,
    this.onChanged,
    this.dropDownInitialValue,
    this.preffixIcon,
    this.maxLength,
  });

  @override
  State<AppTextFieldInput> createState() => _AppTextFieldInputState();
}

class _AppTextFieldInputState extends State<AppTextFieldInput> {
  final node = FocusNode();
  var hasfocus = false.obs;
  var hide = false.obs;
  var dropDownValue = ''.obs;

  @override
  void initState() {
    dropDownValue.value = widget.dropDownInitialValue ?? '';
    hide.value = widget.obscureText;
    node.addListener(() {
      hasfocus.value = node.hasFocus;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            widget.label,
            style: TextStyle(
              fontSize: 14,
              color: widget.enabled ?? true
                  ? AppTheme.titleColor
                  : AppTheme.capColor,
            ),
          ),
        ),
        Theme(
          data: ThemeData().copyWith(
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: AppTheme.primaryColor)),
          child: Obx(
            () => TextFormField(
              onTap: widget.onTap,
              focusNode: node,
              readOnly: widget.readOnly,
              controller: widget.controller,
              textInputAction: widget.textInputAction,
              style: const TextStyle(fontSize: 14),
              maxLength: widget.maxLength,
              maxLines: widget.isArea ? 5 : 1,
              validator: widget.validator,
              enabled: widget.enabled,
              obscureText: hide.value,
              textAlignVertical: widget.suffixIcon != null
                  ? TextAlignVertical.center
                  : TextAlignVertical.bottom,
              keyboardType: widget.numberOnly || widget.isCurrency
                  ? TextInputType.number
                  : null,
              inputFormatters: [
                if (widget.numberOnly) FilteringTextInputFormatter.digitsOnly,
              ],
              decoration: AppTheme.textFieldInputDecoration.copyWith(
                counterText: "",
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 14,
                ),
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: AppTheme.capColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                prefixIcon: widget.preffixIcon,
                suffixIcon:
                    widget.obscureText ? seeTextIcon() : widget.suffixIcon,
              ),
            ),
          ),
        ),
      ],
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
