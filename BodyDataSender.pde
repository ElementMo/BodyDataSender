private PBvh bvh1;
private float camX, camY = 0;
int milliseconds = 500;


public void settings() {
  size(1280, 720, P3D);
  smooth(8);
  PJOGL.setIcon("bai.png");
}

public void setup() {
  frameRate(60);

  bvh1 = new PBvh(loadStrings("A_test.bvh"));

  initGUI();
  initTable();
  readTable(boneNodes);
  initOSC();
  initTimer();
}

public void draw() {
  background(51);

  //  SCENE
  ////////////////////////////////////////////
  pushMatrix();
  pushStyle();
  translate(width >> 1, (height >> 1) + 100);
  rotateY(camX * DEG_TO_RAD);
  rotateX(-camY * DEG_TO_RAD);

  updateScene();

  popStyle();
  popMatrix();
  ////////////////////////////////////////////


  //  GUI
  ///////////////////////////////////////////
  updateGUI();
  drawNodes();

  if (byIndex)
    displayOSCMessage(2);
  else
    displayOSCMessage(1);
  ///////////////////////////////////////////
}
