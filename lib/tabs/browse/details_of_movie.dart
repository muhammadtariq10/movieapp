import 'package:flutter/material.dart';

class DetailsOfMovie extends StatelessWidget {
  final String movieName;

  const DetailsOfMovie({super.key, required this.movieName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieName),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
     body: Container(color: Colors.white),
    );
  }
}
