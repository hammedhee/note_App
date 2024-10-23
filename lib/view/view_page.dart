import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ViewPage extends StatelessWidget {
 final String? titleView;
  final String? descriptionView;
 const ViewPage({super.key, required this.titleView, required this.descriptionView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 3, 249),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 196, 3, 249),
        title: const Text(
          "Your note's",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SizedBox(
          height: 450,
          width: 325,
          child: Card(
            color: const Color.fromARGB(255, 255, 204, 51),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text(titleView!), 
          const   Gap(30),
              Text(descriptionView!)],
            ),
          ),
        ),
      ),
    );
  }
}
