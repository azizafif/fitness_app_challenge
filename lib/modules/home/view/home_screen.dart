import 'package:fitness_exercises_challenge/app/design/app_colors.dart';
import 'package:fitness_exercises_challenge/app/design/app_images.dart';
import 'package:fitness_exercises_challenge/modules/home/index.dart';
import 'package:fitness_exercises_challenge/modules/home/view/widgets/search_bar.dart';

import '../../../shared/modules/exports.dart';
import '../../../shared/widgets/index.dart';
import 'widgets/exercises_details_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return SmartScaffold(
            backgroundColor: Colors.grey[200],
            body: RefreshIndicator(
              color: AppColors.primaryColor,
              backgroundColor: AppColors.warningColor,
              onRefresh: () async => controller.getExercises(),
              child: Form(
                key: controller.formKey,
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      title: Text(
                        "Fitness App",
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.white),
                      ),
                      backgroundColor: Colors.green,
                      pinned: true,
                      bottom: SearchBar(),
                    ),
                    !controller.exercisesListIsEmpty()
                        ? SliverFixedExtentList(
                            itemExtent: 170,
                            delegate: SliverChildBuilderDelegate(
                              (context, index) => Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: ExercisesDetailsCard(
                                    currentElement: controller.getItemAtIndex(index),
                                  )),
                              childCount: controller.getExercisesListLength(),
                            ),
                          )
                        : SliverToBoxAdapter(
                            child: Column(
                              children: [
                                const VerticalSpacing(100),
                                const Image(image: AppImages.logo),
                                Center(
                                    child: Text(
                                  "No result found!",
                                  style: Theme.of(context).textTheme.headline5,
                                )),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
