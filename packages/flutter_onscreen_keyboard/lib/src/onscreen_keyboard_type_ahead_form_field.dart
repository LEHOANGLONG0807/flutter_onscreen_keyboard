part of 'onscreen_keyboard.dart';

/// A [TypeAheadFormField] that works with [OnscreenKeyboard].
///
/// This widget behaves like [OnscreenKeyboardTextFormField],
/// but integrates a [TypeAheadFormField] instead of a plain TextFormField.
class OnscreenKeyboardTypeAheadFormField<T> extends StatefulWidget {
  const OnscreenKeyboardTypeAheadFormField({
    required this.onSuggestionSelected,
    required this.itemBuilder,
    required this.suggestionsCallback,
    super.key,
    this.enableOnscreenKeyboard = true,
    this.controller,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.onSaved,
    this.initialValue,
    this.suggestionsBoxDecoration = const SuggestionsBoxDecoration(),
    this.suggestionsBoxController,
    this.noItemsFoundBuilder,
    this.loadingBuilder,
    this.debounceDuration = const Duration(milliseconds: 300),
    this.maxLines = 1,
  });

  final bool enableOnscreenKeyboard;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final InputDecoration? decoration;
  final TextInputType? keyboardType;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final FormFieldSetter<String>? onSaved;
  final String? initialValue;
  final int? maxLines;

  final SuggestionsBoxDecoration suggestionsBoxDecoration;
  final SuggestionsBoxController? suggestionsBoxController;
  final WidgetBuilder? noItemsFoundBuilder;
  final WidgetBuilder? loadingBuilder;
  final Duration debounceDuration;

  final ItemBuilder<T> itemBuilder;
  final SuggestionsCallback<T> suggestionsCallback;
  final SuggestionSelectionCallback<T> onSuggestionSelected;

  @override
  State<OnscreenKeyboardTypeAheadFormField<T>> createState() =>
      _OnscreenKeyboardTypeAheadFormFieldState<T>();
}

class _OnscreenKeyboardTypeAheadFormFieldState<T>
    extends State<OnscreenKeyboardTypeAheadFormField<T>>
    implements OnscreenKeyboardFieldState {
  TextEditingController get _effectiveController =>
      widget.controller ?? (_controller ??= TextEditingController());
  TextEditingController? _controller;

  FocusNode get _effectiveFocusNode => widget.focusNode ?? (_focusNode ??= FocusNode());
  FocusNode? _focusNode;

  late final OnscreenKeyboardController _keyboard;

  @override
  void initState() {
    super.initState();
    _keyboard = OnscreenKeyboard.of(context);
    _effectiveFocusNode.addListener(_onFocusChanged);
  }

  @override
  void dispose() {
    _keyboard.detachTextField(this);
    _effectiveFocusNode.removeListener(_onFocusChanged);
    _focusNode?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  void _onFocusChanged() {
    if (!widget.enableOnscreenKeyboard) return;
    if (_effectiveFocusNode.hasPrimaryFocus) {
      _keyboard
        ..attachTextField(this)
        ..open();
    } else {
      _keyboard.close();
    }
  }

  @override
  TextEditingController get controller => _effectiveController;

  @override
  FocusNode get focusNode => _effectiveFocusNode;

  @override
  int? get maxLines => widget.maxLines;

  @override
  List<TextInputFormatter>? get inputFormatters => null;

  @override
  ValueChanged<String>? get onChanged => widget.onChanged;

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField<T>(
      textFieldConfiguration: TextFieldConfiguration(
        controller: _effectiveController,
        focusNode: _effectiveFocusNode,
        keyboardType:
            widget.enableOnscreenKeyboard
                ? TextInputType.none
                : widget.keyboardType ?? TextInputType.text,
        decoration: widget.decoration ?? const InputDecoration(),
        onChanged: widget.onChanged,
      ),
      initialValue: widget.initialValue,
      onSaved: widget.onSaved,
      validator: widget.validator,
      suggestionsBoxDecoration: widget.suggestionsBoxDecoration,
      suggestionsBoxController: widget.suggestionsBoxController,
      noItemsFoundBuilder: widget.noItemsFoundBuilder,
      loadingBuilder: widget.loadingBuilder,
      debounceDuration: widget.debounceDuration,
      itemBuilder: widget.itemBuilder,
      suggestionsCallback: widget.suggestionsCallback,
      onSuggestionSelected: widget.onSuggestionSelected,
    );
  }
}
