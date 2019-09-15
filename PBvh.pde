float BvhScale = 2.0;

public class PBvh
{
  public BvhParser parser;  

  public PBvh(String[] data)
  {
    parser = new BvhParser();
    parser.init();
    parser.parse( data );
  }

  public void update( float frame )
  {
    parser.moveFrameTo((int)frame);
    parser.update();
  }

  public void draw()
  {
    fill(255);

    // for loop with index
    for ( int i=0; i<parser.getBones().size(); i++) {
      BvhBone bone = parser.getBones().get(i);

      //       Change the color on the skeleton in real-time
      if (boneNodes.get(i).state == State.Pressed) {
        stroke(255, 0, 0);
      } else {
        stroke(255);
      }

      strokeWeight(8);
      //text(i, -bone.absPos.x*BvhScale, -bone.absPos.y*BvhScale, -bone.absPos.z*BvhScale);
      point(-bone.absPos.x*BvhScale, -bone.absPos.y*BvhScale, -bone.absPos.z*BvhScale);
      
      if (!bone.hasChildren()) {
        strokeWeight(12);
        //text(i, -bone.absEndPos.x*BvhScale, -bone.absEndPos.y*BvhScale, -bone.absEndPos.z*BvhScale);
        point(-bone.absEndPos.x*BvhScale, -bone.absEndPos.y*BvhScale, -bone.absEndPos.z*BvhScale);
      }
    }
  }

  BvhParser getBvhBonesParser() {
    return parser;
  }
}
