// import 'package:flutter/material.dart';
// import '../../../../models/question_model.dart';
// import '../../../../rest_models/question.dart';
// import 'answer_button.dart';

// class QuestionList extends StatefulWidget {
//   int questionIndex;
//   bool selectedAnswer;
//   Function callback;

//   QuestionList({
//     Key? key,
//     required this.questionIndex,
//     required this.selectedAnswer,
//     required this.callback,
//   }) : super(key: key);

//   @override
//   State<QuestionList> createState() => _QuestionListState();
// }

// class _QuestionListState extends State<QuestionList> {
//   int score = 0;
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List<QuestionModel>>(
//       future: fetchJson(),
//       builder: ((context, data) {
//         List<QuestionModel> list = data.data ?? [];
//         if (data.hasError) {
//           return Center(
//             child: Text("${data.error}"),
//           );
//         } else if (data.hasData && list.isNotEmpty) {
//           QuestionModel question = list[widget.questionIndex];
//           return Column(
//             children: [
//               Text(
//                 question.question,
//                 style: const TextStyle(
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               const SizedBox(
//                 height: 12.0,
//               ),
//               AbsorbPointer(
//                 absorbing: widget.selectedAnswer,
//                 child: Column(
//                   children: List.generate(question.answers.length, (index) {
//                     return AnswerButton(
//                       answerText: question.answers[index],
//                       correctAnswer: question.correctAnswer,
//                       questionIndex: widget.questionIndex,
//                       callback: (answerIsCorrect) {
//                         setState(() {
//                           widget.selectedAnswer = true;

//                           if (answerIsCorrect) {
//                             score++;
//                           }

//                           // widget.callback(score);
//                           // widget.callback();
//                         });
//                       },
//                     );
//                   }),
//                 ),
//               ),
//             ],
//           );
//         }
//         return const Text('Something went wrong!');
//       }),
//     );
//   }
// }
