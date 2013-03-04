void setup()
{  
  size(852,650,OPENGL);
  background(241);
  NikeRun run = new NikeRun("2076258238");            // data/855629079.xml
  
  // Waypoints as ArrayList<PVector>
  if(run.waypoints!=null){
    println("Waypoints: "+run.waypoints.size());
  }
  
  // Speeds as ArrayList<PVector>
  if(run.speeds!=null){
    println("Speeds: "+run.speeds.size());
  }
   
  // Distances as ArrayList<Float>
  if(run.distances!=null){
    println("Distances: "+run.distances.size());
  }
  
  // GPS signal strengths as ArrayList<Float> 
  if(run.gpssignalstrengths!=null){
    println("Distances: "+run.gpssignalstrengths.size());
  }
  
  // Cadences as ArrayList<Integer> 
  if(run.cadences!=null){
    println("Cadences: "+run.cadences.size());
  }

  noFill(); stroke(0);  
  beginShape();
    for(PVector point : run.waypoints){
      vertex(                                         // http://itouchmap.com/latlong.html
        map(point.x, 48.781759, 48.806988, 0, width), // latitude
        map(point.y, 9.185944, 9.23358, 0, height)    // longitude
      );  
    }
  endShape();
}
