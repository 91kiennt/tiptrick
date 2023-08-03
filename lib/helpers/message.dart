class MessageAuth {
  static String errorEmptyEmail = 'Email không được để trống';
  static String errorInvalidEmail = 'Địa chỉ email không hợp lệ';

  static String errorEmptyPassword = 'Mật khẩu không được để trống';
  static String errorShortPassword = 'Mật khẩu phải có ít nhất 8 ký tự';
  static String errorNotmatchPassword =
      'Mật khẩu và mật khẩu xác nhận không khớp';

  static String errorLongName = 'Độ dài tên không được quá 27 ký tự';
  static String errorInvalidEmailMobile =
      'Địa chỉ email hoặc số điện thoại không hợp lệ';

  static String authForgetpassFail = 'Địa chỉ email không hợp lệ';
  static String authResetpassFail =
      'Đặt lại mật khẩu thất bại. Vui lòng kiểm tra lại thông tin';
  static String authResetpassDone = 'Đặt lại mật khẩu thành công';

  static String authSignupFail =
      'Đăng ký thất bại. Vui lòng kiểm tra lại thông tin';
  static String authSignupDone = 'Đăng ký thành công';

  static String authSigninFail =
      'Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin';
  static String authSigninDone = 'Đăng nhập thành công';

  static String authAvatarFail =
      'Cập nhật ảnh đại diện thất bại. Vui lòng thực hiện lại sau';
  static String authAvatarDone = 'Cập nhật ảnh đại diện thành công';
  static String authAvatarNull = 'Không upload được ảnh';

  static String authGoogleFail = 'Đăng nhập Google không thành công';
  static String authFacebookFail = 'Đăng nhập Facebook không thành công';
}
