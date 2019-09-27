import netP5.*;
import oscP5.*;

// OSC
private OscP5 osc;
private NetAddress addr;
private String ipAddr = "127.0.0.1";
private int ipPort = 8002;


private void initOSC() {
  osc = new OscP5(this, 8001);
  addr = new NetAddress(ipAddr, ipPort);
}


private void sendOSC(int _node) {
  int node1_index = 0;
  if (_node == 1) {
    for (int i = 0; i < boneNodes.size(); i++) {
      if (boneNodes.get(i).node_isActive) {
        SendOneBone(node1_index, i);
        node1_index ++;
      }
    }
  } else if (_node == 2) {
    for (int i = 0; i < boneNodes.size(); i++) {
      if (boneNodes.get(i).node_isActive) {
        SendOneBone(i, i);
      }
    }
  }
}

private void SendOneBone(int node1_index, int i) {
  OscMessage msg;
  BvhBone one_bone = bvh1.getBvhBonesParser().getBones().get(i);

  PVector one_bone_vector;
  if (applyScale)
    one_bone_vector = one_bone.getAbsPosition().mult(BvhScale);
  else
    one_bone_vector = one_bone.getAbsPosition();

  msg = new OscMessage("/" + node1_index);
  msg.add(one_bone_vector.x);
  msg.add(one_bone_vector.y);
  msg.add(one_bone_vector.z);
  osc.send(msg, addr);
}


private void displayOSCMessage(int _node) {
  fill(255);
  textSize(13);
  text("Sending to   " + ipAddr + " : " + ipPort, 30, 80);
  text("At  " + milliseconds + " ms / frame", 30, 100);
  text("heading         X                      Y                        Z", 30, 140);


  int node1_index = 0;
  if (_node == 1) {
    for (int i = 0; i < boneNodes.size(); i++) {
      if (boneNodes.get(i).node_isActive) {
        DisplayOneBone(node1_index, i);
        node1_index ++;
      }
    }
  } else if (_node == 2) {
    for (int i = 0; i < boneNodes.size(); i++) {
      if (boneNodes.get(i).node_isActive) {
        DisplayOneBone(i, i);
      }
    }
  }
}

private void DisplayOneBone(int node1_index, int i) {
  BvhBone one_bone = bvh1.getBvhBonesParser().getBones().get(i);

  PVector one_bone_vector;
  if (applyScale)
    one_bone_vector = one_bone.getAbsPosition().mult(BvhScale);
  else
    one_bone_vector = one_bone.getAbsPosition();

  float _x = one_bone_vector.x;
  float _y = one_bone_vector.y;
  float _z = one_bone_vector.z;
  text("/" + node1_index, 50, 160 + 20 * node1_index);
  text(_x, 100, 160 + 20 * node1_index);
  text(_y, 200, 160 + 20 * node1_index);
  text(_z, 300, 160 + 20 * node1_index);
}
