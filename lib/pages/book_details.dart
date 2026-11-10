import 'package:flutter/material.dart';
import 'package:reader_tracker/models/book.dart';
import 'package:reader_tracker/utils/book_details_arguments.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    BookDetailsArguments? arguments =
        ModalRoute.of(context)?.settings.arguments as BookDetailsArguments?;
    Book? book = arguments?.itemBook;
    final theme = Theme.of(context).textTheme;
    final isFromSavedScreen = true;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${book == null ? 'Book' : arguments?.itemBook.title} Details',
        ),
      ),
      body: book == null
          ? const Center(child: Text('No book details available.'))
          : SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    if (book.imageLinks.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network(
                          book.imageLinks['thumbnail'] ?? '',
                          fit: BoxFit.cover,
                        ),
                      ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(book.title, style: theme.headlineSmall),
                        Text(book.authors.join(', '), style: theme.labelLarge),
                        Text(
                          'Published: ${book.publishedDate}',
                          style: theme.bodySmall,
                        ),
                        Text(
                          'Page count: ${book.pageCount}',
                          style: theme.bodySmall,
                        ),
                        Text(
                          'Language: ${book.language}',
                          style: theme.bodySmall,
                        ),
                        
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      child: !isFromSavedScreen
                          ? ElevatedButton(
                              onPressed: () async {
                                // save a book to the datase
                                // try {
                                //   int savedInt = await DatabaseHelper.instance
                                //       .insert(book);
                                //   SnackBar snackBar = const SnackBar(
                                //       content: Text("Book Saved"));
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(snackBar);
                                // } catch (e) {
                                //   print("Error: $e");
                                // }
                              },
                              child: const Text('Save'))
                          : ElevatedButton.icon(
                              onPressed: () async {},
                              icon: const Icon(Icons.favorite),
                              label: const Text('Favorite'))),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
