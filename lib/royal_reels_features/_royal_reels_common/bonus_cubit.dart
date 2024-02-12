// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:royal_reels/core/data/local/local_storage.dart';
import 'package:royal_reels/core/extensions/parser_extensions.dart';

class BonusCubit extends Cubit<BonusState> {
  BonusCubit()
      : super(
          BonusState(
              timeLeft: 'time',
              lastGetted: DateTime.now(),
              bonusAvailable: false),
        );

  Future<void> init() async {
    final time = LocalStorage.getStr('bonusTime');
    final lastGetted = DateTime.parse(time ??
        DateTime(
          1999,
        ).toString());
    final timeLeftDuration = DateTime.now().difference(state.lastGetted);
    emit(
      BonusState(
        timeLeft: formatDuration(Duration(days: 1) - timeLeftDuration),
        lastGetted: lastGetted,
        // bonusAvailable: true,
        bonusAvailable: timeLeftDuration >= const Duration(hours: 24),
      ),
    );
    startTimer();
  }

  void startTimer() async {
    while (!state.bonusAvailable) {
      await Future.delayed(1000.msDuration);
      final timeLeftDuration = DateTime.now().difference(state.lastGetted);
      emit(
        state.copyWith(
          timeLeft: formatDuration(Duration(days: 1) - timeLeftDuration),
          bonusAvailable: timeLeftDuration >= const Duration(hours: 24),
        ),
      );
    }
  }

  void getBonus() async {
    await LocalStorage.setVal<String>(DateTime.now().toString(), 'bonusTime');
    emit(
      state.copyWith(
        bonusAvailable: false,
        lastGetted: DateTime.now(),
        timeLeft: formatDuration(const Duration(hours: 24)),
      ),
    );
    startTimer();
  }

  String formatDuration(Duration duration) {
    int hours = duration.inHours;
    int minutes = (duration.inMinutes % 60);
    int seconds = (duration.inSeconds % 60);

    // Format the time as HH:mm:ss
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return formattedTime;
  }
}

class BonusState extends Equatable {
  final String timeLeft;
  final DateTime lastGetted;
  final bool bonusAvailable;
  const BonusState({
    required this.timeLeft,
    required this.lastGetted,
    required this.bonusAvailable,
  });

  @override
  List<Object> get props => [timeLeft, lastGetted, bonusAvailable];

  BonusState copyWith({
    String? timeLeft,
    DateTime? lastGetted,
    bool? bonusAvailable,
  }) {
    return BonusState(
      timeLeft: timeLeft ?? this.timeLeft,
      lastGetted: lastGetted ?? this.lastGetted,
      bonusAvailable: bonusAvailable ?? this.bonusAvailable,
    );
  }

  @override
  bool get stringify => true;
}
