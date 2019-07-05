// load table class
void loadTable() {
  
  count = 0;
  
  for (TableRow row : table.rows()) {
    // read variables from csv file
    float lat = row.getFloat("latitude");
    float lon = row.getFloat("longitude");
    float depth = row.getFloat("depth");
    float mag = row.getFloat("mag");
    int gap = row.getInt("gap");
    float dmin = row.getFloat("dmin");
    float rms = row.getFloat("rms");
    String place = row.getString("place");
    
    // load variables to arrays
    latArray[count] = lat;
    lonArray[count] = lon;
    depthArray[count] = depth;
    magArray[count] = mag;
    gapArray[count] = gap;
    dminArray[count] = dmin;
    rmsArray[count] = rms;
    placeArray[count] = place;
    
    count++;
    
    // print out interesting variables
    println("Location: " + place + " Magnitude: " + mag + " Duration: " + dmin + " mins");
    
  }
  
}
