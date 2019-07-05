void Initialize(){
  
  surface.setTitle("Japan Seismic Dashboard");
  frameRate(30);
  
  // construct arrays
  gapArray = new int[arrayLength];
  latArray = new float[arrayLength];
  lonArray = new float[arrayLength];
  depthArray = new float[arrayLength];
  magArray = new float[arrayLength];
  dminArray = new float[arrayLength];
  rmsArray = new float[arrayLength];
  placeArray = new String[arrayLength];
  // load image
  img = loadImage("worldmap.png");
  // read table
  rdTbl = new ReadTable("earthquakes.csv");
  // extract data into arrays
  rdTbl.extract();
  // constuct objects
  dash = new Dashboard(1110, 825, 5);
  arrow = new Arrow();
  dialA = new Dial (300, 170, 600, 0, 100, "Gap");
  dialB = new Dial (300, 500, 600, 0, 120, "Elapsed Time (secs)");
  barA = new Bar (790, 25, 335, 0, 12, "Magnitude (Richter)");
  barB = new Bar (990, 25, 335, 0, 800, "Depth (feet)");
  gpsmap = new Map_GPS(0+space, 0+space);
  pchart = new PieChart(890, 602);
  mapA = new Map(675, 437, 320, 220);
  plot = new GPlot(this);
  // text init
  ft = createFont("Arial", 20);
  textFont(ft);
  textAlign(CENTER, CENTER);
  // copy data for plotting
  points = new GPointsArray(60);
      for (int i = 0; i < 60; i++) {
        points.add(i, magArray[i]);
      }
  mapA.init();
  // Polymorphism test
  println("Polymorphism test");
  barC = new Bar2 (0, 0, 20, 0, 1, "n");
  barC.textdisp();
  barC = new Bar (0, 0, 20, 0, 10, "p");
  barC.textdisp();
  println("Test end");
}
