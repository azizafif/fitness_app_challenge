import '../../../shared/modules/exports.dart';
import '../controllers/home_controller.dart';
import '../view/home_screen.dart';

final homeModule = GetPage(
  name: '/homeModule',
  page: () => const InheritanceProviderOf<HomeController>(across: HomeScreen()),
  binding: BindingsBuilder.put(() => HomeController()),
);
