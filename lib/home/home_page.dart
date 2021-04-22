// import 'package:DevQuiz/challenge/widgets/quiz/quiz_widget.dart';
import 'package:DevQuiz/core/app_colors.dart';
import 'package:DevQuiz/home/home_controller.dart';
import 'package:DevQuiz/home/home_state.dart';
import 'package:DevQuiz/home/widgets/appbar/app_bar_widget.dart';
import 'package:DevQuiz/home/widgets/quiz_card/quiz_card_widget.dart';
import 'package:DevQuiz/home/widgets/level_button/level_button_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
    controller.stateNotifier.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    if (controller.state == HomeState.success) {
      return Scaffold(
        appBar: AppBarWidget(user: controller.user!),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(
                height: 32,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    LevelButtonWidget(label: 'Fácil'),
                    SizedBox(width: 10),
                    LevelButtonWidget(label: 'Médio'),
                    SizedBox(width: 10),
                    LevelButtonWidget(label: 'Difícil'),
                    SizedBox(width: 10),
                    LevelButtonWidget(label: 'Perito'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  crossAxisCount: 2,
                  children: controller.quizzes!
                      .map(
                        (element) => QuizCardWidget(
                          title: element.title,
                          completed:
                              '${element.questionAnswered}/${element.questions.length}',
                          percent: element.questionAnswered /
                              element.questions.length,
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
          ),
        ),
      );
    }
  }
}

// class HomePage extends StatefulWidget {
//   HomePage({Key? key}) : super(key: key);

//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final controller = HomeController();

//   @override
//   void initState() {
//     super.initState();
//     controller.getUser();
//     controller.getQuizzes();
//     controller.stateNotifier.addListener(() {
//       setState(() {});
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (controller.state == HomeState.success) {
//       return Scaffold(
//         appBar: AppBarWidget(user: controller.user!),
//         body: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 24,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   LevelButtonWidget(
//                     label: "Fácil",
//                   ),
//                   LevelButtonWidget(
//                     label: "Médio",
//                   ),
//                   LevelButtonWidget(
//                     label: "Difícil",
//                   ),
//                   LevelButtonWidget(
//                     label: "Perito",
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 24,
//               ),
//               Expanded(
//                 child: GridView.count(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                   children: controller.quizzes!
//                       .map((e) => QuizCardWidget(
//                             title: e.title,
//                             completed:
//                                 "${e.questionAnswered}/${e.questions.length}",
//                             percent: e.questionAnswered / e.questions.length,
//                           ))
//                       .toList(),
//                 ),
//               )
//             ],
//           ),
//         ),
//       );
//     } else {
//       return Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(
//             valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
//           ),
//         ),
//       );
//     }
//   }
// }
