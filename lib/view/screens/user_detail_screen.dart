import 'package:flutter/material.dart';
import 'package:flutter09/db/sql_helper.dart';
import 'package:flutter09/main.dart';
import 'package:flutter09/model/response/user_list_response.dart';

class UserDetailScreen extends StatefulWidget {
  final UserResponse? userResponse;

  const UserDetailScreen({super.key, this.userResponse});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  int _currentIndex = 0;

  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: "Movie",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favourites"),
        ],
        onTap: _onItemTap,
        currentIndex: _currentIndex,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: [Movies(), FavouritesSection()],
            ),
          )
        ],
      ),
    );
  }

  void _onItemTap(int value) {
    setState(() {
      _currentIndex = value;
      _pageController.animateToPage(_currentIndex,
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    });
  }
}

class Movies extends StatefulWidget {
  const Movies({super.key});

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  List<MoviesModel> movieList = [
    MoviesModel(0, "Deadpool", "Adventure"),
    MoviesModel(1, "Inception", "Adventure"),
    MoviesModel(2, "Beetel", "Adventure"),
    MoviesModel(3, "Hell Boy", "Adventure"),
    MoviesModel(4, "Joker", "Adventure"),
    MoviesModel(5, "Platform", "Adventure"),
    MoviesModel(6, "Spider man", "Adventure"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            final movie = movieList[index];
            return ListTile(
              title: Text(movie.name),
              subtitle: Text(movie.description),
              leading: Icon(Icons.movie),
              trailing: IconButton(
                  onPressed: () {
                    movieProvider.insert(
                        Movie(movie.id, movie.name, movie.description, 0));
                  },
                  icon: Icon(Icons.favorite)),
            );
          }),
    );
  }
}

class FavouritesSection extends StatefulWidget {
  const FavouritesSection({super.key});

  @override
  State<FavouritesSection> createState() => _FavouritesSectionState();
}

class _FavouritesSectionState extends State<FavouritesSection> {
  List<Map<String, Object?>> movies = [];

  @override
  void initState() {
    _fetchFavourites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: movies.length,
          itemBuilder: (context, index) {
            final movie = movies[index];
            return ListTile(
              title: Text(movie["title"] as String),
              subtitle: Text(movie["description"] as String),
              leading: Icon(Icons.movie),
            );
          }),
    );
  }

  void _fetchFavourites() async {
    movies = await movieProvider.getMovies();
    setState(() {

    });
    print(movies);
  }
}

class MoviesModel {
  int id;
  String name;
  String description;

  MoviesModel(this.id, this.name, this.description);
}
