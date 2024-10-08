import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favorite_games/presentation/bloc/favorite_games_bloc.dart';
import '../../../favorite_games/presentation/bloc/favorite_games_event.dart';
import '../../domain/entities/game_details.dart';
import 'achievement_container.dart';

class GameInfo extends StatefulWidget {
  final GameDetails game;
  const GameInfo({super.key, required this.game});

  @override
  State<GameInfo> createState() => _GameInfoState();
}

class _GameInfoState extends State<GameInfo> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 350,
                      width: 250,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(5)),
                          color: Colors.pink[100]),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 5, right: 5, top: 5, bottom: 0),
                  child: Text(
                    widget.game.title,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: Text(
                          'Достижения: ${widget.game.achievements.length}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 22),
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.zero,
                      iconSize: 40,
                      icon: Icon(
                        widget.game.isFavorite
                            ? Icons.bookmark_remove_rounded
                            : Icons.bookmark_border_rounded,
                        color: Colors.green,
                      ),
                      onPressed: () {
                        setState(() {
                          context.read<FavoriteGamesBloc>().add(ChangeStatusFavorite(widget.game));
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        widget.game.achievements.isEmpty
            ? const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text(
                      'Список пуст',
                      style: TextStyle(color: Colors.white, fontSize: 22),
                    ),
                  ),
                ),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final achievement = widget.game.achievements[index];
                    return AchievementContainer(achievement: achievement);
                  },
                  childCount: widget.game.achievements.length,
                ),
              ),
      ],
    );
  }
}
