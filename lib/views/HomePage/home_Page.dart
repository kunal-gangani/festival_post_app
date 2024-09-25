import 'package:festival_post_maker_app/globals/festival_list.dart';
import 'package:festival_post_maker_app/views/HomePage/components/container_fest.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan.shade700,
        elevation: 0,
        title: const Text(
          'Festivals',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: festivalData.length,
        itemBuilder: (
          context,
          index,
        ) {
          return ContainerFest(
            index: index,
            context: context,
          );
        },
      ),
      backgroundColor: Colors.cyan.shade50,
    );
  }
}
