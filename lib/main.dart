import 'package:api/api_service.dart';
import 'package:api/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    home: const HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<User>> futureUsers;

  @override
  void initState() {
    super.initState();
    futureUsers = UserService().getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          var users = await UserService().getUsers();
          setState(() {
            futureUsers = Future.value(users);
          });
        },
        child: FutureBuilder(
          future: futureUsers,
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    User user = snapshot.data![index];
                    return ListTile(
                      title: Text(user.email),
                      subtitle: Text(user.name.first),
                      trailing: const Icon(Icons.arrow_forward_ios_outlined),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Profile(
                                user: user,
                              ),
                            ));
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Colors.black26,
                    );
                  },
                  itemCount: snapshot.data!.length);
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
