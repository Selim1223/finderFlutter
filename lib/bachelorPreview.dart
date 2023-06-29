// ignore: file_names
import 'package:finder_flutter/bachelorDetails.dart';
import 'package:finder_flutter/bachelorFavoritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/bachelor.dart';

class BachelorPreview extends StatelessWidget {
  final Bachelor bachelor;

  const BachelorPreview({
    Key? key,
    required this.bachelor,
    required bool isLiked,
    required void Function() onLike,
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
          trailing: IconButton(
            icon: Icon(
              isLiked ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              if (isLiked) {
                bachelorsProvider.removeLikedBachelor(bachelor);
              } else {
                bachelorsProvider.toggleLike(bachelor);
              }
            },
          ),
          title: Text("${bachelor.firstname} ${bachelor.lastname}"),
          subtitle: Text(bachelor.job),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => BachelorDetails(
                  bachelor: bachelor,
                  isLiked: false,
                  onLike: () {},
                ),
              ),
            );
          },
        );
      },
    );
  }
}
