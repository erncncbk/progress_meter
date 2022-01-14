# Progress Meter

Progress meter package lets you add a beautiful progress indicator to your Flutter app.

## Installation 

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):
```yaml
dependencies:
  progress_meter: ^0.0.1
```
2. Import the package and use it in your Flutter App.
```dart
import 'package:progress_meter/progress_meter.dart';
```

## Example
There are a number of properties that you can modify:

 - begin
 - end               
 - color 
 - levelText
 - duration

<hr>
<table>
<tr>
<td>


```dart
class ProgressScreen extends StatelessWidget {  
  const ProgressScreen({Key? key}) : super(key: key);  
  
  @override  
  Widget build(BuildContext context) {  
    return Scaffold(  
      body: Center(  
        child: const ProgressMeter(
                  begin: 0.0,
                  end: 1.58,
                  color: Colors.blueGrey,
                  duration: 3,
                  levelText: "Moderate",
                ),
      ),  
    );  
  }  
}
```
![progress_meter](https://user-images.githubusercontent.com/43441567/149508790-ad8a9365-b81b-4fef-a531-9aa61171ac06.gif)

</table>