import '../modules/exports.dart';

class InputControl {
  final TextEditingController controller;
  final FocusNode node;
  final GlobalKey key;

  InputControl({
    required this.key,
    required this.controller,
    required this.node,
  });

  static List<InputControl> generate(int count) => List<InputControl>.generate(
        count,
        (index) => InputControl(
          key: GlobalKey(debugLabel: index.toString()),
          controller: TextEditingController(),
          node: FocusNode(),
        ),
      );
}

extension InputControlsListDisposer on List<InputControl> {
  void dispose() => forEach((element) => {element.controller.dispose(), element.node.dispose()});
}


//   @protected
//   @optionalTypeArgs
//   @nonVirtual
//   @factory
//   @pragma('vm:notify-debugger-on-exception')
