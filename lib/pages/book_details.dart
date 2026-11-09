import 'package:flutter/material.dart';
import 'package:reader_tracker/utils/book_details_arguments.dart';

class BookDetailsScreen extends StatefulWidget {
  const BookDetailsScreen({super.key});

  @override
  State<BookDetailsScreen> createState() => _BookDetailsScreenState();
}

class _BookDetailsScreenState extends State<BookDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    BookDetailsArguments? arguments = ModalRoute.of(context)?.settings.arguments as BookDetailsArguments?;
    return Scaffold(
      appBar: AppBar(
        title: Text('${arguments?.itemBook.title} Details'),
      ),
      body: Center(
        child: Text('Book Details'),
      ),
    );
  }
}