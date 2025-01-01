class QuestionController {
  Map<String, Set<String>> selectedFilters = {};

  void setFilters(String question, List<String> filters) {
    selectedFilters[question] = filters.toSet();
  }

  void addFilter(String question, String filter) {
    selectedFilters.putIfAbsent(question, () => {}).add(filter);
  }

  void removeFilter(String question, String filter) {
    selectedFilters[question]?.remove(filter);
  }

  List<String> getFilters(String question) {
    return selectedFilters[question]?.toList() ?? [];
  }
}
