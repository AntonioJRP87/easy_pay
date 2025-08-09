import 'package:easy_pay/app/utils/reg_exp_values.dart';

extension ValidatorExtension on String {
  bool get isValidEmail {
    return RegExpValues.emailRegExp.hasMatch(this);
  }

}