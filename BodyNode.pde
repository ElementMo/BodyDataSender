
public class BodyNode {
  int ball_index;
  PVector node_pos;
  Boolean node_isActive;
  State state;

  BodyNode(int _index, PVector _pos) {
    ball_index = _index;
    node_pos = _pos;
    node_isActive = false;
  }

  void draw() {
    switch(state) {
    case Normal:
      fill(255);
      break;
    case Hover:
      fill(0, 180, 250);
      break;
    case Pressed:
      fill(250, 100, 150);
      break;
    }
    ellipse(node_pos.x, node_pos.y, NODE_RADIANS*2, NODE_RADIANS*2);

    textSize(13);
    fill(0);
    text(ball_index, node_pos.x-6, node_pos.y+3);
  }
}
