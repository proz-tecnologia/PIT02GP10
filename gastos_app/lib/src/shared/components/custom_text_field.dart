import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';
import 'package:gastos_app/src/core/app_themes.dart';
import 'package:gastos_app/src/shared/components/effectless_inkwell.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.label,
    this.filledColor = AppColors.secondaryColor,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.done,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.onTap,
    this.focusNode,
    this.readOnly = false,
  }) : super(key: key);

  final String label;
  final Color filledColor;

  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final Widget? suffixIcon;
  final FormFieldValidator<String>? validator;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final TextEditingController? controller;
  final bool readOnly;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode focusNode;
  late TextEditingController controller;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    controller = widget.controller ?? TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final focusedLabelStyle = Theme.of(context).textTheme.bodyText1?.copyWith(
          fontSize: 15,
          color: AppColors.fontColor,
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
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
                onTap: () {
                  setState(() {
                    if (focusNode.hasPrimaryFocus) focusNode.unfocus();
                  });
                  if (widget.onTap != null) widget.onTap!();
                },
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
                decoration: InputDecoration(
                  fillColor: widget.filledColor,
                  filled: true,
                  border: outlineBorder,
                  enabledBorder: outlineBorder,
                  focusedBorder: outlineBorder,
                  suffixIcon: widget.suffixIcon,
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
      ),
    );
  }
}
