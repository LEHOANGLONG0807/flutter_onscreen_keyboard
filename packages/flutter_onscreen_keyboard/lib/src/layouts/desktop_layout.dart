import 'package:flutter/material.dart';
import 'package:flutter_onscreen_keyboard/flutter_onscreen_keyboard.dart';
import 'package:flutter_onscreen_keyboard/src/constants/action_key_type.dart';

/// A complete QWERTY desktop keyboard layout excluding the number pad.
///
/// This layout includes rows of alphabetic keys, number keys, symbols,
/// and common action keys like backspace, tab, capslock, enter, and shift.
///
/// Use this layout with [OnscreenKeyboard] for a desktop-style experience.
class DesktopKeyboardLayout extends KeyboardLayout {
  /// Creates a [DesktopKeyboardLayout] instance.
  const DesktopKeyboardLayout();

  @override
  double get aspectRatio => 5 / 2;

  @override
  Map<String, KeyboardMode> get modes => {
    'default': KeyboardMode(rows: _defaultMode),
  };

  List<KeyboardRow> get _defaultMode => [
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.text(primary: 'Q', secondary: '1'),
        OnscreenKeyboardKey.text(primary: 'W', secondary: '2'),
        OnscreenKeyboardKey.text(primary: 'E', secondary: '3'),
        OnscreenKeyboardKey.text(primary: 'R', secondary: '4'),
        OnscreenKeyboardKey.text(primary: 'T', secondary: '5'),
        OnscreenKeyboardKey.text(primary: 'Y', secondary: '6'),
        OnscreenKeyboardKey.text(primary: 'U', secondary: '7'),
        OnscreenKeyboardKey.text(primary: 'I', secondary: '8'),
        OnscreenKeyboardKey.text(primary: 'O', secondary: '9'),
        OnscreenKeyboardKey.text(primary: 'P', secondary: '0'),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.empty(),
        OnscreenKeyboardKey.text(primary: 'A', secondary: '+'),
        OnscreenKeyboardKey.text(primary: 'S', secondary: '-'),
        OnscreenKeyboardKey.text(primary: 'D', secondary: '/'),
        OnscreenKeyboardKey.text(primary: 'F', secondary: '.'),
        OnscreenKeyboardKey.text(primary: 'G', secondary: '?'),
        OnscreenKeyboardKey.text(primary: 'H', secondary: ':'),
        OnscreenKeyboardKey.text(primary: 'J', secondary: r'$'),
        OnscreenKeyboardKey.text(primary: 'K', secondary: ';'),
        OnscreenKeyboardKey.text(primary: 'L', secondary: ','),
        OnscreenKeyboardKey.empty(),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.action(
          name: ActionKeyType.shift,
          canHold: true,
          child: Center(
            child: Text(
              '!#1',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
          ),
          childPressed: Center(
            child: Text(
              'ABC',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
          ),
          flex: 30,
        ),
        OnscreenKeyboardKey.text(primary: 'Z', secondary: '!'),
        OnscreenKeyboardKey.text(primary: 'X', secondary: '@'),
        OnscreenKeyboardKey.text(primary: 'C', secondary: '#'),
        OnscreenKeyboardKey.text(primary: 'V', secondary: '%'),
        OnscreenKeyboardKey.text(primary: 'B', secondary: '&'),
        OnscreenKeyboardKey.text(primary: 'N', secondary: '('),
        OnscreenKeyboardKey.text(primary: 'M', secondary: ')'),
        OnscreenKeyboardKey.action(
          name: ActionKeyType.backspace,
          child: Icon(
            Icons.backspace_outlined,
            size: 50,
            color: Colors.red,
          ),
          flex: 30,
        ),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.text(
          primary: ' ',
          child: Icon(Icons.space_bar_rounded),
        ),
      ],
    ),
  ];
}

class DesktopKeyboardEmailLayout extends KeyboardLayout {
  /// Creates a [DesktopKeyboardEmailLayout] instance.
  const DesktopKeyboardEmailLayout();

  @override
  double get aspectRatio => 5 / 2;

  @override
  Map<String, KeyboardMode> get modes => {
    'default': KeyboardMode(rows: _defaultMode),
  };

  List<KeyboardRow> get _defaultMode => [
    KeyboardRow(
      keys: [
        for (final c in ['@gmail.com', '@yahoo.com', '@outlook.com', '@icloud.com', '@hotmail.com'])
          OnscreenKeyboardKey.text(primary: c.toUpperCase()),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.text(primary: 'Q', secondary: '1'),
        OnscreenKeyboardKey.text(primary: 'W', secondary: '2'),
        OnscreenKeyboardKey.text(primary: 'E', secondary: '3'),
        OnscreenKeyboardKey.text(primary: 'R', secondary: '4'),
        OnscreenKeyboardKey.text(primary: 'T', secondary: '5'),
        OnscreenKeyboardKey.text(primary: 'Y', secondary: '6'),
        OnscreenKeyboardKey.text(primary: 'U', secondary: '7'),
        OnscreenKeyboardKey.text(primary: 'I', secondary: '8'),
        OnscreenKeyboardKey.text(primary: 'O', secondary: '9'),
        OnscreenKeyboardKey.text(primary: 'P', secondary: '0'),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.empty(),
        OnscreenKeyboardKey.text(primary: 'A', secondary: '+'),
        OnscreenKeyboardKey.text(primary: 'S', secondary: '-'),
        OnscreenKeyboardKey.text(primary: 'D', secondary: '/'),
        OnscreenKeyboardKey.text(primary: 'F', secondary: '.'),
        OnscreenKeyboardKey.text(primary: 'G', secondary: '?'),
        OnscreenKeyboardKey.text(primary: 'H', secondary: ':'),
        OnscreenKeyboardKey.text(primary: 'J', secondary: r'$'),
        OnscreenKeyboardKey.text(primary: 'K', secondary: ';'),
        OnscreenKeyboardKey.text(primary: 'L', secondary: ','),
        OnscreenKeyboardKey.empty(),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.action(
          name: ActionKeyType.shift,
          canHold: true,
          child: Center(
            child: Text(
              '!#1',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
          ),
          childPressed: Center(
            child: Text(
              'ABC',
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w500),
            ),
          ),
          flex: 30,
        ),
        OnscreenKeyboardKey.text(primary: 'Z', secondary: '!'),
        OnscreenKeyboardKey.text(primary: 'X', secondary: '_'),
        OnscreenKeyboardKey.text(primary: 'C', secondary: '#'),
        OnscreenKeyboardKey.text(primary: 'V', secondary: '%'),
        OnscreenKeyboardKey.text(primary: 'B', secondary: '&'),
        OnscreenKeyboardKey.text(primary: 'N', secondary: '('),
        OnscreenKeyboardKey.text(primary: 'M', secondary: ')'),
        OnscreenKeyboardKey.action(
          name: ActionKeyType.backspace,
          child: Icon(
            Icons.backspace_outlined,
            size: 50,
            color: Colors.red,
          ),
          flex: 30,
        ),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.text(primary: '@', flex: 1),
        OnscreenKeyboardKey.text(
          primary: ' ',
          flex: 5,
          child: Icon(Icons.space_bar_rounded),
        ),
        OnscreenKeyboardKey.text(primary: '.COM', flex: 1),
      ],
    ),
  ];
}

class DesktopKeyboardNumberLayout extends KeyboardLayout {
  /// Creates a [DesktopKeyboardNumberLayout] instance.
  const DesktopKeyboardNumberLayout();

  @override
  double get aspectRatio => 5 / 2;

  @override
  Map<String, KeyboardMode> get modes => {
    'default': KeyboardMode(rows: _defaultMode),
  };

  List<KeyboardRow> get _defaultMode => [
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.text(primary: '1'),
        OnscreenKeyboardKey.text(primary: '2'),
        OnscreenKeyboardKey.text(primary: '3'),
        OnscreenKeyboardKey.action(
          name: ActionKeyType.backspace,
          child: Icon(
            Icons.backspace_outlined,
            size: 50,
            color: Colors.red,
          ),
        ),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.text(primary: '4'),
        OnscreenKeyboardKey.text(primary: '5'),
        OnscreenKeyboardKey.text(primary: '6'),
        OnscreenKeyboardKey.text(primary: '-'),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.text(primary: '7'),
        OnscreenKeyboardKey.text(primary: '8'),
        OnscreenKeyboardKey.text(primary: '9'),
        OnscreenKeyboardKey.text(primary: '.'),
      ],
    ),
    const KeyboardRow(
      keys: [
        OnscreenKeyboardKey.empty(),
        OnscreenKeyboardKey.text(primary: '0'),
        OnscreenKeyboardKey.empty(),
        OnscreenKeyboardKey.text(primary: ','),
      ],
    ),
  ];
}
