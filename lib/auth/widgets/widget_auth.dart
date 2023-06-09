import 'package:tiptrick_game/auth/_auth_export.dart';

Widget aFormLabel(String title) {
  return Container(
    margin: const EdgeInsets.only(top: 8),
    alignment: Alignment.centerLeft,
    child: Text(
      title,
      style: const TextStyle(
          fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
    ),
  );
}

Widget aFormButton(String title, VoidCallback onTap) {
  return Container(
    margin: const EdgeInsets.only(top: 8),
    alignment: Alignment.center,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              padding: const EdgeInsets.all(16.0),
              textStyle: const TextStyle(fontSize: 20),
            ),
            onPressed: onTap,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
    {bool isPassword = false, bool isEmail = false}) {
  return Container(
    margin: const EdgeInsets.only(top: 8),
    child: TextField(
      controller: controller,
      keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.normal),
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 16),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: Colors.blue),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      ),
    ),
  );
}
