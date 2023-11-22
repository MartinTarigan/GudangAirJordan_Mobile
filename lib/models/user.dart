List<User> userDb = [];
User loggedInUser = User(username: "Null", password: "Null");

class User {
  String username;
  String password;

  User({required this.username, required this.password});
}
