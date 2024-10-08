import 'package:flutter/material.dart';
import 'package:pet_adoption_app_project/models/cats_model.dart';
import 'package:pet_adoption_app_project/pages/home.dart';
import 'package:pet_adoption_app_project/widgets/bottomNavigationBar.dart';

class FavoritesPage extends StatefulWidget {
  final List<Cat> favoriteCats;

  const FavoritesPage({Key? key, required this.favoriteCats}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  int selectedPage = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Custom title at the top
          Container(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Favorites',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: widget.favoriteCats.isEmpty
                ? Center(child: Text('No favorite pets yet!'))
                : ListView.builder(
                    itemCount: widget.favoriteCats.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Image.asset(widget.favoriteCats[index].image),
                        title: Text(widget.favoriteCats[index].name),
                        subtitle: Text(
                            'Distance: ${widget.favoriteCats[index].distance} Km'),
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
              // Go to Home Page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),
              );
            }
          });
        },
      ),
    );
  }
}
