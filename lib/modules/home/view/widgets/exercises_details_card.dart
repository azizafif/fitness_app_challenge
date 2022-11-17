import 'package:fitness_exercises_challenge/modules/home/data/models/home_model.dart';

import '../../../../app/design/index.dart';
import '../../../../shared/modules/exports.dart';
import '../../../../shared/widgets/index.dart';

class ExercisesDetailsCard extends StatelessWidget {
  const ExercisesDetailsCard({
    Key? key,
    required this.currentElement,
  }) : super(key: key);

  final ExerciseModel currentElement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: AppValues.bodyMinSymetricHorizontalPadding,
      ),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CaracteristicWidget(
                exercise: 'Name',
                value: currentElement.name,
              ),
              _CaracteristicWidget(
                exercise: 'Type',
                value: currentElement.type.toString(),
              ),
              _CaracteristicWidget(
                exercise: 'Muscle',
                value: currentElement.muscle.toString(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CaracteristicWidget extends StatelessWidget {
  _CaracteristicWidget({
    required this.exercise,
    required this.value,
  });

  String exercise;
  String? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 110,
            child: Text(exercise, style: Theme.of(context).textTheme.titleMedium),
          ),
          const HorizontalSpacing(12),
          Flexible(
            child: Text(value ?? 'Not specified', style: Theme.of(context).textTheme.titleMedium),
          ),
        ],
      ),
    );
  }
}
