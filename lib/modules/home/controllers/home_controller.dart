import 'package:filter_list/filter_list.dart';
import 'package:fitness_exercises_challenge/api/exports.dart';
import 'package:fitness_exercises_challenge/modules/home/data/models/type_model.dart';
import 'package:fitness_exercises_challenge/shared/controllers/serving_form_controller.dart';
import 'package:fitness_exercises_challenge/utils/enums/filter_options.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../shared/modules/exports.dart';
import '../data/models/home_model.dart';
import '../data/services/home_service.dart';

class HomeController extends ServingFormController<HomeServices> {
  HomeController() : super(HomeServices());
  HomeController.serving(super.service);
  @override
  int get inputsCount => 1;

  List<ExerciseModel> exercisesList = [];
  StringKeyedMap? parameters;
  FilterOptionModel? selectedType;
  FilterOptionModel? selectedMuscle;
  List<FilterOptionModel> selectedTypeList = [];
  List<FilterOptionModel> selectedMuscleList = [];
  List<FilterOptionModel> selectedListData = [];

  late GlobalKey<FormFieldState> key1;
  late GlobalKey<FormFieldState> key2;

  @override
  void onInit() {
    key1 = GlobalKey<FormFieldState>();
    key2 = GlobalKey<FormFieldState>();
    super.onInit();
  }

  @override
  void onReady() {
    getExercises();
    super.onReady();
  }

  void getExercises() {
    exercisesList = [];
    EasyLoading.show();
    service
        .getExercises(
          type: selectedType?.title ?? '',
          muscle: selectedMuscle?.title ?? '',
          name: inputControls.first.controller.text.trim(),
        )
        .then(
          (result) => result.fold((error) => null, (data) {
            exercisesList.addAll(data?.exercisesList ?? []);
            update();
          }),
        )
        .whenComplete(() => EasyLoading.dismiss());
  }

  int getExercisesListLength() => exercisesList.length;
  bool exercisesListIsEmpty() => exercisesList.isEmpty;
  bool selectedMuscleIsNull() => selectedMuscle == null;
  bool selectedTypeIsNull() => selectedType == null;
  ExerciseModel getItemAtIndex(int index) => exercisesList[index];
  void updateselectedType(FilterOptionModel? value) {
    selectedType = value!;
    update();
  }

  void updateselectedMuscle(FilterOptionModel? value) {
    selectedMuscle = value!;
    update();
  }

  bool checkFilterOption(String hint) => hint == FilterOptions.type.name;

  void clearSearch() {
    selectedType = null;
    selectedMuscle = null;
    inputControls.first.controller.text = '';
    performAndUpdate(exercisesList.clear);
  }

  Future<void> openFilterDialog(
    BuildContext context,
    List<FilterOptionModel> listData,
    FilterOptions option,
  ) async {
    await FilterListDialog.display<FilterOptionModel>(
      context,
      hideSelectedTextCount: true,
      themeData: FilterListThemeData(context),
      headlineText: 'Select Users',
      height: 500,
      listData: listData,
      selectedListData: selectedListData,
      choiceChipLabel: (item) => item?.title ?? '',
      validateSelectedItem: (list, val) => list!.contains(val),
      controlButtons: [ControlButtonType.Reset],
      onItemSearch: (type, query) {
        return type.title!.toLowerCase().contains(query.toLowerCase());
      },
      onApplyButtonClick: (list) {
        option == FilterOptions.type ? selectedType = list?.first : selectedMuscle = list?.first;
        update();
        Navigator.pop(context);
      },
    ).then((value) => getExercises());
  }

  @override
  void onClose() {
    selectedType = null;
    selectedMuscle = null;
    exercisesList.clear();
    super.onClose();
  }
}
