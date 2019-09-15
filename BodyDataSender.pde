BvhParser parserA = new BvhParser();
PBvh bvh1;

PImage baiIcon;
float camX, camY = 0;

public void settings() {  
  size( 1280, 720, P3D );
  smooth(8);
  PJOGL.setIcon("bai.png");
}

public void setup()
{  
  frameRate( 60 );

  bvh1 = new PBvh( loadStrings( "A_test.bvh" ) );

  initGUI();
  initTable();
  readTable(boneNodes);
  initOSC();
}

public void draw()
{
  background( 51 );

  //  SCENE
  ////////////////////////////////////////////
  pushMatrix();
  pushStyle();
  translate(width/2, height/2+100);
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
  updateOscBones();  
  if (byIndex)
    displayOSCMessage_2();
  else
    displayOSCMessage();
  ///////////////////////////////////////////


  // Osc
  //////////////////////////////////////////
  if (byIndex)
    sendOSC_2();
  else
    sendOSC();
  clearOscBones();
  //////////////////////////////////////////
}
