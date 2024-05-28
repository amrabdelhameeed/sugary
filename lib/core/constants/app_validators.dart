class AppValidators {
  static String? validatorOfName(String? value) {
    if ((value)!.isEmpty) {
      return 'please , Enter Your Name';
    }
    return null;
  }

  static String? validatorOfEmail(String? value) {
    if ((value)!.isEmpty) {
      return 'please , Enter Your Email';
    } else if (!RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$').hasMatch(value)) {
      return "please , Enter Correct Email";
    }
    return null;
  }

  static String? validatorOfPass(String? value) {
    {
      if ((value ?? "").isEmpty) {
        return 'please , Enter Your Password';
      } else if (((value ?? "").length) < 8) {
        return 'please , Password Must be 8 Character AT Least';
      }
      return null;
    }
  }

  static String? validatorOfConfirmPass(String? value, String confirmation) {
    if ((value ?? '').isEmpty) {
      return 'please , Enter Your Confirm Password';
    } else if (confirmation != value) {
      return "confirmation password must be the same as password";
    }
    return null;
  }
}
