import 'package:flutter/material.dart';
import 'package:pet_adoption_app_project/pages/favorit.dart';
import 'package:pet_adoption_app_project/pages/home.dart';
import 'package:pet_adoption_app_project/widgets/bottomNavigationBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedPage = 3;

  // Dummy profile data
  final Map<String, String> profileDetails = {
    'Name': 'John Doe',
    'Email': 'johndoe@example.com',
    'Phone': '+1234567890',
    'Location': 'New York, USA',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom title at the top
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Profile',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: profileDetails.length,
              itemBuilder: (context, index) {
                String key = profileDetails.keys.elementAt(index);
                return ListTile(
                  title: Text(key),
                  subtitle: Text(profileDetails[key]!),
                  leading: Icon(
                    Icons.person,
                    color: Colors.blue, // Adjust icon as needed
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedPage: selectedPage,
        onPageSelected: (index) {
          setState(() {
            selectedPage = index;
            if (index == 0) {
              // Navigate to Home Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            } else if (index == 1) {
              // Navigate to Favorites Page, pass the required favoriteCats list
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FavoritesPage(
                      favoriteCats: []), // Pass empty or actual list
                ),
              );
            }
          });
        },
      ),
    );
  }
}
