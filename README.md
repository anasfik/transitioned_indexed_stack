Animated Indexed Stack
This package aims to help you implement the `IndexedStack` widget for flutter, but with animations.



# What it offers

  - Fade Indexed Stack
  - Scale Indexed Stack
  - Slide Indexed Stack
    - Slide Up IndexedStack
    - Slide Down IndexedStack
    - Slide Right IndexedStack
    - Slide Left IndexedStack
  - Size Factor Inexed Stack
  - Rotation Indexed Stack
  - Diagonal Indexed Stack

All widgets offered by this package have the same properties as the pre-built Flutter `IndexedStack` widget, in addition of some useful properties which control the animations.
  
  # Demo App
 <a href="">Download Here</a>
  
  
  # Documentation:
  ## Fade Indexed Stack
  placeholder
  
  ``` dart
    FadeIndexedStack(
        beginOpacity: 0.0,
        endOpacity: 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),
  ```

#### Properties

| property | Description | type |
| --- | --- | --- |
| `beginOpacity` | The Initial Fade Opacity Animation Value  | `double` |
| `endOpacity` | The End Fade Opacity Animation Value  | `double` |
| `curve` | The Animation Curve  | `Curve` |
| `duration` | The Animation duration ( need a hot restart to see changes ) | `Duration` |

## Scale Indexed Stack
placeholder
```dart
  ScaleIndexedStack(
        beginScale: 0.0,
        endScale: 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),
```

#### Properties

| property | Description | type |
| --- | --- | --- |
| `beginScale` | The Initial Scale Animation Value  | `double` |
| `endScale` | The End Scale Animation Value  | `double` |
| `curve` | The Animation Curve  | `Curve` |
| `duration` | The Animation duration ( need a hot restart to see changes ) | `Duration` |


## Slide Indexed Stack
placeholder
```dart
  SlideIndexedStack(
        endSlideOffset: const Offset(0.5, 1),
        beginSlideOffset: const Offset(0.0, 0.0),
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),
```

#### Properties

| property | Description | type |
| --- | --- | --- |
| `endSlideOffset` | The Offset From Where The Animations Starts  | `Offset` |
| `beginSlideOffset` | The Offset From Where The Animations Ends  | `Offset` |
| `curve` | The Animation Curve  | `Curve` |
| `duration` | The Animation duration ( need a hot restart to see changes ) | `Duration` |

<br>
You can also use the built-in `up`, `down`, `right`, `left` directions slide indexed stack:

- ### Slide Up IndexedStack
      
      SlideIndexedStack.up(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),
      
- ### Slide Down IndexedStack
    
      SlideIndexedStack.down(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),
      
- ### Slide Right IndexedStack
    
      SlideIndexedStack.right(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),
      
- ### Slide Left IndexedStack
    
      SlideIndexedStack.left(
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),
      

## Size Factor Inexed Stack
placeholder
```dart
   SizeFactorIndexedStack(
        beginSizeFactor: 0.0,
        endSizeFactor: 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),
```

#### Properties

| property | Description | type |
| --- | --- | --- |
| `beginSizeFactor` | The Initial Size Factor Animation Value  | `double` |
| `endSizeFactor` | The End Size Factor Animation Value  | `double` |
| `curve` | The Animation Curve  | `Curve` |
| `duration` | The Animation duration ( need a hot restart to see changes ) | `Duration` |


## Size Factor Inexed Stack
placeholder
```dart
  RotationIndexedStack(
        beginTurn: 0.0,
        endTurn: 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),

```

#### Properties

| property | Description | type |
| --- | --- | --- |
| `beginTurn` | The Initial Rotation Turn Animation Value | `double` |
| `endTurn` | The End Rotation Turn Animation Value | `double` |
| `curve` | The Animation Curve  | `Curve` |
| `duration` | The Animation duration ( need a hot restart to see changes ) | `Duration` |

## Size Factor Inexed Stack
placeholder

```dart
  RotationIndexedStack(
        beginTurn: 0.0,
        endTurn: 1.0,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 250),
        index: 1,
        children: const <Widget>[
          Center(
            child: Text("Child 1"),
          ),
          Center(
            child: Text("Child 2"),
          ),
        ],
      ),

```

#### Properties

| property | Description | type |
| --- | --- | --- |
| `beginTurn` | The Initial Rotation Turn Animation Value | `double` |
| `endTurn` | The End Rotation Turn Animation Value | `double` |
| `curve` | The Animation Curve  | `Curve` |
| `duration` | The Animation duration ( need a hot restart to see changes ) | `Duration` |
