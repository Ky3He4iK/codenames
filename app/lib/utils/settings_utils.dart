

class Utils {
  static List<int> teamSizes = [16, 20, 25, 30, 36, 42, 49];

  static int getField(int prev, int curr) {
    int ind = teamSizes.indexOf(prev);
    if (prev > curr && ind > 0) {
      ind--;
    } else if (prev < curr && ind + 1 < teamSizes.length) {
      ind++;
    }
    return teamSizes[ind];
  }
}