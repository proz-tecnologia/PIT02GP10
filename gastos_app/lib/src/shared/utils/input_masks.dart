import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AppInputMasks {
  static final phoneMask = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {"#": RegExp(r'[0-9]')},
  );

  static final tokenMask = MaskTextInputFormatter(
    mask: '######',
    filter: {"#": RegExp(r'[0-9]')},
  );
}
