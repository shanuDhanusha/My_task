import 'package:flutter/material.dart';

class Todos extends StatelessWidget {
  final List<String>todo;
  final Function deletTodo;
   Todos(this.todo,this.deletTodo);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: todo.length,
        itemBuilder: (context,index){
          return Container(
            width: 100,
            margin: EdgeInsets.symmetric(vertical:20.0), // Margin around each ListTile
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue, // Border color
                width: 2.0,          // Border width
              ),
              borderRadius: BorderRadius.circular(10.0), // Border radius
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.5), // Shadow color
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: Offset(0, 2), // Shadow offset
                ),
              ],
            ),
            child: ListTile(

              leading: Icon(Icons.access_alarms_sharp,color: Colors.green,),
              title: Text(todo[index].toString()),
              trailing:  IconButton(
                 icon: const Icon(Icons.delete),
                color: Colors.red,
                onPressed:(){
                   deletTodo(index.toInt());
                },
              ),


            ),
          );
        }
    );
  }
}
