import 'package:flutter/material.dart';
// import 'package:note_app/functions/functions.dart';
// import 'package:note_app/model/data_model.dart';

// ignore: must_be_immutable
class EditPage extends StatefulWidget {
  String? title;
  String? description;
  int? index;

  EditPage(
      {super.key, required this.title, required this.description, this.index});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController titelCondroller = TextEditingController();
  TextEditingController descriptionCondroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titelCondroller = TextEditingController(text: widget.title);
    descriptionCondroller = TextEditingController(text: widget.description);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 232, 3, 249),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: titelCondroller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your title here...',
                  hintStyle: const TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                // Validator for Title Field
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Title is required';
                  }
                  return null;
                },
              ),
            ),

            const SizedBox(height: 40),

            // Description Input with Validation
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextFormField(
                controller: descriptionCondroller,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your description here...',
                  hintStyle: const TextStyle(
                      color: Colors.white, fontStyle: FontStyle.italic),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                ),
                // Validator for Description Field
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Enter the description ';
                  } else {
                    return null;
                  }
                },
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  edting();
                },
                child:const Text(
                  "Done",
                  style: TextStyle(
                    color: Color.fromARGB(255, 232, 3, 249),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Future edting() async {
    final endTitel = titelCondroller.text.trim();
    final enddescription = descriptionCondroller.text.trim();
    if (endTitel.isEmpty || enddescription.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Please enter both field's",style: TextStyle(color: Colors.red),)));
    }
    // print(endTitel);
  }
}
