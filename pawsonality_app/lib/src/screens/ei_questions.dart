import 'package:flutter/material.dart';

import 'package:pawsonality_app/src/controllers/ei_controller.dart';
import 'package:pawsonality_app/src/widgets/option_selector.dart';

class OnboardGoal extends StatefulWidget {
  final PageController pageController;
  final GoalFilterController controller;
  const OnboardGoal({required this.pageController, required this.controller, super.key});

  @override
  State<OnboardGoal> createState() => _OnboardGoalState();
}

class _OnboardGoalState extends State<OnboardGoal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32.0),
      color: const Color(0xFFF2F0DB),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Spacer(),
          const Text(
            'What do you hope to achieve? ',
            style: TextStyle(
                color: Color(0xFF45423F),
                fontSize: 28.0,
                height: 1.035,
                fontFamily: 'AvantGarde LT',
                fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Let’s get to know your goals in becoming a Land Steward.',
            style: TextStyle(color: Color(0xFF45423F), fontFamily: 'AvantGarde LT', fontSize: 16.0),
          ),
          const SizedBox(height: 16.0),
          OptionSelector<GoalFilterTypes>(
            options: GoalFilterTypes.values,
            getDescription: widget.controller.getEnumDescription,
            selectedOptions: widget.controller.selectedFilters,
            onSelected: (option, selected) {
              setState(() {
                if (selected) {
                  widget.controller.selectedFilters.add(option);
                } else {
                  widget.controller.selectedFilters.remove(option);
                }
              });
            },
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: const Color(0xFF45423F),
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 20.0),
                ),
                onPressed: widget.controller.selectedFilters.isNotEmpty
                    ? () {
                        widget.pageController.nextPage(
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    : null,
                child: const Text('NEXT',
                    style: TextStyle(
                        color: Color(0xFFF2F0DB),
                        fontSize: 16.0,
                        fontFamily: 'AvantGarde LT',
                        fontWeight: FontWeight.w700))),
          ),
        ],
      ),
    );
  }
}
