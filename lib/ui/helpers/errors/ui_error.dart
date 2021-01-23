import '../helpers.dart';

enum UIError {
  requiredField,
  invalidField,
  unexpected,
}

extension UIErrorExtension on UIError {
  String get description {
    switch (this) {
      case UIError.requiredField:
        return R.string.msgRequiredField;
      case UIError.invalidField:
        return R.string.msgInvalidField;
      default:
        return R.string.msgUnexpectedError;
    }
  }
}
