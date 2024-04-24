import 'package:ets_ppb_h/pages/book_detail.dart';
import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/add_book.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/home',
  routes: {
    '/home': (context) => Home(),
    '/add_book': (context) => AddBook(),
    '/book_detail': (context) => BookDetail()
  },
));

