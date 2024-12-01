import 'package:flutter/material.dart';
import 'package:spotted/screens/Others_Profile.dart';
import 'package:spotted/screens/const/NavBar.dart';

class Likes extends StatelessWidget {
  final String username;
  final String desc;
  final String image;

  Likes({required this.username, required this.desc, required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(image),
      title: Text(username),
      subtitle: Text(desc),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OthersProfileScreen(username: username),
          ),
        );
      },
      trailing: IconButton(
        onPressed: () {
          // Add your logic here
        },
        icon: Icon(Icons.favorite),
        color: Colors.red,
      ),
    );
  }
}

class Vibes extends StatelessWidget {
  final String username;
  final String desc;
  final String image;

  Vibes({required this.username, required this.desc, required this.image});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
        title: Text(username),
        subtitle: Text(desc),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OthersProfileScreen(username: username),
            ),
          );
        },
        trailing: IconButton(
          onPressed: () {
            // Add your logic here
          },
          icon: Icon(Icons.favorite),
          color: Colors.red,
        ),
      ),
    );
  }
}

class Request extends StatelessWidget {
  final String username;
  final String desc;
  final String image;

  Request({required this.username, required this.desc, required this.image});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Material(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(image),
        ),
        title: Text(username),
        subtitle: Text(desc),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OthersProfileScreen(username: username),
            ),
          );
        },
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: Colors.amber, // Add the desired color here
          ),
          child: Text(
            "Accept",
            style: TextStyle(
              color: Colors.black,
              fontSize: screenWidth * 0.024,
              fontWeight: FontWeight.normal,
              fontFamily: 'Spartan',
            ),
          ),
        ),
      ),
    );
  }
}

class NotifsScreen extends StatefulWidget {
  @override
  _NotifsScreenState createState() => _NotifsScreenState();
}

class _NotifsScreenState extends State<NotifsScreen> {
  Likes likes = Likes(
    username: 'you',
    desc: 'liked your post',
    image: 'lib/images/bigcover.png',
  );

  Vibes vibes = Vibes(
    username: 'you',
    desc: 'vibed with your post',
    image: 'lib/images/bigcover.png',
  );

  Request requests = Request(
    username: 'you',
    desc: 'sent you a friend request',
    image: 'lib/images/bigcover.png',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileAppBar(
          header: 'Notifications',
          page: OthersProfileScreen(username: 'you'),
          theme: ThemeData()),
      backgroundColor: Colors.yellow, // Change background color as needed
      body: SingleChildScrollView(
        child: Column(
          children: [
            likes,
            vibes,
            requests,
          ],
        ),
      ),
    );
  }
}
