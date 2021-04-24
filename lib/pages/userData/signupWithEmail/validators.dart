class Validators {
  String validateName(String val) {
    if (val.isEmpty) {
      return "Name cannot be empty";
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
      return "Password cannot be empty";
    } else if (val.length < 8)
      return "Password be atleast 8 characters long";
    else if (password1 != password2) {
      return "Passwords should be equal";
    }
    return null;
  }
}
