// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:royal_reels/core/enums/enums.dart';
import 'package:royal_reels/core/extensions/helper_extensions.dart';
import 'package:royal_reels/core/router/router.dart';
import 'package:royal_reels/royal_reels_features/_royal_reels_common/cubit/user_cubit.dart';

class RoyalReelsLevelModel {
  final int id;
  final String title;
  final String image;
  final RoyalReelsLvlCardState state;
  RoyalReelsLevelModel({
    required this.id,
    required this.title,
    required this.image,
    required this.state,
  });

  RoyalReelsLevelModel copyWith({
    int? id,
    String? title,
    String? image,
    RoyalReelsLvlCardState? state,
  }) {
    return RoyalReelsLevelModel(
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
      state: state ?? this.state,
    );
  }

  @override
  bool operator ==(covariant RoyalReelsLevelModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.image == image &&
        other.state == state;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ image.hashCode ^ state.hashCode;
  }

  @override
  String toString() {
    return 'RoyalReelsLevelModel(id: $id, title: $title, image: $image, state: $state)';
  }

  static List<RoyalReelsLevelModel> get list {
    return [
      RoyalReelsLevelModel(
        id: 0,
        title: 'Mysteri Land',
        image: 'assets/images/royal_reels_lvl_cards/lvl_1.jpg',
        state: _stateGetter(0),
      ),
      RoyalReelsLevelModel(
        id: 1,
        title: 'Earth Land',
        image: 'assets/images/royal_reels_lvl_cards/lvl_2.jpg',
        state: _stateGetter(1),
      ),
      RoyalReelsLevelModel(
        id: 2,
        title: 'South Land',
        image: 'assets/images/royal_reels_lvl_cards/lvl_3.jpg',
        state: _stateGetter(2),
      ),
      RoyalReelsLevelModel(
        id: 3,
        title: 'Farly World',
        image: 'assets/images/royal_reels_lvl_cards/lvl_4.jpg',
        state: _stateGetter(3),
      ),
      RoyalReelsLevelModel(
        id: 4,
        title: 'Eiliean Kingdom',
        image: 'assets/images/royal_reels_lvl_cards/lvl_5.jpg',
        state: _stateGetter(4),
      ),
      RoyalReelsLevelModel(
        id: 5,
        title: 'Cortyland',
        image: 'assets/images/royal_reels_lvl_cards/lvl_6.jpg',
        state: _stateGetter(5),
      ),
      RoyalReelsLevelModel(
        id: 6,
        title: 'Mountains',
        image: 'assets/images/royal_reels_lvl_cards/lvl_7.jpg',
        state: _stateGetter(6),
      ),
      RoyalReelsLevelModel(
        id: 7,
        title: 'Fayreland',
        image: 'assets/images/royal_reels_lvl_cards/lvl_8.jpg',
        state: _stateGetter(7),
      ),
      RoyalReelsLevelModel(
        id: 8,
        title: 'Wolfstar',
        image: 'assets/images/royal_reels_lvl_cards/lvl_9.jpg',
        state: _stateGetter(8),
      ),
      RoyalReelsLevelModel(
        id: 9,
        title: 'Shockingam',
        image: 'assets/images/royal_reels_lvl_cards/lvl_10.jpg',
        state: _stateGetter(9),
      ),
      RoyalReelsLevelModel(
        id: 10,
        title: 'Last Piece',
        image: 'assets/images/royal_reels_lvl_cards/lvl_11.jpg',
        state: _stateGetter(10),
      ),
    ];
  }

  static RoyalReelsLvlCardState _stateGetter(int index) {
    final currentLvl =
        appRouter.currentContext.read<UserCubit>().state.currentLvl;
    return currentLvl == index
        ? RoyalReelsLvlCardState.landOfEnemies
        : currentLvl > index
            ? RoyalReelsLvlCardState.land
            : RoyalReelsLvlCardState.closed;
  }
}
