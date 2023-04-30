import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormatters{

  final phone = MaskTextInputFormatter(mask: '(##) ###-##-##', filter: {"#": RegExp(r'\d')}, type: MaskAutoCompletionType.lazy);
}