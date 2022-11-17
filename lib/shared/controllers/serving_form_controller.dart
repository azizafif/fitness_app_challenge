import 'package:flutter/material.dart';

import '../../api/request_performer.dart';
import '../models/input_control.dart';
import 'serving_controller.dart';

abstract class ServingFormController<S extends RequestPerformer> extends ServingController<S> {
  ServingFormController(super.service);

  late List<InputControl> inputControls;
  final formKey = GlobalKey<FormState>();

  int get inputsCount;

  @override
  @mustCallSuper
  void onInit() {
    inputControls = InputControl.generate(inputsCount);
    super.onInit();
  }

  @override
  @mustCallSuper
  void onClose() {
    inputControls.dispose();
    super.onClose();
  }
}
