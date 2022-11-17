import '../../api/request_performer.dart';
import 'base_controller.dart';

abstract class ServingController<S extends RequestPerformer> extends BaseController {
  ServingController(this.service);

  S service;
}
