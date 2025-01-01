enum GoalFilterTypes {
  Personal,
  Food,
  Environment,
  Educate,
}

class GoalFilterController {
  Set<GoalFilterTypes> selectedFilters = {};

  String getEnumDescription(GoalFilterTypes enumValue) {
    final Map<GoalFilterTypes, String> enumToStringMap = {
      GoalFilterTypes.Personal: 'Establish a sustainable garden for personal enjoyment.',
      GoalFilterTypes.Food: 'Grow my own food to reduce costs and improve health.',
      GoalFilterTypes.Environment: 'Contribute positively to the environment.',
      GoalFilterTypes.Educate: 'Educate myself and others about sustainable living.',
    };

    return enumToStringMap[enumValue] ?? 'Unknown';
  }

  void setFilters(List<String> filters) {
    selectedFilters =
        filters.map((filter) => GoalFilterTypes.values.firstWhere((element) => element.toString() == filter)).toSet();
  }

  void addFilter(GoalFilterTypes filter) {
    selectedFilters.add(filter);
  }

  void removeFilter(GoalFilterTypes filter) {
    selectedFilters.remove(filter);
  }

  List<String> getFilters() {
    return selectedFilters.map((filter) => filter.toString()).toList();
  }
}
