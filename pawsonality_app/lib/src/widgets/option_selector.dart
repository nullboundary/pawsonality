import 'package:flutter/material.dart';

class OptionSelector<T extends Enum> extends StatelessWidget {
  final List<T> options;
  final String Function(T) getDescription;
  final Set<T> selectedOptions;
  final void Function(T, bool) onSelected;

  const OptionSelector({
    required this.options,
    required this.getDescription,
    required this.selectedOptions,
    required this.onSelected,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      direction: Axis.vertical,
      spacing: 8.0,
      children: options.map((T option) {
        return FilterChip(
          backgroundColor: const Color(0xFFF2F0DB),
          visualDensity: const VisualDensity(horizontal: 0.0, vertical: -4.0),
          showCheckmark: false,
          padding: const EdgeInsets.all(16.0),
          label: SizedBox(
              width: 275,
              // height: 50,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    selectedOptions.contains(option) ? Icons.check : Icons.add,
                    color: const Color(0xFF45423F),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      getDescription(option),
                      style: const TextStyle(
                          color: Color(0xFF45423F),
                          fontSize: 16.0,
                          fontFamily: 'AvantGarde LT',
                          fontWeight: FontWeight.w500,
                          height: 1.5),
                      textAlign: TextAlign.left,
                      softWrap: true,
                      maxLines: 3,
                    ),
                  ),
                ],
              )),
          selectedColor: const Color(0x995D7B1E),
          selected: selectedOptions.contains(option),
          onSelected: (bool selected) {
            onSelected(option, selected);
          },
        );
      }).toList(),
    );
  }
}
