


import 'package:assigment3/widgets/sticky_note/sticky_note.dart';
import 'package:flutter/material.dart';

class StickyNoteScreen extends StatelessWidget {
  const StickyNoteScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sticky Notes'),
      ),
      body: const Center(
          child: StickyNote()
        ,
      ),
    );
  }
}