

import 'package:assigment3/widgets/sticky_note/sticky_note_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final noteListProvider = NotifierProvider<NoteList, List<Note>>(NoteList.new);

class StickyNote extends HookConsumerWidget {
  const StickyNote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final noteRef = ref.watch(noteListProvider);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          if (noteRef.isNotEmpty) const Divider(height: 0),
          for (var i = 0; i < noteRef.length; i++) ...[
            if (i > 0) const Divider(height: 0),
            StickyNoteItem(
              key: ValueKey(noteRef[i].id),
              note: noteRef[i]
            )
          ],
          const NewNoteItem()
        ]
      )
    );
  }
}

class StickyNoteItem extends HookConsumerWidget {
  const StickyNoteItem({super.key, required this.note});


  final Note note;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEditMode = useState(false);


    final textEditingController = useTextEditingController(text:note.body);
    final textFieldFocusNode = useFocusNode();

    void toggleEditMode() {
      isEditMode.value = !isEditMode.value;
      if (isEditMode.value == true) {
        textFieldFocusNode.requestFocus();
      }
    }
    void update() {
      if (textEditingController.text.isEmpty) {
        showEmptyNoteDialog(context);
        return;
      }
      ref.read(noteListProvider.notifier).edit(note.id, textEditingController.text);
      toggleEditMode();
    }

    void cancel() {
      toggleEditMode();
    }

    void delete() {
      ref.read(noteListProvider.notifier).delete(note.id);
    }

    return Material(
      color: Colors.white,
      elevation: 6,
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: isEditMode.value
                    ? TextField(
                      autofocus: true,
                      focusNode: textFieldFocusNode,
                      controller: textEditingController,
                    ) : GestureDetector(
                      onTap: toggleEditMode,
                      child: Text(note.body)
                    )
                  )
                )
              ),
              Visibility(
                visible: isEditMode.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: update,
                      child: const Text("Update")
                    ),
                    const Divider(height: 0),
                    ElevatedButton(
                      onPressed: cancel,
                      child: const Text("Cancel")
                    ),
                    const Divider(height: 0),
                    ElevatedButton(
                      onPressed: delete,
                      child: const Text("Delete")
                    ),
                  ]
                )
              )
            ]
          )
        )
    );
  }
}





class NewNoteItem extends HookConsumerWidget {
  const NewNoteItem({super.key});
  
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textEditingController = useTextEditingController();
    final isCreateMode = useState(false);
    final textFieldFocusNode = useFocusNode();

    void toggleCreateMode() {
      isCreateMode.value = !isCreateMode.value;
      if (isCreateMode.value == true) {
        textFieldFocusNode.requestFocus();
      }
    }
    void add() {
      if (textEditingController.text.isEmpty) {
        showEmptyNoteDialog(context);
        return;
      }
      ref.read(noteListProvider.notifier).add(textEditingController.text);
      toggleCreateMode();
      textEditingController.text = "";
    }
    void cancel() {
      toggleCreateMode();
      textEditingController.text = "";
    }


    return Material(
      color: Colors.white,
      elevation: 6,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: isCreateMode.value
                    ? TextField(
                      autofocus: true,
                      focusNode: textFieldFocusNode,
                      controller: textEditingController,
                    ) : GestureDetector(
                      onTap: toggleCreateMode,
                      child: const Text(
                          'Create New Note',
                          style: TextStyle(fontSize: 16),
                        )
                    )
                  )
                )
              ),
              Visibility(
                visible: isCreateMode.value,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: add,
                      child: const Text("Create")
                    ),
                    const Divider(height: 0),
                    ElevatedButton(
                      onPressed: cancel,
                      child: const Text("Cancel")
                    )
                  ]
                )
              )
            ]
          )
        )
    );
  }
  
}
void showEmptyNoteDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Empty Note'),
        content: const Text('Note cannot be empty.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}