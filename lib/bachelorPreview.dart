// ignore: file_names
import 'package:finder_flutter/bachelorDetails.dart';
import 'package:flutter/material.dart';
import 'models/bachelor.dart';

class BachelorPreview extends StatefulWidget {
  final Bachelor bachelor;

  const BachelorPreview({super.key, required this.bachelor});

  @override
  // ignore: library_private_types_in_public_api
  _BachelorPreviewState createState() => _BachelorPreviewState();
}

class _BachelorPreviewState extends State<BachelorPreview> {
  bool isLiked = false;

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.bachelor.avatar),
      ),
      trailing: IconButton(
        icon: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: toggleLike,
      ),
      title: Text("${widget.bachelor.firstname} ${widget.bachelor.lastname}"),
      subtitle: Text(widget.bachelor.job),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BachelorDetails(
              bachelor: widget.bachelor,
            ),
          ),
        );
      },
    );
  }
}
