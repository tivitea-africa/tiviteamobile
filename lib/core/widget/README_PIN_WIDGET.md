# Custom PIN Widget

A highly customizable PIN input widget for Flutter applications with support for various configurations and use cases.

## Features

- ✅ **Customizable PIN length** - Set any number of digits
- ✅ **Optional built-in text field** - Use with or without the text field
- ✅ **Controller support** - Full TextEditingController integration
- ✅ **Haptic feedback** - Optional vibration feedback on input
- ✅ **Fully customizable styling** - Colors, sizes, borders, fonts
- ✅ **Multiple callbacks** - onChanged, onCompleted, onSubmit
- ✅ **Adaptive design** - Works in modals, dialogs, scaffolds
- ✅ **Proper disposal** - Automatic controller cleanup
- ✅ **Obscure text support** - Hide PIN with custom characters
- ✅ **Disabled state** - Support for disabled/enabled states
- ✅ **Responsive design** - Uses flutter_screenutil for scaling

## Basic Usage

```dart
import 'package:your_app/core/widget/custom_pin_widget.dart';

// Basic 4-digit PIN
CustomPinWidget(
  pinCount: 4,
  onCompleted: (pin) {
    print('PIN completed: $pin');
  },
)
```

## Advanced Usage

```dart
CustomPinWidget(
  pinCount: 6,
  controller: myPinController,
  enableHapticFeedback: true,
  showTextField: true,
  numberBackgroundColor: Colors.blue[50],
  numberTextColor: const Color(0xFF000050),
  numberWidth: 70.w,
  numberHeight: 70.h,
  numberBorderRadius: 35.r,
  onCompleted: (pin) => handlePinCompleted(pin),
  onChanged: (pin) => handlePinChanged(pin),
  onSubmit: (pin) => handlePinSubmit(pin),
)
```

## Parameters

### Required Parameters

| Parameter | Type | Description |
|-----------|------|-------------|
| `pinCount` | `int?` | Number of PIN digits required (optional if showTextField is false) |

### Optional Parameters

#### Controller & Behavior
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `controller` | `TextEditingController?` | `null` | External controller (creates internal if null) |
| `showTextField` | `bool` | `true` | Whether to show the built-in text field |
| `enabled` | `bool` | `true` | Whether the widget is enabled |
| `autoFocus` | `bool` | `false` | Auto-focus the text field |
| `focusNode` | `FocusNode?` | `null` | External focus node |

#### Callbacks
| Parameter | Type | Description |
|-----------|------|-------------|
| `onCompleted` | `Function(String)?` | Called when PIN reaches full length |
| `onChanged` | `Function(String)?` | Called on every PIN change |
| `onSubmit` | `Function(String)?` | Called when PIN is submitted |

#### Haptic Feedback
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `enableHapticFeedback` | `bool` | `false` | Enable vibration feedback |

#### Text Field Styling
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `textFieldSpacing` | `double` | `10.0` | Spacing between text field and number pad |
| `textInputAction` | `TextInputAction?` | `TextInputAction.done` | Text input action |
| `keyboardType` | `TextInputType?` | `TextInputType.number` | Keyboard type |
| `obscureText` | `bool` | `false` | Hide PIN text |
| `obscureCharacter` | `String` | `'•'` | Character for obscured text |

#### Number Button Styling
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `numberBackgroundColor` | `Color?` | `Colors.transparent` | Background color |
| `numberTextColor` | `Color?` | `Color(0xFF000050)` | Text color |
| `numberWidth` | `double?` | `60.w` | Button width |
| `numberHeight` | `double?` | `60.h` | Button height |
| `numberBorderRadius` | `double?` | `30.r` | Border radius |
| `numberBorder` | `Border?` | `null` | Border |
| `numberFontSize` | `double?` | `24.sp` | Font size |
| `numberFontWeight` | `FontWeight?` | `FontWeight.w600` | Font weight |

#### Delete Button Styling
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `showDeleteButton` | `bool` | `true` | Show delete button |
| `deleteButtonColor` | `Color?` | `Colors.transparent` | Background color |
| `deleteIconColor` | `Color?` | `Color(0xFF000050)` | Icon color |
| `deleteIcon` | `IconData?` | `Icons.backspace_outlined` | Icon |

#### Layout
| Parameter | Type | Default | Description |
|-----------|------|---------|-------------|
| `numberSpacing` | `double` | `8.0` | Spacing between number buttons |
| `rowSpacing` | `double` | `12.0` | Spacing between rows |

## Controller Methods

The widget provides extension methods for easy controller access:

```dart
// Clear the PIN
pinController.clearPin();

// Get current PIN value
String pin = pinController.pinValue;

// Check if PIN is complete
bool isComplete = pinController.isPinComplete;

// Get PIN length
int length = pinController.pinLength;
```

## Use Cases

### 1. Basic PIN Input
```dart
CustomPinWidget(
  pinCount: 4,
  onCompleted: (pin) => validatePin(pin),
)
```

### 2. PIN with External Controller
```dart
final pinController = TextEditingController();

CustomPinWidget(
  pinCount: 6,
  controller: pinController,
  onCompleted: (pin) => handlePin(pin),
)

// Later...
pinController.clearPin();
```

### 3. PIN without Text Field
```dart
CustomPinWidget(
  pinCount: 4,
  showTextField: false,
  onCompleted: (pin) => handlePin(pin),
)
```

### 4. Unlimited Input (No PIN Count)
```dart
CustomPinWidget(
  showTextField: false,
  onChanged: (pin) => handleInput(pin),
  onSubmit: (pin) => handleSubmit(pin),
)
```

### 5. Obscured PIN
```dart
CustomPinWidget(
  pinCount: 4,
  obscureText: true,
  obscureCharacter: '🔒',
  onCompleted: (pin) => handlePin(pin),
)
```

### 6. Custom Styled PIN
```dart
CustomPinWidget(
  pinCount: 6,
  enableHapticFeedback: true,
  numberBackgroundColor: Colors.blue[50],
  numberTextColor: Colors.blue[800],
  numberWidth: 80.w,
  numberHeight: 80.h,
  numberBorderRadius: 40.r,
  numberBorder: Border.all(color: Colors.blue[200]!),
  onCompleted: (pin) => handlePin(pin),
)
```

### 7. In Modal/Dialog
```dart
showModalBottomSheet(
  context: context,
  builder: (context) => CustomPinWidget(
    pinCount: 4,
    enableHapticFeedback: true,
    onCompleted: (pin) => Navigator.pop(context, pin),
  ),
);
```

## Best Practices

1. **Controller Management**: Always dispose controllers when using external ones
2. **Responsive Design**: Use flutter_screenutil values (`.w`, `.h`, `.sp`, `.r`) for consistent scaling
3. **Accessibility**: Consider adding semantic labels for screen readers
4. **Error Handling**: Implement proper validation in callback functions
5. **Performance**: Avoid rebuilding the widget unnecessarily

## Example Implementation

See `pin_widget_example.dart` for comprehensive usage examples including:
- Basic usage
- Customized styling
- Modal integration
- Dialog integration
- Obscured text
- Disabled states
- Unlimited input scenarios

## Dependencies

- `flutter_screenutil` - For responsive design
- `flutter/services` - For haptic feedback

## Notes

- The widget automatically handles controller disposal for internal controllers
- Focus nodes are properly managed and disposed
- The widget is adaptive and works in various contexts (modals, dialogs, etc.)
- All styling parameters are optional with sensible defaults
- The widget follows Material Design principles while being highly customizable
- When `showTextField` is false, `pinCount` is optional and allows unlimited input
- When `showTextField` is true, `pinCount` must be provided and greater than 0