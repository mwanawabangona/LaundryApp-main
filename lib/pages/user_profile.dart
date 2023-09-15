import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class userProfile extends StatefulWidget {
  const userProfile({super.key});

  @override
  State<userProfile> createState() => _userProfileState();
}

class _userProfileState extends State<userProfile> {
  late String logout;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/chappaModel.png'),
            ),
            title: Text(
              'John Doe',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text('John Doe', style: TextStyle(fontSize: 15)),
            trailing: Icon(Icons.edit),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('My Profile'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.location_on),
            title: Text('My Address'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Privacy Policy'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.safety_check),
            title: Text('Terms and Conditions'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.call),
            title: Text('Contact Us'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          GestureDetector(
            child: ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              trailing: Icon(Icons.arrow_forward_ios),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
          ),
        ]),
      ),
    );
  }
}
