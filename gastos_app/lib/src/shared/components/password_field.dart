import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_themes.dart';
import 'package:gastos_app/src/shared/components/effectless_inkwell.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.label,
    required this.isPasswordVisible,
    this.filledColor = AppColors.secondaryColor,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.suffixIcon,
    this.validator,
    this.onFieldSubmitted,
    this.focusNode,
    this.controller,
    this.readOnly = false,
    this.inputFormatters,
  }) : super(key: key);

  final String label;
  final Color filledColor;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final void Function(String)? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool readOnly;
  final List<TextInputFormatter>? inputFormatters;
  final bool isPasswordVisible;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  late FocusNode focusNode;
  late TextEditingController controller;
  late bool passwordHidden;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    controller = widget.controller ?? TextEditingController();
    passwordHidden = widget.isPasswordVisible;
  }

  @override
  Widget build(BuildContext context) {
    final focusedLabelStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.backgroundColor,
          fontWeight: FontWeight.w500,
        );

    final unfocusedLabelStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.backgroundColor,
          fontWeight: FontWeight.w500,
        );

    final valueTextStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.backgroundColor,
          fontWeight: FontWeight.w500,
        );

    final outlineBorder = OutlineInputBorder(
      borderRadius: AppThemes.defaultBorderRadius,
      borderSide: BorderSide(
        color: widget.filledColor,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          focusNode.hasPrimaryFocus || controller.text.isNotEmpty
              ? widget.label
              : "",
          style: focusedLabelStyle,
        ),
        const SizedBox(height: 2),
        Stack(
          children: [
            TextFormField(
              controller: controller,
              focusNode: focusNode,
              onChanged: (value) {
                if (value.isEmpty) setState(() {});
              },
              cursorColor: AppColors.backgroundColor,
              keyboardType: widget.textInputType,
              textInputAction: widget.textInputAction,
              validator: widget.validator,
              readOnly: widget.readOnly,
              style: valueTextStyle,
              inputFormatters: widget.inputFormatters,
              onFieldSubmitted: widget.onFieldSubmitted,
              obscureText: passwordHidden,
              decoration: InputDecoration(
                fillColor: widget.filledColor,
                filled: true,
                border: outlineBorder,
                enabledBorder: outlineBorder,
                focusedBorder: outlineBorder,
                suffixIcon: InkWell(
                  onTap: () {
                    setState(() {
                      passwordHidden = !passwordHidden;
                    });
                  },
                  child: passwordHidden
                      ? Icon(Icons.visibility)
                      : Icon(Icons.visibility_off_outlined),
                ),
                errorMaxLines: 1,
                errorStyle: focusedLabelStyle?.copyWith(
                  color: AppColors.errorColor,
                ),
                disabledBorder: outlineBorder.copyWith(
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                errorBorder: outlineBorder.copyWith(
                  borderSide: const BorderSide(
                    color: AppColors.errorColor,
                  ),
                ),
              ),
            ),
            if (!focusNode.hasPrimaryFocus && controller.text.isEmpty)
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                right: 0,
                child: EffectlessInkWell(
                  onTap: () {
                    setState(() {
                      if (!focusNode.hasPrimaryFocus) {
                        focusNode.requestFocus();
                      }
                    });
                  },
                  child: Center(
                    child: Text(
                      widget.label,
                      style: unfocusedLabelStyle,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
