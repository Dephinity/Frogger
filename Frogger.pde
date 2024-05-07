public Frog frog;
public Lane[] lanes;

public final int SAFE = 0;
public final int CAR_ID = 1;
public final int LOG_ID = 2;
public final float grid = 50;

public void setup() {
  size(500, 450);
  reset();

  int totalLanes = int(height / grid);
  lanes = new Lane[totalLanes];

  lanes[0] = new Lane(0, color(0, 150, 80));
  lanes[1] = new Lane(1, LOG_ID, 3, 1.5, 200, 2.5, color(50, 100, 200));
  lanes[2] = new Lane(2, LOG_ID, 3, 1.8, 200, -2, color(50, 100, 200));
  lanes[3] = new Lane(3, LOG_ID, 3, 2.5, 190, 1, color(50, 100, 200));
  lanes[4] = new Lane(4, color(0, 150, 80));
  lanes[5] = new Lane(5, CAR_ID, 3, 1, 200, 3, color(180));
  lanes[6] = new Lane(6, CAR_ID, 3, 1.5, 200, -1.5, color(255,255,50));
  lanes[7] = new Lane(7, CAR_ID, 3, 1, 180, 2, color(180));
  lanes[8] = new Lane(8, color(0, 150, 80));
}

public void draw() {
  background(0);

  for (Lane lane : lanes)
    lane.run();

  frog.update();
  frog.show();

  int laneIndex = int(frog.y / grid);
  lanes[laneIndex].check(frog);
}

public void keyPressed() {
  if (key == 'w') frog.move(0, -1);
  else if (key == 's') frog.move(0, 1);
  else if (key == 'd') frog.move(1, 0);
  else if (key == 'a') frog.move(-1, 0);
}

public void reset() {
  frog = new Frog(width/2-grid/2, height-grid, grid);
  frog.sit(null);
}
