import 'package:flutter/material.dart';
import 'package:reader_tracker/components/shelf.dart';
import 'package:reader_tracker/models/book.dart';

class BookTile extends StatelessWidget {
  const BookTile({super.key, required this.book});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          Positioned.fill(
            bottom: 10.1,
            left: 1,
            right: 1,
            top: 5,
            child: GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black45,
                title: Text(
                  book.title,
                  style: const TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              child: book.imageLinks.containsKey('thumbnail')
                  ? Image.network(
                      book.imageLinks['thumbnail']!,
                      fit: BoxFit.cover,
                    )
                  : const Icon(Icons.book, size: 50),
              // subtitle: Text(book.authors.join(', ')),
            ),
          ),
        Shelf(),
      ],
    );
  }
}
