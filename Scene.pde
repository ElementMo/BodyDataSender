boolean updating = true;
int frameCountLog;
float bvhFrame;
float speedScale = 1.0;

void updateScene() {
  stroke(255);

  // model
  bvh1.update( bvhFrame );
  bvh1.draw();


  // plane
  pushMatrix();
  strokeWeight(4);
  fill(20);
  stroke(80);
  translate(0, 5, 0);
  scale(1, 0.015, 1);
  box(200);
  popMatrix();

  // Arrrows
  pushStyle();
  strokeWeight(3);

  // X
  stroke(255, 0, 0);
  line(-100, 5, 0, -120, 5, 0);

  // Y
  stroke(0, 255, 0);
  line(0, -50, 0, 0, -70, 0);

  // Z
  stroke(0, 166, 255);
  line(0, 5, 100, 0, 5, 120);

  popStyle();

  if (updating) {
    bvhFrame += speedScale;
    if (bvhFrame >= 1298)
      bvhFrame = 100;
  } else {
    bvhFrame = frameCountLog;
  }
}
