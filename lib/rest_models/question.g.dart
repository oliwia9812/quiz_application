// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Results _$ResultsFromJson(Map<String, dynamic> json) => Results(
      response_code: json['response_code'] as int?,
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ResultsToJson(Results instance) => <String, dynamic>{
      'response_code': instance.response_code,
      'results': instance.results,
    };

Question _$QuestionFromJson(Map<String, dynamic> json) => Question(
      category: json['category'] as String?,
      correct_answer: json['correct_answer'] as String?,
      difficulty: json['difficulty'] as String?,
      incorrect_answers: (json['incorrect_answers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      question: json['question'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$QuestionToJson(Question instance) => <String, dynamic>{
      'category': instance.category,
      'correct_answer': instance.correct_answer,
      'difficulty': instance.difficulty,
      'incorrect_answers': instance.incorrect_answers,
      'question': instance.question,
      'type': instance.type,
    };
