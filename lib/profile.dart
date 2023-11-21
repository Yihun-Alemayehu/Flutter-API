import 'package:api/api_service.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final User user;
  const Profile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name.first} ${user.name.last}'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Center(
              child: CircleAvatar(
            radius: 90,
            backgroundImage: NetworkImage(user.picture),
          )),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Name : ",
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                    children: [
                      TextSpan(
                        text: "${user.name.first} ${user.name.last}",
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: const Text("User Name"),
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 40,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                // dense: true,
                contentPadding: const EdgeInsets.all(10),
              ),
              ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Phone : ",
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                    children: [
                      TextSpan(
                        text: user.phone,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: const Text("User Phone"),
                leading: const Icon(
                  Icons.phone,
                  color: Colors.blue,
                  size: 40,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                // dense: true,
                contentPadding: const EdgeInsets.all(10),
              ),
              ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Age : ",
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                    children: [
                      TextSpan(
                        text: '${user.age}',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: const Text("User Age"),
                leading: const Icon(
                  Icons.person,
                  color: Colors.blue,
                  size: 40,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                // dense: true,
                contentPadding: const EdgeInsets.all(10),
              ),
              ListTile(
                title: Text.rich(
                  TextSpan(
                    text: "Address : ",
                    style: const TextStyle(
                      color: Colors.orange,
                    ),
                    children: [
                      TextSpan(
                        text: '${user.city} , ${user.country}',
                        style: const TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                subtitle: const Text("user address"),
                leading: const Icon(
                  Icons.home,
                  color: Colors.blue,
                  size: 40,
                ),
                trailing: const Icon(Icons.arrow_forward_ios),
                // dense: true,
                contentPadding: const EdgeInsets.all(10),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
