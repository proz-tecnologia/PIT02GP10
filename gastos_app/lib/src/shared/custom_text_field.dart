import 'package:flutter/material.dart';
import 'package:gastos_app/src/core/app_colors.dart';

class CostumTextField extends StatefulWidget {
  const CostumTextField({
    Key? key,
    this.label,
    required this.filledColor,
    this.suffixIcon,
  }) : super(key: key);

  final String? label;
  final Color ? filledColor;
  final Widget? suffixIcon;

  @override
  State<CostumTextField> createState() => _CostumTextFieldState();
}

class _CostumTextFieldState extends State<CostumTextField> {
  final BorderRadius _borderRadius =
      const BorderRadius.all(Radius.circular(20.0));

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            focusNode.hasFocus && widget.label != null
            ? Text(widget.label !) 
            : Text(""),
            Stack(
              children: [
                TextFormField(
                  focusNode: focusNode,
                  onTap: () {
                    setState(() {});
                    if (focusNode.hasFocus) focusNode.unfocus();
                  },
                  decoration: InputDecoration(
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: AppColors.fontColor,
                      ),
                      fillColor: AppColors.secondaryColor,
                      filled: true,
                      border: OutlineInputBorder(borderRadius: _borderRadius)),
                  keyboardType: TextInputType.name,
                ),
                if (!focusNode.hasFocus)
                  Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: GestureDetector(
                      onTap: () {
                        if (focusNode.hasFocus) focusNode.unfocus();
                      },
                      child: Center(child: Text(widget.label!)),
                    ),
                  ),
              ],
            ),
          ],
        )
    );
  }
}