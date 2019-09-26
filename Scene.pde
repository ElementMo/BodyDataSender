// Scene
private boolean updating = true;
private int frameCountLog;
private float bvhFrame;
private float speedScale = 1.0f;

private void updateScene() {
  stroke(255);

  // model
  bvh1.update(bvhFrame);
  bvh1.draw();


  // plane
  pushMatrix();
  strokeWeight(4);
  fill(20);
  stroke(80);
  translate(0, 5, 0);
  scale(1, 0.015f, 1);
  box(200);
  popMatrix();

  // Arrows
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
    if (bvhFrame >= 1299)
      bvhFrame = 100;
  } else {
    bvhFrame = frameCountLog;
  }
}
