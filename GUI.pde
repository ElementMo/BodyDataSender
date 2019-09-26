import controlP5.*;

// GUI
private ControlP5 cp5;
private boolean applyScale;
private boolean byIndex;

private void initGUI() {
  mouseY = 100;
  cp5 = new ControlP5(this);

  cp5.addSlider("TimeLine").setSize(1190, 20).setPosition(20, 20).setRange(0, 1300).setFont(createFont("arial", 12));
  cp5.addSlider("Scale").setSize(200, 20).setPosition((width >> 1) - 100, (height >> 1) + 210).setRange(1, 3).setValue(2).setFont(createFont("arial", 12));
  cp5.addSlider("SpeedScale").setSize(200, 20).setPosition((width >> 1) - 100, (height >> 1) + 300).setRange(0.1f, 2).setValue(0.8f).setFont(createFont("arial", 12));
  cp5.addToggle("ApplyScale").setPosition((width >> 1) - 100, (height >> 1) + 250).setSize(50, 20).setFont(createFont("arial", 12));
  cp5.addToggle("Pause").setPosition((width >> 1) + 50, (height >> 1) + 250).setSize(50, 20).setFont(createFont("arial", 12));
  cp5.addToggle("ByIndex").setPosition(390, 122).setSize(50, 20).setFont(createFont("arial", 12));
  cp5.addTextfield("IP").setPosition(280, 60).setSize(100, 25).setAutoClear(false).setFont(createFont("arial", 12));
  cp5.addTextfield("PORT").setPosition(390, 60).setSize(60, 25).setAutoClear(false).setFont(createFont("arial", 12));
  cp5.addTextfield("MilliSeconds").setPosition(460, 60).setSize(60, 25).setAutoClear(false).setFont(createFont("arial", 12));
}

private void updateGUI() {
  cp5.getController("TimeLine").setValue(bvhFrame);
}

public void TimeLine(int frame) {
  if (mouseY < 40) {
    bvhFrame = frame;
    frameCountLog = frame;
  }
}

public void Scale(float _scale) {
  BvhScale = _scale;
}

public void SpeedScale(float _speedScale) {
  speedScale = _speedScale;
}

public void ApplyScale(boolean _flag) {
  applyScale = _flag;
}

public void Pause(boolean _pause) {
  updating = !_pause;
  if (!updating) {
    frameCountLog = (int) bvhFrame;
  }
}

public void ByIndex(boolean _byIndex) {
  byIndex = _byIndex;
}

public void IP(String _ip) {
  ipAddr = _ip;
  osc.stop();
  initOSC();
}

public void PORT(String _port) {
  ipPort = Integer.parseInt(_port);
  osc.stop();
  initOSC();
}

public void MilliSeconds(String _milliSeconds) {
  milliseconds = Integer.parseInt(_milliSeconds);
  task.setPeriod(milliseconds);
}
