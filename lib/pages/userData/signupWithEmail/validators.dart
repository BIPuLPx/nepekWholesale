
class Validators {
  String validateName(String val) {
    if (val.isEmpty) {
      return "Name shouldnot be empty";
    }
    return null;
  }

  String validateEmail(String value) {
    if (value == '') {
      return 'Email cannot be empty';
    } else if (RegExp(r'^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$')
            .hasMatch(value) ==
        false) {
      return 'Please enter valid email address';
    } else {
      return null;
    }
  }

  String validatePassword(String val, String password1, String password2) {
    if (val.isEmpty) {
      return "Password Cannot Be empty";
    } else if (password1 != password2) {
      return "Passwords should be equal";
    }
    return null;
  }
}
