// The following code violates the Dependency Inversion Principle.
// Refactor the code to conform to the DIP.

class UserService {
  Database _database;
  
  UserService(this._database);
  
  void registerUser(String username, String password) {
    // Code to register a new user in the database
    _database.saveUser(username, password);
  }
}

class Database {
  void saveUser(String username, String password) {
    // Code to save the user to the database
  }
}
