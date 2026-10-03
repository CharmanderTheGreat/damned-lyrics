import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'database.dart';

export 'database.dart';

final databaseProvider = Provider<AppDatabase>((ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
});

final activeNotesProvider = StreamProvider<List<NoteWithItems>>(
  (ref) => ref.watch(databaseProvider).watchNotes(archived: false),
);

final archivedNotesProvider = StreamProvider<List<NoteWithItems>>(
  (ref) => ref.watch(databaseProvider).watchNotes(archived: true),
);

final noteProvider = StreamProvider.family<NoteWithItems?, int>(
  (ref, id) => ref.watch(databaseProvider).watchNote(id),
);