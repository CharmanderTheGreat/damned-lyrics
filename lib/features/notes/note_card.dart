import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../../data/database.dart';
import '../../data/note_color.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key, required this.data, required this.onTap});

  final NoteWithItems data;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final note = data.note;
    final color = note.colorTag.color;
    final total = data.items.length;
    final done = data.doneCount;
    final preview = data.items.take(4).toList();
    final filled = total == 0 ? 0 : (done / total * 10).round();
    final bar = '█' * filled + '░' * (10 - filled);

    return Material(
      color: Palette.surface,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Palette.border),
        borderRadius: BorderRadius.circular(6),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    '#${note.colorTag.label}',
                    style: TextStyle(color: color, fontSize: 12),
                  ),
                  const Spacer(),
                  if (note.isPinned)
                    const Icon(Icons.push_pin, size: 14, color: Palette.dim),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                note.title.isEmpty ? 'untitled' : note.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: note.title.isEmpty ? Palette.dim : Palette.text,
                ),
              ),
              if (preview.isNotEmpty) const SizedBox(height: 8),
              ...preview.map((item) {
                final box = item.isDone ? '[x]' : '[ ]';
                return Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: Text(
                    '$box ${item.content}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 13,
                      color: item.isDone ? Palette.dim : Palette.text,
                    ),
                  ),
                );
              }),
              if (total > 4)
                Text(
                  '+${total - 4} more',
                  style: const TextStyle(fontSize: 12, color: Palette.dim),
                ),
              if (total > 0) ...[
                const SizedBox(height: 8),
                Text(
                  '$bar $done/$total',
                  style: TextStyle(fontSize: 12, color: color),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}