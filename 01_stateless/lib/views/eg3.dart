/* Our first Material app! */

import 'package:flutter/Material.dart';

class App3 extends StatelessWidget {
  const App3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // what happens if we remove the scaffold?
      // Scaffold is a Material widget that provides a default app bar, title, and a body property that holds the main content of the home screen.
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "I'm a Material App!",
              // where does this style come from? how is it retrieved?
              style: Theme.of(context).textTheme.titleLarge
            ),
            // automatic gesture detection
            // (try to find the GestureDetector in the widget details tree)
            ElevatedButton(
              child: const Text('Hey! Click me!'),
              onPressed: () {
                print('Button clicked');
              }, 
            )
          ],
        ),
      ),
    );
  }
}
