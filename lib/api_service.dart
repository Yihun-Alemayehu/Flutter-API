import 'package:http/http.dart' as http;
import 'dart:convert';

class User {
  final Name name;
  final String email;
  final String picture;
  final String phone;
  final int age;
  final String city;
  final String state;
  final String country;

  const User({
    required this.city,
    required this.state,
    required this.country,
    required this.age,
    required this.phone,
    required this.name,
    required this.email,
    required this.picture,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      city: json['location']['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      age: json['dob']['age'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      picture: json['picture']['medium'] ?? '',
      name: Name.fromJson(
        json['name'],
      ),
    );
  }
}

class Name {
  final String first;
  final String last;

  const Name({
    required this.first,
    required this.last,
  });

  factory Name.fromJson(Map<String, dynamic> json) {
    return Name(
      first: json['first'] ?? '',
      last: json['last'] ?? '',
    );
  }
}

class UserService {
  Future<List<User>> getUsers() async {
    final response = await http
        .get(Uri.parse("https://randomuser.me/api/?results=50&seed=api"));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<User> users = [];

      for (var i = 0; i < data['results'].length; i++) {
        final entry = data['results'][i];
        users.add(User.fromJson(entry));
      }
      return users;
    } else {
      throw Exception('HTTP request failed... ');
    }
  }
}

class OtherServices {
  Future<List<User>> getServicer() async {
    final response = await http.get(
      Uri.parse('uri'),
    );

    if(response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final List<User> users = [];

      for(var i = 0; i< data['results'].length; i++) {
        final entry  = data['results'][i];
        users.add(entry);
      }
      return users;
    }else{
      throw Exception('Could not find');
    }
  }
}
