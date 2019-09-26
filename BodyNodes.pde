private int NODE_NUM = 0;
private final int NODE_RADIANS = 13;
private ArrayList<BodyNode> boneNodes = new ArrayList<BodyNode>();


private void drawNodes() {
  for (int i = 0; i < NODE_NUM; i++) {
    boneNodes.get(i).state = State.Normal;

    if (PVector.dist(new PVector(pmouseX, pmouseY), boneNodes.get(i).node_pos) < NODE_RADIANS) {
      boneNodes.get(i).state = State.Hover;
    }

    if (boneNodes.get(i).node_isActive) {
      boneNodes.get(i).state = State.Pressed;
    }

    boneNodes.get(i).draw();
  }
}
