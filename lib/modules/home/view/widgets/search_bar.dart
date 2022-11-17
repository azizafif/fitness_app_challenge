import 'package:fitness_exercises_challenge/app/design/app_images.dart';
import 'package:fitness_exercises_challenge/app/design/index.dart';
import 'package:fitness_exercises_challenge/modules/data/data.dart';
import 'package:fitness_exercises_challenge/shared/widgets/index.dart';
import 'package:fitness_exercises_challenge/utils/enums/filter_options.dart';

import '../../../../shared/modules/exports.dart';
import '../../index.dart';

class SearchBar extends StatefulWidget with PreferredSizeWidget {
  SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
  @override
  Size get preferredSize => const Size.fromHeight(100);
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const VerticalSpacing(10),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                        child: Input(
                      controls: controller.inputControls,
                      index: 0,
                      hintText: "Search an exercise",
                      onEditingComplete: () => controller.getExercises(),
                    )),
                  ),
                  const HorizontalSpacing(10),
                  Expanded(
                    flex: 1,
                    child: Container(
                      height: 43,
                      margin: const EdgeInsets.only(bottom: 9),
                      decoration:
                          BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(AppValues.defaultRadius)),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Image(
                          image: AppImages.clearFilter,
                          height: 30,
                        ),
                        onPressed: () => controller.clearSearch(),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: TextButton(
                          onPressed: () {
                            controller.openFilterDialog(context, typeList, FilterOptions.type);
                          },
                          child: Text(
                            controller.selectedTypeIsNull() ? 'Type' : controller.selectedType!.title!,
                            overflow: TextOverflow.ellipsis,
                          ))),
                  const HorizontalSpacing(7),
                  Expanded(
                      flex: 2,
                      child: TextButton(
                          onPressed: () {
                            controller.openFilterDialog(context, musculeList, FilterOptions.muscle);
                          },
                          child: Text(
                            controller.selectedMuscleIsNull() ? 'Muscle' : controller.selectedMuscle!.title!,
                            overflow: TextOverflow.ellipsis,
                          ))),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
