import netP5.*;
import oscP5.*;


// OSC
private OscP5 osc;
private NetAddress addr;
private String ipAddr = "127.0.0.1";
private int ipPort = 8002;

private ArrayList<PVector> oscBones = new ArrayList<PVector>();

private void initOSC() {
  osc = new OscP5(this, 8001);
  addr = new NetAddress(ipAddr, ipPort);
}


private void sendOSC(int _mode) {
  OscMessage msg;

  int mode1_index = 0;
  if (_mode == 1) {
    for (int i = 0; i < boneNodes.size(); i++) {
      if (boneNodes.get(i).node_isActive) {
        BvhBone one_bone = bvh1.getBvhBonesParser().getBones().get(i);
        PVector one_bone_vector = one_bone.getAbsPosition();
        msg = new OscMessage("/" + mode1_index);
        msg.add(one_bone_vector.x);
        msg.add(one_bone_vector.y);
        msg.add(one_bone_vector.z);
        osc.send(msg, addr);
        mode1_index ++;
      }
    }
  } else if (_mode == 2) {
    for (int i = 0; i < boneNodes.size(); i++) {
      if (boneNodes.get(i).node_isActive) {
        BvhBone one_bone = bvh1.getBvhBonesParser().getBones().get(i);
        PVector one_bone_vector = one_bone.getAbsPosition();
        msg = new OscMessage("/" + i);
        msg.add(one_bone_vector.x);
        msg.add(one_bone_vector.y);
        msg.add(one_bone_vector.z);
        osc.send(msg, addr);
      }
    }
  }
}


private void displayOSCMessage(int _mode) {
  fill(255);
  textSize(13);
  text("Sending to   " + ipAddr + " : " + ipPort, 30, 80);
  text("At  " + milliseconds + " ms / frame", 30, 100);
  text("heading         X                      Y                        Z", 30, 140);


  int mode1_index = 0;
  if (_mode == 1) {
    for (int i = 0; i < boneNodes.size(); i++) {
      if (boneNodes.get(i).node_isActive) {
        BvhBone one_bone = bvh1.getBvhBonesParser().getBones().get(i);
        PVector one_bone_vector = one_bone.getAbsPosition();
        float _x = one_bone_vector.x;
        float _y = one_bone_vector.y;
        float _z = one_bone_vector.z;
        text("/" + mode1_index, 50, 160 + 20 * mode1_index);
        text(_x, 100, 160 + 20 * mode1_index);
        text(_y, 200, 160 + 20 * mode1_index);
        text(_z, 300, 160 + 20 * mode1_index);
        mode1_index ++;
      }
    }
  } 
  //   
  else if (_mode == 2) {
    for (int i = 0; i < boneNodes.size(); i++) {
      if (boneNodes.get(i).node_isActive) {
        BvhBone one_bone = bvh1.getBvhBonesParser().getBones().get(i);
        PVector one_bone_vector = one_bone.getAbsPosition();
        float _x = one_bone_vector.x;
        float _y = one_bone_vector.y;
        float _z = one_bone_vector.z;
        text("/" + i, 50, 160 + 20 * i);
        text(_x, 100, 160 + 20 * i);
        text(_y, 200, 160 + 20 * i);
        text(_z, 300, 160 + 20 * i);
      }
    }
  }
}
