import 'dart:io';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart totals.dart <inputFile.csv>');
    exit(1);
  }
  final inputFile = arguments.first;
  final lines = File(inputFile).readAsLinesSync();
  final totaldurationByTag = <String, double>{};
  lines.removeAt(0);
  for (var line in lines) {
    final values = line.split(',');
    final durationStr = values[3].replaceAll('"', '');
    final duration = double.parse(durationStr);
    final tag = values[5].replaceAll('"', '');
    final previousTotal = totaldurationByTag[tag];
    if (previousTotal == null) {
      totaldurationByTag[tag] = duration;
    } else {
      totaldurationByTag[tag] = previousTotal + duration;
    }
  }
  for (var entry in totaldurationByTag.entries) {
    final durationFamatted = entry.value.toStringAsFixed(1);
    final tag = entry.key == '' ? 'Unallocated' : entry.key;
    print('$tag: ${durationFamatted}h');
  }
}
// lines = readFile(inputFile)
// durationByTag = empty map
// lines.removeFirst()
// for (line in lines)
// value = line.split(',')
// duration = value [3]
// tag = values [5]
// tag = values [5]
// end
// printAll(durationByTag)
