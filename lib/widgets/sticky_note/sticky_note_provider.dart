
import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

@immutable
class Note {
  final int id;
  final String body;

  const Note({required this.id, required this.body});
}

class NoteList extends Notifier<List<Note>> {
  @override
  List<Note> build() => [];

  void add(String body, [int? id]) {
    id ??= DateTime.now().millisecondsSinceEpoch;

    state = [
      ...state,
      Note(id: id, body: body)
    ];
  }

  void edit(int id, String body) {
    state = [
      for (final note in state)
      if (note.id == id)
      Note(id: id, body: body)
      else
      note
    ];
  }

  void delete(int id) {
    state = state.where((note)=> note.id != id).toList();
  }
}


final messageListProvider = StateProvider<List<Note>>((ref) => []);