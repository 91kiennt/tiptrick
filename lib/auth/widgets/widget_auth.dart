import 'package:tiptrick_game/auth/_auth_export.dart';

class AValidator {
  static bool validateEmail(String email) {
    String pattern =
        r'^(([^<>()[\],;:\s@\"]+(\.[^<>()[\],;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern);
    bool status = regExp.hasMatch(email);
    return status;
  }

  static bool validateMobile(String mobile) {
    String pattern = r'^(([+0|+84])?[0-9]{10,14})$';
    RegExp regExp = RegExp(pattern);
    bool status = regExp.hasMatch(mobile);
    return status;
  }
}

Widget aFormLabel(String title, {Color color = Colors.white}) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: TextStyle(fontSize: 16, color: color, fontWeight: FontWeight.bold),
    ),
  );
}

Widget aFormButton(String title, VoidCallback onTap) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    alignment: Alignment.center,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
                decoration: const BoxDecoration(color: Colors.transparent)),
          ),
          OutlinedButton(
            onPressed: onTap,
            child: Text(title,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget aFormForgotPassword(String title, VoidCallback onTap) {
  return Container(
    margin: const EdgeInsets.only(top: 16),
    alignment: Alignment.centerRight,
    child: GestureDetector(
      onTap: onTap,
      child: Text(
        title,
        style: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
  );
}

Widget aForm(GlobalKey<FormState> formKey, List<Widget> children) {
  return Form(
    key: formKey,
    child: Column(
      children: children,
    ),
  );
}

Widget aFormInput(String hint, TextEditingController controller,
    {bool isPassword = false,
    bool isEmail = false,
    bool isNumber = false,
    bool isRadius = false,
    Color color = Colors.white}) {
  double _radius = isRadius ? 20 : 4;
  return Container(
    margin: const EdgeInsets.only(top: 16),
    child: TextField(
      controller: controller,
      keyboardType: isEmail
          ? TextInputType.emailAddress
          : isNumber
              ? TextInputType.number
              : TextInputType.text,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal),
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: color, fontSize: 16),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(_radius)),
          borderSide: BorderSide(color: color),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(_radius)),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    ),
  );
}
