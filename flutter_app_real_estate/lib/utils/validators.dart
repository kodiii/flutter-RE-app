class Validators {
  static String validateNotEmpty(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  static String validateNumber(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  static String validatePrice(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid price';
    }
    return null;
  }

  static String validateImage(List value) {
    if (value == null || value.isEmpty) {
      return 'Please upload at least one image';
    }
    return null;
  }
}