
class CarEngine {
  double carStartPos = -5.0;
  double joyStickPos = 0.0;
  double getCurrentPos = 10.0;
  double dy = 0.0;

  double getPos () {
    dy = ((-.2 * getCurrentPos) +
        (joyStickPos * 50.0)) * 0.033;
    getCurrentPos = dy + getCurrentPos;
    return getCurrentPos;
  }
}