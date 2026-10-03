import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import 'note_card.dart';
import 'note_editor_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _archived = false;

  Future<void> _newNote() async {
    final id = await ref.read(databaseProvider).createNote();
    if (!mounted) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => NoteEditorScreen(noteId: id, isNew: true),
      ),
    );
  }

  void _open(int id) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => NoteEditorScreen(noteId: id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notes =
        ref.watch(_archived ? archivedNotesProvider : activeNotesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(_archived ? '~/archive \$' : '~/notes \$'),
        actions: [
          IconButton(
            tooltip: _archived ? 'notes' : 'archive',
            icon: Icon(
              _archived ? Icons.notes : Icons.inventory_2_outlined,
            ),
            onPressed: () => setState(() => _archived = !_archived),
          ),
        ],
      ),
      body: notes.when(
        data: (list) {
          if (list.isEmpty) {
            return Center(
              child: Text(_archived ? 'archive is empty' : 'empty. tap + to add'),
            );
          }
          return ListView.separated(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 96),
            itemCount: list.length,
            separatorBuilder: (_, __) => const SizedBox(height: 10),
            itemBuilder: (context, i) => NoteCard(
              data: list[i],
              onTap: () => _open(list[i].note.id),
            ),
          );
        },
        loading: () => const SizedBox.shrink(),
        error: (e, _) => Center(child: Text('error: $e')),
      ),
      floatingActionButton: _archived
          ? null
          : FloatingActionButton(
              onPressed: _newNote,
              child: const Icon(Icons.add),
            ),
    );
  }
}