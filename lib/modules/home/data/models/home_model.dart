import '../../../../api/exports.dart';

class ExerciseModel {
  ExerciseModel({
    this.name,
    this.type,
    this.muscle,
    this.equipment,
    this.difficulty,
    this.instructions,
  });

  String? name;
  String? type;
  String? muscle;
  String? equipment;
  String? difficulty;
  String? instructions;

  factory ExerciseModel.fromJson(Map<String, dynamic> json) => ExerciseModel(
        name: json["name"],
        type: json["type"] ?? '',
        muscle: json["muscle"] ?? '',
        equipment: json["equipment"] ?? '',
        difficulty: json["difficulty"] ?? '',
        instructions: json["instructions"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "type": type,
        "muscle": muscle,
        "equipment": equipment,
        "difficulty": difficulty,
        "instructions": instructions,
      };
}

class ExercisesListModel extends ModelingProtocol {
  List<ExerciseModel>? exercisesList = [];

  ExercisesListModel({this.exercisesList});

  @override
  ExercisesListModel? fromJson(dynamic json) => ExercisesListModel(
        exercisesList: (json as List?)?.map((element) => ExerciseModel.fromJson(element as StringKeyedMap)).toList(),
      );

  @override
  List<Object?> get props => [exercisesList];
}
