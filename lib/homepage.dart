import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:test/controller.dart';
import 'package:test/display.dart';
import 'package:uuid/uuid.dart';

import 'model/details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? id;
  String? name;

  late Box<Details> box;

  @override
  void initState() {
    box = Hive.box('details');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<DetailsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: ValueListenableBuilder(
        valueListenable: box.listenable(),
        builder: (context, value, child) {
          return ListView.builder(
            itemCount: box.length,
            itemBuilder: (context, index) {
              return ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ShowPage(getdetails: provider.getDetail(index)),
                        ));
                  },
                  child: Text('${(index + 1).toString()}'));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context
              .read<DetailsProvider>()
              .add(Details(id: const Uuid().v4(), name: ''));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
