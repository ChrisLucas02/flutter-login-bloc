class LoginRepository {
  final String validUsername = "abc";
  final String validPassword = "bb";

  bool checkCredentials(String username, String password) {
    return username == validUsername && password == validPassword;
  }
}
