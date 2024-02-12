// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'user_cubit.dart';

class UserState extends Equatable {
  const UserState({
    required this.quizes,
    required this.currentLvl,
    required this.boostCount,
  });
  final List<QuizModel> quizes;
  final int currentLvl;
  final int boostCount;
  @override
  List<Object> get props => [boostCount, currentLvl, quizes];

  String toJson() {
    return jsonEncode({
      'currentLvl': currentLvl,
      'boostCount': boostCount,
    });
  }

  UserState fromJson(String json) {
    final data = jsonDecode(json) as Map<String, dynamic>;

    return copyWith(
      currentLvl: data['currentLvl'],
      boostCount: data['boostCount'],
    );
  }

  UserState copyWith({
    List<QuizModel>? quizes,
    int? currentLvl,
    int? boostCount,
  }) {
    return UserState(
      quizes: quizes ?? this.quizes,
      currentLvl: currentLvl ?? this.currentLvl,
      boostCount: boostCount ?? this.boostCount,
    );
  }
}
