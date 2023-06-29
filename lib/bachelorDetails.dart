// ignore: file_names
import 'package:finder_flutter/bachelorFavoritesProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/bachelor.dart';

class BachelorDetails extends StatefulWidget {
  final Bachelor bachelor;
  final bool isLiked;
  final VoidCallback onLike;

  const BachelorDetails({
    Key? key,
    required this.bachelor,
    required this.isLiked,
    required this.onLike,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BachelorDetailsState createState() => _BachelorDetailsState();
}

class _BachelorDetailsState extends State<BachelorDetails> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bachelor Details'),
      ),
      body: Center(
        child: Consumer<BachelorFavoritesProvider>(
          builder: (context, bachelorsProvider, _) {
            final isLiked =
                bachelorsProvider.likedBachelors.contains(widget.bachelor);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(widget.bachelor.avatar),
                      radius: 80,
                    ),
                    IconButton(
                      icon: Icon(
                        isLiked ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        if (isLiked) {
                          bachelorsProvider
                              .removeLikedBachelor(widget.bachelor);
                        } else {
                          bachelorsProvider.toggleLike(widget.bachelor);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  '${widget.bachelor.firstname} ${widget.bachelor.lastname}',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  widget.bachelor.job,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  'Name: ${widget.bachelor.firstname} ${widget.bachelor.lastname}',
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Gender: ${widget.bachelor.gender == Gender.Male ? 'Male' : 'Female'}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Job: ${widget.bachelor.job}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  'Description: ${widget.bachelor.description}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  isLiked ? 'favorite bachelor !' : '',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            );
          },
        ),
      ),
      floatingActionButton: Center(
        child: Consumer<BachelorFavoritesProvider>(
            builder: (context, bachelorsProvider, _) {
          final isLiked =
              bachelorsProvider.likedBachelors.contains(widget.bachelor);
          return Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                child: Icon(isLiked ? Icons.thumb_down : Icons.thumb_up),
                onPressed: () {
                  final message = isLiked
                      ? 'You have removed this Bachelor from your favourites !'
                      : 'You have added this Bachelor to your favourites !';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(message),
                    ),
                  );
                  bachelorsProvider.toggleLike(widget.bachelor);
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
