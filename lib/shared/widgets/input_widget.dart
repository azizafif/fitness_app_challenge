import 'package:fitness_exercises_challenge/shared/models/input_control.dart';
import 'package:flutter/services.dart';

import '../../app/design/index.dart';
import '../modules/exports.dart';

class Input extends BaseInput {
  Input({
    super.keyed = true,
    required super.controls,
    required super.index,
    required super.hintText,
    super.enabled = true,
    super.keyboardType,
    super.isPassword = false,
    super.onTap,
    super.onChanged,
    super.onEditingComplete,
    super.onFieldSubmitted,
    super.suffixIcon,
    super.prefixIcon,
    super.maxLength = AppValues.inputMaxLength,
    super.maxLines,
    super.displayCounter = false,
    super.validator,
    super.inputFormatters,
  }) : super(key: keyed ? controls[index].key : null);

  @override
  State<Input> createState() => _InputWidgetState();
}

class _InputWidgetState extends State<Input> {
  bool protectedText = true;
  late TextEditingController controller;
  late FocusNode? node;
  int? nextIndex;

  @override
  void initState() {
    controller = widget.controls[widget.index].controller;
    node = widget.keyed ? widget.controls[widget.index].node : null;
    if (widget.index + 1 < widget.controls.length) nextIndex = widget.index + 1;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.subtitle1?.copyWith(height: 1.5),
      enabled: widget.enabled,
      controller: controller,
      inputFormatters: widget.inputFormatters,
      focusNode: node,
      obscureText: !widget.isPassword ? false : protectedText,
      keyboardType: widget.keyboardType,
      onChanged: widget.onChanged,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.disabled,
      onTap: widget.onTap,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      onEditingComplete: _onEditingComplete,
      onFieldSubmitted: widget.onFieldSubmitted,
      maxLength: widget.isPassword ? AppValues.passwordInputMaxLength : widget.maxLength,
      decoration: _decoration(context),
      buildCounter: (_, {int? currentLength, bool? isFocused, int? maxLength}) =>
          (!widget.displayCounter || controller.text.isEmpty)
              ? const SizedBox(height: 4)
              : Text('$currentLength/$maxLength', style: Theme.of(context).textTheme.bodySmall),
    );
  }

  void _onEditingComplete() {
    widget.onEditingComplete?.call();
    nextIndex != null ? widget.controls[nextIndex!].node.requestFocus() : node?.unfocus();
  }

  InputDecoration _decoration(BuildContext context) {
    return InputDecoration(
        hintStyle: Theme.of(context).textTheme.bodyMedium,
        hintText: widget.hintText,
        isDense: true,
        prefixIcon: widget.prefixIcon,
        errorMaxLines: 3,
        contentPadding: EdgeInsets.only(right: widget.suffixIcon == null ? 26 : 0, top: 15, bottom: 6, left: 10),
        suffixIcon: widget.suffixIcon);
  }
}

abstract class BaseInput extends StatefulWidget {
  BaseInput({
    Key? key,
    required this.controls,
    required this.index,
    this.keyed = true,
    this.enabled = true,
    required this.hintText,
    this.keyboardType,
    this.isPassword = false,
    this.onTap,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.suffixIcon,
    this.prefixIcon,
    this.maxLength = AppValues.inputMaxLength,
    this.maxLines = 1,
    this.displayCounter = false,
    this.validator,
    this.inputFormatters,
  })  : assert(
          0 <= index && index < controls.length,
          '[InputWidget]   MAKE SURE    0 <= index  < controls.length',
        ),
        super(key: keyed ? controls[index].key : null);

  bool get isValid => validator?.call(controls[index].controller.text) == null;

  final List<InputControl> controls;
  final int index;

  final bool keyed;
  final bool enabled;
  final String hintText;
  final TextInputType? keyboardType;
  final bool isPassword;

  final List<TextInputFormatter>? inputFormatters;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onFieldSubmitted;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int? maxLength;
  final int? maxLines;
  final bool displayCounter;
  final String? Function(String?)? validator;
}
