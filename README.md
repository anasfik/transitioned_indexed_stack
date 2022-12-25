# Transitioned Indexed Stack

This Package helps You Making Animated Transitions between IndexedStack children widgets Easily.

# What it offers

- Fade Indexed Stack
- Scale Indexed Stack
- Slide Indexed Stack
  - Slide Up IndexedStack
  - Slide Down IndexedStack
  - Slide Right IndexedStack
  - Slide Left IndexedStack
- Size Factor Indexed Stack
- Rotation Indexed Stack
- Diagonal Indexed Stack
- Shake Indexed Stack

All widgets offered by this package have the same properties as the pre-built Flutter `IndexedStack` widget, in addition of some useful properties which control the animations.

# Demo App

<a href="https://github.com/anasfik/transitioned_indexed_stack/releases/tag/examples">Download Here</a>

  <hr>
 
# Usage:

## Fade Indexed Stack

### Showcase :

  <p align="center"><img  height='560' src="https://imgur.com/7Z6mler.gif" /></p>
    
   ### Code :

```dart
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

| property       | Description                                                  | type       |
| -------------- | ------------------------------------------------------------ | ---------- |
| `beginOpacity` | The Initial Fade Opacity Animation Value                     | `double`   |
| `endOpacity`   | The End Fade Opacity Animation Value                         | `double`   |
| `curve`        | The Animation Curve                                          | `Curve`    |
| `duration`     | The Animation duration ( need a hot restart to see changes ) | `Duration` |

  <hr>
  
## Scale Indexed Stack
  ### Showcase :
  <p align="center"><img  height='560' src="https://imgur.com/sTLCdoh.gif" /></p>
  
 ### Code :

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

| property     | Description                                                  | type       |
| ------------ | ------------------------------------------------------------ | ---------- |
| `beginScale` | The Initial Scale Animation Value                            | `double`   |
| `endScale`   | The End Scale Animation Value                                | `double`   |
| `curve`      | The Animation Curve                                          | `Curve`    |
| `duration`   | The Animation duration ( need a hot restart to see changes ) | `Duration` |

  <hr>
  
## Slide Indexed Stack
  ### Showcase :

  <p align="center"><img  height='560' src="https://imgur.com/YBeKTD2.gif" /></p>

### Code :

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

| property           | Description                                                  | type       |
| ------------------ | ------------------------------------------------------------ | ---------- |
| `endSlideOffset`   | The Offset From Where The Animations Starts                  | `Offset`   |
| `beginSlideOffset` | The Offset From Where The Animations Ends                    | `Offset`   |
| `curve`            | The Animation Curve                                          | `Curve`    |
| `duration`         | The Animation duration ( need a hot restart to see changes ) | `Duration` |

<hr>
 
## Size Factor Indexed Stack
  ### Showcase :

  <p align="center"><img  height='560' src="https://i.imgur.com/0X2ZVNS.gif.gif" /></p>
  
### Code :

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

| property          | Description                                                  | type       |
| ----------------- | ------------------------------------------------------------ | ---------- |
| `beginSizeFactor` | The Initial Size Factor Animation Value                      | `double`   |
| `endSizeFactor`   | The End Size Factor Animation Value                          | `double`   |
| `curve`           | The Animation Curve                                          | `Curve`    |
| `duration`        | The Animation duration ( need a hot restart to see changes ) | `Duration` |

  <hr>
  
  
## Rotation Indexed Stack

### Showcase :

  <p align="center"><img  height='560' src="https://imgur.com/TvErp1y.gif" /></p>
  
  
### Code :
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

````

#### Properties

| property    | Description                                                  | type       |
| ----------- | ------------------------------------------------------------ | ---------- |
| `beginTurn` | The Initial Rotation Turn Animation Value                    | `double`   |
| `endTurn`   | The End Rotation Turn Animation Value                        | `double`   |
| `curve`     | The Animation Curve                                          | `Curve`    |
| `duration`  | The Animation duration ( need a hot restart to see changes ) | `Duration` |

  <hr>

## Shake Indexed Stack
  ### Showcase :


<p align="center"><img  height='560' src="https://imgur.com/FFeqDCI.gif" /></p>


### Code :

```dart
ShakeIndexedStack(
        shakesCount: 100,
        shakeFrequency: 0.04,
        duration: const Duration(milliseconds: 250),
        curve: Curves.slowMiddle,
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

````

#### Properties

| property         | Description                                                                    | type       |
| ---------------- | ------------------------------------------------------------------------------ | ---------- |
| `shakesCount`    | This represent how much times a shake should be triggered during the animation | `double`   |
| `shakeFrequency` | THis represents the shake frequency                                            | `double`   |
| `curve`          | The Animation Curve                                                            | `Curve`    |
| `duration`       | The Animation duration ( need a hot restart to see changes )                   | `Duration` |
