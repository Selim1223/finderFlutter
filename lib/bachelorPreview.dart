// ignore: file_names
import 'package:finder_flutter/bachelorDetails.dart';
import 'package:finder_flutter/bachelorFavoritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/bachelor.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;
  final bool isLiked;
  final VoidCallback onLike;
  final VoidCallback onDislike;

  const BachelorPreview({
    Key? key,
    required this.bachelor,
    required this.isLiked,
    required this.onLike,
    required this.onDislike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<BachelorFavoritesProvider>(
      builder: (context, bachelorsProvider, _) {
        final isLiked = bachelorsProvider.isLiked(bachelor);

        return ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(bachelor.avatar),
            backgroundColor: isLiked ? Colors.red : null,
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min, 
            children: [
            IconButton(
              icon: Icon(
                isLiked ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: onLike,
            ),
            IconButton(
              icon: Icon(
                Icons.remove_circle_outline,
                color: Colors.blue,
              ),
              onPressed: onDislike,
            ),
          ]),
          title: Text("${bachelor.firstname} ${bachelor.lastname}"),
          subtitle: Text(bachelor.job),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BachelorDetails(
                  bachelor: bachelor,
                  isLiked: isLiked,
                  onLike: () {
                    if (isLiked) {
                      bachelorsProvider.removeLikedBachelor(bachelor);
                    } else {
                      bachelorsProvider.toggleLike(bachelor);
                    }
                  },
                ),
              ),
            );
          },
        );
      },
    );
  }
}
