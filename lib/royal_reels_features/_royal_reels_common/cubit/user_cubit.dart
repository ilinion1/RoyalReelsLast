import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:royal_reels/core/constants/constants.dart';
import 'package:royal_reels/core/data/local/local_storage.dart';
import 'package:royal_reels/royal_reels_features/quiz/business/models/quiz_model.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit()
      : super(const UserState(boostCount: 0, currentLvl: 0, quizes: []));

  Future<void> init() async {
    final quizeData = await LocalStorage.readJson(Pathes.royalReelsQuizes)
        .then((value) => value['quizes'] as List);
    final quizes = quizeData.map((e) => QuizModel.fromMap(e)).toList();

    final userData = LocalStorage.getStr(userKey);
    if (userData == null) {
      emit(
        state.copyWith(quizes: quizes),
      );
      return;
    }
    emit(
      state.copyWith(quizes: quizes).fromJson(userData),
    );
  }

  void addBonus() {
    setUser(
      state.copyWith(
        boostCount: state.boostCount + 1,
      ),
    );
  }

  void removeBonus() {
    setUser(
      state.copyWith(
        boostCount: state.boostCount - 1,
      ),
    );
  }

  void addLvl() {
    setUser(
      state.copyWith(
        currentLvl: state.currentLvl + 1,
      ),
    );
  }

  void setUser(UserState user) {
    LocalStorage.setVal(user.toJson(), userKey);
    emit(user);
  }
}

const userKey = 'user';
