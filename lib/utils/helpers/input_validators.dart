import 'package:get/get_utils/get_utils.dart';

class InputValidators {
  InputValidators._();

  static String? validateLogin(String? value) => (value != null && value.length >= 6) ? null : 'Login Invalide';

  static String? validateFirstname(String? value) => (value != null && value.length >= 2) ? null : 'Prénom Invalide';

  static String? validateLastname(String? value) => (value != null && value.length >= 2) ? null : 'Nom Invalide';

  static String? validateDate(String? value) => (value != null && value.split('/').length == 3) ? null : 'Date invalide';

  static String? validateEmail(String? value) => (value != null && GetUtils.isEmail(value)) ? null : 'Email invalide';

  static String? validatePassword(String? value) => (value != null && value.length > 7) ? null : 'Mot de passe invalide';

  static String? validatePasswordConfirmation(String? value, {required String password}) => validatePassword(password) == null
      ? (value == password)
          ? null
          : 'Mots de passe non correspondants'
      : null;

  static String? validateCIN(String? value) => (value != null && value.length == 8 && (value[0] == '0' || value[0] == '1'))
      ? null
      : 'Le n°CIN doit commencer par 0 ou 1 et doit contenir 8 chiffres';
}
