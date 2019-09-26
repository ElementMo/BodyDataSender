// IO
private Table nodePosTable;

private void initTable() {
  nodePosTable = new Table();
  nodePosTable.addColumn("x");
  nodePosTable.addColumn("y");
}

private void updateTable(ArrayList<BodyNode> _nodes) {
  nodePosTable.clearRows();
  for (BodyNode node : _nodes) {
    TableRow newRow = nodePosTable.addRow();
    newRow.setFloat("x", node.node_pos.x);
    newRow.setFloat("y", node.node_pos.y);
  }
  saveTable(nodePosTable, "data/nodePosTable.csv");
}

private void readTable(ArrayList<BodyNode> _nodes) {
  Table tempTable = loadTable("data/nodePosTable.csv", "header");
  _nodes.clear();
  NODE_NUM = tempTable.getRowCount();
  for (int i = 0; i < tempTable.getRowCount(); i++) {
    _nodes.add(new BodyNode(i, new PVector(tempTable.getRow(i).getInt("x"), tempTable.getRow(i).getInt("y"))));
  }
}


public void mouseDragged() {
  if (mouseButton == RIGHT) {
    camX += (mouseX - pmouseX) * 0.3f;
    camY += (mouseY - pmouseY) * 0.5f;
  }
}

public void mousePressed() {
  if (mouseButton == LEFT) {
    for (int i = 0; i < NODE_NUM; i++) {
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

public void mouseReleased() {
  //if (mouseButton == LEFT) {
  //  for (int i=0; i<NODE_NUM; i++) {
  //    if (PVector.dist(new PVector(pmouseX, pmouseY), boneNodes.get(i).node_pos) < NODE_RADIANS) {
  //      boneNodes.get(i).node_isActive = false;
  //    }
  //  }
  //}
}

public void keyPressed() {
  if (key == 's') {
    updateTable(boneNodes);
    println("saved!");
  } else if (key == 'r') {
    readTable(boneNodes);
    println("loaded!");
  }
}
