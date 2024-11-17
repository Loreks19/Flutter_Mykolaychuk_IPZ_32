class ValidationService {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле Email обов’язкове для заповнення';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Введіть коректний Email';
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Поле Password обов’язкове для заповнення';
    }
    if (value.length < 7) {
      return 'Пароль повинен містити не менше 7 символів';
    }
    return null;
  }

  static String? validateRequiredField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Поле $fieldName обов’язкове для заповнення';
    }
    return null;
  }
}