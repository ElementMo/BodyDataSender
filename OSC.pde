import netP5.*;
import oscP5.*;

OscP5 osc;
NetAddress addr;
String ipAddr = "127.0.0.1";
int ipPort = 8002;

ArrayList<PVector> oscBones = new ArrayList<PVector>();

void initOSC() {
  osc = new OscP5(this, 8001);
  addr = new NetAddress(ipAddr, ipPort);
}


void sendOSC() {
  OscMessage msg;
  for (int i=0; i<oscBones.size(); i++) {
    msg = new OscMessage("/"+i);
    msg.add(oscBones.get(i).x);
    msg.add(oscBones.get(i).y);
    msg.add(oscBones.get(i).z);
    osc.send(msg, addr);
  }
}
void sendOSC_2() {
  OscMessage msg;
  for (int i=0; i<boneNodes.size(); i++) {
    if (boneNodes.get(i).node_isActive) {
      BvhBone one_bone = bvh1.getBvhBonesParser().getBones().get(i);
      PVector one_bone_vector = one_bone.getAbsPosition();
      msg = new OscMessage("/"+i);
      msg.add(one_bone_vector.x);
      msg.add(one_bone_vector.y);
      msg.add(one_bone_vector.z);
      osc.send(msg, addr);
    }
  }
}

void displayOSCMessage() {
  fill(255);
  textSize(13);
  text("Sending to   " + ipAddr +" : " +ipPort, 30, 80);
  text("heading         X                      Y                        Z", 30, 140);
  for (int i=0; i<oscBones.size(); i++) {
    float _x = oscBones.get(i).x;
    float _y = oscBones.get(i).y;
    float _z = oscBones.get(i).z;
    text("/"+i, 50, 160 + 20*i);
    text(_x, 100, 160 + 20*i);
    text(_y, 200, 160 + 20*i);
    text(_z, 300, 160 + 20*i);
  }
}

void displayOSCMessage_2() {
  fill(255);
  textSize(13);
  text("Sending to   " + ipAddr +" : " +ipPort, 30, 80);
  text("heading         X                      Y                        Z", 30, 140);
  for (int i=0; i<boneNodes.size(); i++) {
    if (boneNodes.get(i).node_isActive) {
      BvhBone one_bone = bvh1.getBvhBonesParser().getBones().get(i);
      PVector one_bone_vector = one_bone.getAbsPosition();
      float _x = one_bone_vector.x;
      float _y = one_bone_vector.y;
      float _z = one_bone_vector.z;
      text("/"+i, 50, 160 + 20*i);
      text(_x, 100, 160 + 20*i);
      text(_y, 200, 160 + 20*i);
      text(_z, 300, 160 + 20*i);
    }
  }
}
