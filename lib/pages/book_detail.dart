import 'package:flutter/material.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({super.key});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)?.settings.arguments as Map?) ?? const {};


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Book Detail',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Center(
                child: Text(
                  data['title'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 48,
                  ),
                ),
              ),
              Image.network(data['imageUri']),
              SizedBox(height: 20,),
              Center(
                child: Text(
                  data['description'],
                  textAlign: TextAlign.justify,
                  style: TextStyle(

                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
