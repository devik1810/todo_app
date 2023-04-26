import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:todo_app/screen/model/todo_model.dart';
import 'package:todo_app/screen/provider/todo_provider.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  State<FirstScreen> createState() => _HomeState();
}

class _HomeState extends State<FirstScreen> {
  TextEditingController txtname = TextEditingController();
  TextEditingController txtstd = TextEditingController();

  TextEditingController dtxtname = TextEditingController();
  TextEditingController dtxtstd = TextEditingController();

  TodoProvider? todoProvider;

  @override
  Widget build(BuildContext context) {
    todoProvider = Provider.of<TodoProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff44B6B5),
          centerTitle: true,
          title: Text(
            "Todo Data",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: txtname,
                decoration: InputDecoration(
                  label: Text(
                    "Name",
                    style: TextStyle(color: Color(0xff44B6B5)),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff44B6B5), width: 1),
                  ),
                ),
              ),
              SizedBox(
                height: 8,
              ),
              TextField(
                controller: txtstd,
                decoration: InputDecoration(
                  label: Text(
                    "Std",
                    style: TextStyle(color: Color(0xff44B6B5)),
                  ),
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff44B6B5), width: 1),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  backgroundColor: Color(0xff44B6B5),
                  onPressed: () {
                    TodoModel r1 =
                        TodoModel(name: txtname.text, std: txtstd.text);
                    todoProvider!.addData(r1);
                  },
                  child: Icon(Icons.add),
                ),
              ),
              Expanded(
                child: Consumer<TodoProvider>(
                  builder: (context, value, child) => Expanded(
                    child: ListView.builder(
                      itemCount: todoProvider!.l1.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text("${todoProvider!.l1[index].name}",style: TextStyle(color: Color(0xff44B6B5))),
                          subtitle: Text("${todoProvider!.l1[index].std}",style: TextStyle(color: Color(0xff44B6B5))),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  todoProvider!.delete(index);
                                },
                                icon: Icon(Icons.delete),
                              ),
                              IconButton(
                                onPressed: () {
                                  dtxtname = TextEditingController(
                                      text: todoProvider!.l1[index].name);
                                  dtxtstd = TextEditingController(
                                      text: todoProvider!.l1[index].std);

                                  showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          TextField(
                                            controller: dtxtname,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          TextField(
                                            controller: dtxtstd,
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              TodoModel r1 = TodoModel(
                                                std: dtxtstd.text,
                                                name: dtxtname.text,
                                              );
                                              todoProvider!
                                                  .updateData(index, r1);
                                              Navigator.pop(context);
                                            },
                                            child: Text("update"),
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    Color(0xff44B6B5)),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.edit),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
