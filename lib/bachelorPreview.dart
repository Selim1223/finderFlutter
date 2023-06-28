// ignore: file_names
import 'package:finder_flutter/bachelorDetails.dart';
import 'package:flutter/material.dart';
import 'models/bachelor.dart';

class BachelorPreview extends StatefulWidget {
  final Bachelor bachelor;
  final bool isLiked;
  final VoidCallback onLike;

  const BachelorPreview({
    Key? key,
    required this.bachelor,
    required this.isLiked,
    required this.onLike,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BachelorPreviewState createState() => _BachelorPreviewState();
}

class _BachelorPreviewState extends State<BachelorPreview> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage(widget.bachelor.avatar),
        backgroundColor: widget.isLiked ? Colors.red : null, 
      ),
      trailing: IconButton(
        icon: Icon(
          widget.isLiked ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        ),
        onPressed: widget.onLike,
      ),
      title: Text("${widget.bachelor.firstname} ${widget.bachelor.lastname}"),
      subtitle: Text(widget.bachelor.job),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BachelorDetails(
              bachelor: widget.bachelor,
              isLiked: widget.isLiked,
              onLike: widget.onLike,
            ),
          ),
        );
      },
    );
  }
}

