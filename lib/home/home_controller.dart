import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/quiz_model.dart';
import 'package:DevQuiz/shared/widgets/progress_indicator/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'home_repository.dart';
import 'home_state.dart';

class HomeController {
  // ValueNotifier<HomeState> stateNotifier =
  //     ValueNotifier<HomeState>(HomeState.empty);

  final stateNotifier = ValueNotifier<HomeState>(HomeState.empty);

  set state(HomeState state) => stateNotifier.value = state;
  HomeState get state => stateNotifier.value;

  UserModel? user;
  List<QuizModel>? quizzes;

  final repository = HomeRepository();

  void getUser() async {
    state = HomeState.loading;
    user = await repository.getUser();
    state = HomeState.success;
  }

  void getQuizzes() async {
    state = HomeState.loading;
    quizzes = await repository.getQuizzes();
    state = HomeState.success;
  }
}
