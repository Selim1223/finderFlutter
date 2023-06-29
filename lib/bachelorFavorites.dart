import 'package:finder_flutter/bachelorDetails.dart';
import 'package:finder_flutter/bachelorFavoritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BachelorsFavorites extends StatelessWidget {
  const BachelorsFavorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite Bachelors'),
      ),
      body: Consumer<BachelorFavoritesProvider>(
        builder: (context, bachelorsProvider, _) {
          final favoriteBachelors = bachelorsProvider.likedBachelors;

          return ListView.builder(
            itemCount: favoriteBachelors.length,
            itemBuilder: (context, index) {
              final bachelor = favoriteBachelors[index];
              return ListTile(
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
              );
            },
          );
        },
      ),
    );
  }
}
