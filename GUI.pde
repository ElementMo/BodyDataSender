import controlP5.*;

ControlP5 cp5;
boolean applyScale;
boolean byIndex;

void initGUI() {
  mouseY = 100;
  cp5 = new ControlP5(this);

  cp5.addSlider("TimeLine").setSize(1190, 20).setPosition(20, 20).setRange(0, 1300).setFont(createFont("arial", 12));
  cp5.addSlider("Scale").setSize(200, 20).setPosition(width/2-100, height/2+200).setRange(1, 3).setValue(2).setFont(createFont("arial", 12));
  cp5.addSlider("SpeedScale").setSize(200, 20).setPosition(width/2-100, height/2+300).setRange(0.1, 2).setValue(0.8).setFont(createFont("arial", 12));
  cp5.addToggle("ApplyScale").setPosition(width/2-100, height/2+250).setSize(50, 20).setFont(createFont("arial", 12));
  cp5.addToggle("Pause").setPosition(width/2+50, height/2+250).setSize(50, 20).setFont(createFont("arial", 12));
  cp5.addToggle("ByIndex").setPosition(390, 122).setSize(50, 20).setFont(createFont("arial", 12));
  cp5.addTextfield("IP").setPosition(280, 60).setSize(100, 25).setAutoClear(false).setFont(createFont("arial", 12));
  cp5.addTextfield("PORT").setPosition(390, 60).setSize(60, 25).setAutoClear(false).setFont(createFont("arial", 12));
}

void updateGUI() {
  cp5.getController("TimeLine").setValue(bvhFrame);
}


void TimeLine(int frame) {
  //if (cp5.isMouseOver()) {
  if (mouseY < 40) {
    bvhFrame = frame;
    frameCountLog = frame;
  }
  //}
}

void Scale(float _scale) {
  BvhScale = _scale;
}

void SpeedScale(float _speedScale) {
  speedScale = _speedScale;
}

void ApplyScale(boolean _flag) {
  applyScale = _flag;
}

void Pause(boolean _pause) {
  updating = !_pause;
  if (!updating) {
    frameCountLog = (int)bvhFrame;
  }
}

void ByIndex(boolean _byIndex) {
  byIndex = _byIndex;
}


void IP(String _ip) {
  ipAddr = _ip;
  osc.stop();
  initOSC();
}

void PORT(String _port) {
  ipPort = Integer.parseInt(_port);
  osc.stop();
  initOSC();
}
