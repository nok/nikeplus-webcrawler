class NikeRun {
  
  ArrayList<PVector> waypoints;
  ArrayList<Float> speeds, distances, gpssignalstrengths; 
  ArrayList<Integer> cadences;
  
  NikeRun(String filename){
    
    XML xml = loadXML(filename+".xml");
    
    XML[] histories = xml.getChildren("activity/history/history");
    
    for(XML history:histories){
      
      String type = history.getChild("type").getContent();
      XML[] values = history.getChildren("values/value");
      
      for(XML value:values){
        
        if(type.equals("SPEED")){ // ... because downward compatible
          this.addSpeed(Float.valueOf(value.getContent()));  
        } else if(type.equals("DISTANCE")){
          this.addDistance(Float.valueOf(value.getContent()));
        } else if(type.equals("GPSSIGNALSTRENGTH")){
          this.addGpsSignalStrength(Float.valueOf(value.getContent()));
        } else if(type.equals("CADENCE")){
          this.addCadence(Integer.valueOf(value.getContent()));
        }
        
      }
    }
    
    XML[] waypoints = xml.getChildren("activity/geo/waypoints/waypoint");
    for(XML waypoint:waypoints){
      this.addWaypoint(new PVector(
        Float.valueOf(waypoint.getChild("lat").getContent()),
        Float.valueOf(waypoint.getChild("lon").getContent()),
        Float.valueOf(waypoint.getChild("ele").getContent())
      ));
    }
    
  }
  
  void addWaypoint(PVector waypoint)
  {
    if(waypoints==null){
      waypoints = new ArrayList<PVector>();      
    } else {
      waypoints.add(waypoint);
    }
  }
  
  void addSpeed(Float speed){
    if(speeds==null){
      speeds = new ArrayList<Float>();      
    } else {
      speeds.add(speed);
    }
  }
  
  void addDistance(Float distance){
    if(distances==null){
      distances = new ArrayList<Float>();      
    } else {
      distances.add(distance);
    }
  }
  
  void addGpsSignalStrength(Float strength){
    if(gpssignalstrengths==null){
      gpssignalstrengths = new ArrayList<Float>();      
    } else {
      gpssignalstrengths.add(strength);
    }
  }

  void addCadence(Integer cadence){
    if(cadences==null){
      cadences = new ArrayList<Integer>();      
    } else {  
      cadences.add(cadence);
    }
  }  

  void draw(){
    beginShape();
    for (PVector v:waypoints){
      vertex(v.x,v.y,v.z);
    }
    endShape();
  }
  
}
