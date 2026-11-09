

import 'package:flutter/material.dart';
import 'package:reader_tracker/models/book.dart';

class BookTile extends StatelessWidget {
  const BookTile({
    super.key,
    required this.book,
  });

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(4.0, 4.0, 4.0, 0.5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.brown.shade500,
            width: 6,
          ),
        ),
      ),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black54,
          title: Text(
            book.title,
            style: const TextStyle(fontSize: 12),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        child: book.imageLinks.containsKey('thumbnail') 
            ? Image.network(book.imageLinks['thumbnail']!, fit: BoxFit.cover)
            : const Icon(Icons.book, size: 50),
        // subtitle: Text(book.authors.join(', ')),
      )
    );
  }
}
