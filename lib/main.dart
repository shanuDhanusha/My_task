import 'package:flutter/material.dart';
import 'Todos.dart';
void main() {
  runApp(const MyApp());
}
Future<String> showInputDialog(BuildContext context) async {
  String userInput = ''; // Initialize an empty string to store user input

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Enter Your Input'),
        content: TextField(
          //maxLines:1,
          expands: false,
          onChanged: (value) {
            userInput = value; // Store user input in the userInput variable
          },
          decoration: const InputDecoration(
            hintText: 'Type here...',
          ),
        ),
        actions: [
          ElevatedButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop(); // Close the dialog
              userInput='';
            },
          ),
          ElevatedButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(userInput); // Close the dialog and return the input
            },
          ),
        ],
      );
    },
  );

 return userInput;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Todo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

   late List<String>addTodo=[];
   void add() async {
     String? result = await showInputDialog(context);
     if (result != null && result.isNotEmpty) {
       setState(() {
         addTodo.add(result); // Add the input to the addTodo list
       });
     }
   }
 //delete todos
   void deletTodos(int index){
     setState(() {
         addTodo.removeAt(index);
     });
   }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.amberAccent ,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: !(addTodo.isEmpty)? Container(
          width: 400,
          margin: const EdgeInsets.only(left: 5.2),
          child: Todos(addTodo,deletTodos)
      ):const Center(
        child:  Text('Your Task is Add',style: TextStyle(fontSize: 28,fontWeight:FontWeight.bold,color: Colors.black),),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:add,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
