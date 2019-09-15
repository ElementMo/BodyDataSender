int NODE_NUM = 0;
final int NODE_RADIANS = 13;
ArrayList<BodyNode> boneNodes = new ArrayList<BodyNode>();

void updateOscBones() {
  for (int i=0; i<boneNodes.size(); i++) {
    if (boneNodes.get(i).node_isActive) {
      BvhBone one_bone = bvh1.getBvhBonesParser().getBones().get(i);
      
      if (applyScale)
        oscBones.add(one_bone.absPos.mult(BvhScale));
      else
        oscBones.add(one_bone.absPos);
    }
  }
}
void clearOscBones() {
  oscBones.clear();
}


void drawNodes() {
  for (int i=0; i<NODE_NUM; i++) {
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
