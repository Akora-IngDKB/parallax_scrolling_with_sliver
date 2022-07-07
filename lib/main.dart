import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: false,
            pinned: true,
            expandedHeight: MediaQuery.of(context).size.height * 0.6,
            backgroundColor: Colors.teal[900],
            title: const Text('Sausage Pizza with Vegetables'),
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    'https://assets.bonappetit.com/photos/5aa94eb56ed79626bc262c39/1:1/w_3332,h_3332,c_limit/cast-iron-pizza-with-fennel-and-sausage.jpg',
                    fit: BoxFit.cover,
                    height: MediaQuery.of(context).size.height * 0.6,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Chip(
                          backgroundColor: Colors.black.withOpacity(0.1),
                          label: const Text('Freezable'),
                        ),
                        const SizedBox(width: 12),
                        Chip(
                          backgroundColor: Colors.black.withOpacity(0.1),
                          label: const Text('Meal prep'),
                        ),
                        const SizedBox(width: 12),
                        Chip(
                          backgroundColor: Colors.black.withOpacity(0.1),
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.access_time_filled),
                              SizedBox(
                                width: 4,
                              ),
                              Text('15m'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) {
                return ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    width: 100,
                    child: const Placeholder(),
                  ),
                  title: Text('Place ${index + 1}', textScaleFactor: 2),
                );
              },
              childCount: 20,
            ),
          ),
        ],
      ),
    );
  }
}
