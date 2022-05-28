bool isValidPhone(String code, String number) {
  if (code == "+269" &&
      (number.toString().startsWith('3') ||
          number.toString().startsWith('4')) &&
      number.toString().length == 7) {
    return true;
  } else {
    return false;
  }
}

bool isValidateConfirmationCode(int code) {
  // Logique de la véfication du code
  return true;
}

bool isValideEnfant( String number) {
  if (!number.isEmpty) {
    return true;
  } else {
    return false;
  }
}
