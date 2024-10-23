import 'package:flutter/material.dart';
import 'package:note_app/functions/functions.dart';
import 'package:note_app/model/data_model.dart';
import 'package:note_app/view/add_page.dart';
import 'package:note_app/view/edit_page.dart';
import 'package:note_app/view/view_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  initState() {
    super.initState();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
            return const AddPage();
          }));
        },
        child: const Icon(Icons.add),
      ),
      backgroundColor:const  Color.fromARGB(255, 196, 3, 249),
      appBar: AppBar(
        backgroundColor:const  Color.fromARGB(255, 196, 3, 249),
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 14),
              width: 352,
              height: 250,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5))
                  ]),
              child:const TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    hintText: "Search",
                    hintStyle: TextStyle(
                      color:  Color.fromARGB(255, 232, 3, 249),
                    )),
              ),
            ),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: note_notifire,
        builder: (context, List<Note> notess, child) {
          if (notess.isEmpty) {
            return const  Center(
              child: Text(
                "No Notes found",
                style: TextStyle(color: Colors.white),
              ),
            );
          } else {
            return ListView.separated(
              itemCount: notess.length,
              itemBuilder: (context, index) {
                final data = notess[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                      return ViewPage(
                          titleView: data.title.toString(),
                          descriptionView: data.description.toString());
                    }));
                  },
                  tileColor: const Color.fromARGB(255, 255, 255, 255),
                  title: Text(
                    data.title!,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 232, 3, 249)),
                  ),
                  subtitle: Text(data.description!,
                      style:const TextStyle(
                          color:  Color.fromARGB(255, 232, 3, 249))),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                          onPressed: () {
                            deleteNote(index);
                            // Navigator.of(context).pop();
                          },
                          icon:const  Icon(Icons.delete)),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (ctx) => EditPage(
                                          title: data.title,
                                          description: data.description,
                                          index: index,
                                        )));
                          },
                          icon:const  Icon(Icons.edit))
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return  const Divider(
                  thickness: 3,
                );
              },
            );
          }
        },
      ),
    );
  }
}
