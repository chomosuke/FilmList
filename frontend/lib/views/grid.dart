import 'package:flutter/material.dart' hide Card;
import 'package:flutter_hooks/flutter_hooks.dart';
import 'index.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Grid extends HookConsumerWidget {
  final List<String> filmIds;
  final bool showEpisodeTracker;
  final String emptyMessage;
  const Grid(
    this.filmIds, {
    this.showEpisodeTracker = false,
    this.emptyMessage = '',
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (filmIds.isEmpty) {
      return Center(
        child: Text(emptyMessage),
      );
    }

    final controller = useScrollController();

    const maxCrossAxisExtent = 182 * 2.0;
    return Scrollbar(
      controller: controller,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: controller,
        child: Center(
          child: SizedBox(
            width: 1600,
            child: GridView.extent(
              padding: const EdgeInsets.all(30),
              maxCrossAxisExtent: maxCrossAxisExtent,
              childAspectRatio: 400 / 600,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              shrinkWrap: true,
              children: filmIds
                  .map<Widget>(
                    (filmId) => Card(
                      filmId: filmId,
                      showEpisodeTracker: showEpisodeTracker,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }
}
