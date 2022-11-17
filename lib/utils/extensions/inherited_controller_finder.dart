import 'package:fitness_exercises_challenge/shared/modules/inherited_controller.dart';

import '../../shared/controllers/exports.dart';

extension InheritedControllerFinder on BuildContext {
  T find<T extends BaseController>() => dependOnInheritedWidgetOfExactType<InheritedController<T>>()?.controller ?? Get.find<T>();
}
