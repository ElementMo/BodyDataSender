Table nodePosTable;

void initTable() {
  nodePosTable = new Table();
  nodePosTable.addColumn("x");
  nodePosTable.addColumn("y");
}
void updateTable(ArrayList<BodyNode> _nodes) {
  nodePosTable.clearRows();
  for (int i=0; i<_nodes.size(); i++) {
    TableRow newRow = nodePosTable.addRow();
    newRow.setFloat("x", _nodes.get(i).node_pos.x);
    newRow.setFloat("y", _nodes.get(i).node_pos.y);
  }
  saveTable(nodePosTable, "data/nodePosTable.csv");
}

void readTable(ArrayList<BodyNode> _nodes) {
  Table tempTable = loadTable("data/nodePosTable.csv", "header");
  _nodes.clear();
  NODE_NUM = tempTable.getRowCount();
  for (int i=0; i<tempTable.getRowCount(); i++) {
    _nodes.add(new BodyNode(i, new PVector(tempTable.getRow(i).getInt("x"), tempTable.getRow(i).getInt("y"))));
  }
}




void mouseDragged() {
  if (mouseButton == RIGHT) {
    camX += (mouseX-pmouseX)*0.3;
    camY += (mouseY-pmouseY)*0.5;
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    for (int i=0; i<NODE_NUM; i++) {
      if (PVector.dist(new PVector(pmouseX, pmouseY), boneNodes.get(i).node_pos) < NODE_RADIANS) {
        boneNodes.get(i).node_isActive = !boneNodes.get(i).node_isActive;
      }
    }
  } 

  //if (mouseButton == LEFT) {
  //  for (int i=0; i<NODE_NUM; i++) {
  //    if (PVector.dist(new PVector(pmouseX, pmouseY), boneNodes.get(i).node_pos) < NODE_RADIANS) {
  //      boneNodes.get(i).node_isActive = true;
  //    }
  //  }
  //} 
  //
  //else if (mouseButton == RIGHT) {
  //  boneNodes.add(new BodyNode(NODE_NUM, new PVector(mouseX, mouseY)));
  //  NODE_NUM ++;
  //}
}

void mouseReleased() {  
  //if (mouseButton == LEFT) {
  //  for (int i=0; i<NODE_NUM; i++) {
  //    if (PVector.dist(new PVector(pmouseX, pmouseY), boneNodes.get(i).node_pos) < NODE_RADIANS) {
  //      boneNodes.get(i).node_isActive = false;
  //    }
  //  }
  //}
}

void keyPressed() {
  if (key == 's') {  
    updateTable(boneNodes);    
    println("saved!");
  } else if (key == 'r') {
    readTable(boneNodes);    
    println("loaded!");
  }
}
