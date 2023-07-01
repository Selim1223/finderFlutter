// ignore: file_names
import 'package:finder_flutter/bachelorDetails.dart';
import 'package:finder_flutter/provider/bachelorFavoritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BachelorsFavorites extends StatefulWidget {
  const BachelorsFavorites({super.key});

  @override
  State<BachelorsFavorites> createState() => _BachelorsFavoritesState();
}

class _BachelorsFavoritesState extends State<BachelorsFavorites> {
  bool isGridMode = false;

  @override
  Widget build(BuildContext context) {
    void clearFavorites() {
      final bachelorsProvider =
          Provider.of<BachelorFavoritesProvider>(context, listen: false);
      bachelorsProvider.clearLikedBachelors();
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite Bachelors'),
        actions: [
          IconButton(
            icon: const Icon(Icons.view_list),
            onPressed: () {
              setState(() {
                isGridMode = false;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.grid_view),
            onPressed: () {
              setState(() {
                isGridMode = true;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirmation'),
                    content: const Text(
                        'Are you sure you want to clear all favorites?'),
                    actions: [
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Clear All'),
                        onPressed: () {
                          clearFavorites();
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
      body: Consumer<BachelorFavoritesProvider>(
        builder: (context, bachelorsProvider, _) {
          final favoriteBachelors = bachelorsProvider.likedBachelors;
          if (isGridMode) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: favoriteBachelors.length,
              itemBuilder: (context, index) {
                final bachelor = favoriteBachelors[index];
                return Dismissible(
                  key: Key(bachelor.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    bachelorsProvider.removeLikedBachelor(bachelor);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(bachelor.avatar),
                      ),
                    ),
                    child: GridTile(
                      header: null,
                      // ignore: sort_child_properties_last
                      child: Column(children: [
                        Text(
                          '${bachelor.firstname} ${bachelor.lastname}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          bachelor.job,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ]),
                      footer: IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          bachelorsProvider.removeLikedBachelor(bachelor);
                        },
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return ListView.builder(
              itemCount: favoriteBachelors.length,
              itemBuilder: (context, index) {
                final bachelor = favoriteBachelors[index];
                return Dismissible(
                  key: Key(bachelor.id.toString()),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onDismissed: (direction) {
                    bachelorsProvider.removeLikedBachelor(bachelor);
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(bachelor.avatar),
                    ),
                    title: Text('${bachelor.firstname} ${bachelor.lastname}'),
                    subtitle: Text(bachelor.job),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        bachelorsProvider.removeLikedBachelor(bachelor);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BachelorDetails(
                            bachelor: bachelor,
                            isLiked: true,
                            onLike: () {
                              bachelorsProvider.removeLikedBachelor(bachelor);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
