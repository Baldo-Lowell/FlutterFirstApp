import 'package:flutter/material.dart'; //UI Library


void main() => runApp(MyApp());//App Entry point

class MyApp extends StatelessWidget {//A widget w/ nochanges of data or  display 
@override
Widget build(BuildContext context) {
  return MaterialApp(
    home: FirstScreen()
    ); //MaterialApp
   }
}
class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {// describe what to show
    return Scaffold(
      appBar: AppBar(title: Text('My First App'),),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Icon(Icons.star, size:40),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(Icons.thumb_down),
                Icon(Icons.thumb_up),
              ],
            ),
            SizedBox(height: 10),
            Text('Hello Flutter'),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SecondScreen()),
                );
              },
              child: Text('Go to Second Screen')
            ),//Elevated Button
          ],
        ),
        ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(child: ElevatedButton(
        onPressed: () => Navigator.pop(context), child: Text('Go back')), 
      ),
      );
  }
}