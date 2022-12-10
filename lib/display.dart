import 'package:flutter/material.dart';
import 'package:test/model/details.dart';

class ShowPage extends StatefulWidget {
  final Details getdetails;
  const ShowPage({Key? key, required this.getdetails}) : super(key: key);
  @override
  State<ShowPage> createState() => _ShowPageState();
}

class _ShowPageState extends State<ShowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Show Page')),
      body: Center(
        child: Text(widget.getdetails.id),
      ),
    );
  }
}
