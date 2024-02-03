/* Demonstrating a ListView -- a very flexible widget */

import 'package:flutter/Material.dart';

class App5 extends StatelessWidget {
  const App5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My wonderful app!'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.home),
        onPressed: () {
          print('Add button clicked');
        }, 
      ),
      body: ListView( // ListView is a scrollable list of widgets
        // can you add the tiles 'Lions', 'Tigers', 'Bears', and 'Oh my!'?
        children: List.generate(10, (index) => ListTile(
          title: Text('Item $index'),
          subtitle: Text('Subtitle $index'),
          leading: Icon(Icons.star),
          trailing: Icon(Icons.more_vert),
          onTap: () {
            print('Item $index clicked');
          },
        )),
      ),
    );
  }
}
