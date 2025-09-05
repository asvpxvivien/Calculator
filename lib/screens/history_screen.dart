import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/history_provider.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_sweep_outlined),
            tooltip: 'Vider l\'historique',
            onPressed: () async {
              final ok = await showDialog<bool>(
                context: context,
                builder: (ctx) => AlertDialog(
                  title: Text('Effacer l\'historique ?'),
                  content: Text('Cette action est irréversible.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(ctx, false),
                      child: Text('Annuler'),
                    ),
                    FilledButton(
                      onPressed: () => Navigator.pop(ctx, true),
                      child: Text('Effacer'),
                    ),
                  ],
                ),
              );
              if (ok == true) {
                await context.read<HistoryProvider>().clear();
              }
            },
          ),
        ],
      ),
      body: Consumer<HistoryProvider>(
        builder: (context, history, _) {
          final items = history.entries;
          if (items.isEmpty) {
            return Center(child: Text('Aucun historique pour le moment'));
          }
          return ListView.separated(
            padding: EdgeInsets.all(16),
            itemCount: items.length,
            separatorBuilder: (_, __) => SizedBox(height: 12),
            itemBuilder: (context, index) {
              final entry = items[index];
              return Material(
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
                child: ListTile(
                  title: Text(entry.expression),
                  subtitle: Text(_formatDate(entry.timestamp)),
                  trailing: Text(
                    entry.result,
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  String _formatDate(DateTime d) {
    final two = (int n) => n.toString().padLeft(2, '0');
    return '${two(d.day)}/${two(d.month)}/${d.year} ${two(d.hour)}:${two(d.minute)}';
  }
}
