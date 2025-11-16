import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas6',
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Tugas6'),
          bottom : TabBar(
            tabs : [
              Tab(icon: Icon(Icons.list), text: 'List'),
              Tab(icon: Icon(Icons.grid_3x3), text: 'Grid'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            buildListView(),
            buildGridView(),
          ],
        ),
      ),
    );
  }
}

Widget buildListView() {
  Wisata wisata = Wisata();
  return ListView.builder(
    itemCount: wisata.data.length,
    itemBuilder: (context, index) {
      final item = wisata.data[index];
      return Card(
        margin: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Image.network(item['image']!, width:100, fit: BoxFit.cover),
          title: Text(item['title']!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailPage(item: item)
              ),
            );
          },
        )
      );
    },
  );
}

Widget buildGridView() {
  Wisata wisata = Wisata();
  return GridView.builder(
    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 8.0,
      mainAxisSpacing: 8.0,
    ),
    itemCount: wisata.data.length,
    itemBuilder: (context, index) {
      final item = wisata.data[index];
      return InkWell(
        onTap : () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailPage(item: item),
            ),
          );
        },
        child: Card(
          elevation: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Image.network(item['image']!, fit: BoxFit.cover,),
              ),
              const SizedBox(height: 8),
              Text(item['title']!),
            ],
          ),
        )
      ); 
    },
  );
}