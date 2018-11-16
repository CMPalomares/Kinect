//Libraries
  import kinect4WinSDK.Kinect;
  import kinect4WinSDK.SkeletonData;

//New object
  Kinect kinect;
//Array list for storink all data for the skeleton construction
  ArrayList <SkeletonData> bodies;

  void setup(){
    size(900,700);
    background(0);
    kinect = new Kinect(this);
    smooth();
    bodies = new ArrayList<SkeletonData>();
  }

  void draw(){
    background(0);
    //Kinect cameras: image, depth, mask and void for drawing the skeleton
    //image(kinect.GetImage(), 320, 0, 320, 240);
    //image(kinect.GetDepth(), 320, 240, 320, 240);
    // image(kinect.GetMask(), 0, 240, 320, 240);
  
   //For loop needed for drawing all the different parts of the skeleton
    for (int i=0; i<bodies.size (); i++) 
    {
      drawSkeleton(bodies.get(i));
      //drawPosition(bodies.get(i));
    }
  }

  void drawPosition(SkeletonData _s) {
    //noStroke();
    //fill(0, 100, 255);
    String s1 = str(_s.dwTrackingID);
    text(s1, _s.position.x*width/2, _s.position.y*height/2);
  }

//Void for drawing the different connections
  void drawSkeleton(SkeletonData _s) {
    // Body
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HEAD, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_CENTER, 
    Kinect.NUI_SKELETON_POSITION_SPINE);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
    Kinect.NUI_SKELETON_POSITION_SPINE);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_SPINE);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SPINE, 
    Kinect.NUI_SKELETON_POSITION_HIP_CENTER);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
    Kinect.NUI_SKELETON_POSITION_HIP_LEFT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_CENTER, 
    Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
    Kinect.NUI_SKELETON_POSITION_HIP_RIGHT);
  
    // Left Arm
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_LEFT, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_LEFT, 
    Kinect.NUI_SKELETON_POSITION_WRIST_LEFT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_WRIST_LEFT, 
    Kinect.NUI_SKELETON_POSITION_HAND_LEFT);
  
    // Right Arm
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_SHOULDER_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ELBOW_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_WRIST_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_HAND_RIGHT);
  
    // Left Leg
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_LEFT, 
    Kinect.NUI_SKELETON_POSITION_KNEE_LEFT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_KNEE_LEFT, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_LEFT, 
    Kinect.NUI_SKELETON_POSITION_FOOT_LEFT);
  
    // Right Leg
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_HIP_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_KNEE_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT);
    DrawBone(_s, 
    Kinect.NUI_SKELETON_POSITION_ANKLE_RIGHT, 
    Kinect.NUI_SKELETON_POSITION_FOOT_RIGHT);
  }

//void for drawing the connections between the points (line, ellipse)
  void DrawBone(SkeletonData _s, int _j1, int _j2) {
    //fill(0);
    stroke(255, 255, 255);
    if (_s.skeletonPositionTrackingState[_j1] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED &&
      _s.skeletonPositionTrackingState[_j2] != Kinect.NUI_SKELETON_POSITION_NOT_TRACKED) {
      //skeleton
        //line(_s.skeletonPositions[_j1].x*width/2, 
      //_s.skeletonPositions[_j1].y*height/2, 
      //_s.skeletonPositions[_j2].x*width/2, 
      //_s.skeletonPositions[_j2].y*height/2);
      //Lines originated from one point of the screen
      line (_s.skeletonPositions[_j1].x*width*1.5, 
      _s.skeletonPositions[_j1].y*height*1.5, width/2,height/2);
        line ( _s.skeletonPositions[_j1].x*width, 
      _s.skeletonPositions[_j1].y*height, width/2,height/2);
        line ( _s.skeletonPositions[_j1].x*width, 
      _s.skeletonPositions[_j1].y*width, width/2,height/2);  
      //ellipse
      stroke (255,255,0);
    
       ellipse ( _s.skeletonPositions[_j2].x*width*1.5, 
      _s.skeletonPositions[_j1].y*height*1.5, 25,25);
       ellipse ( _s.skeletonPositions[_j2].x*width, 
      _s.skeletonPositions[_j1].y*height, 15,15);
       ellipse ( _s.skeletonPositions[_j2].x*width, 
      _s.skeletonPositions[_j1].y*width, 10,10);
    }
  }

  void appearEvent(SkeletonData _s) 
  {
    if (_s.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
    {
      return;
    }
    synchronized(bodies) {
      bodies.add(_s);
    }
  }

  void disappearEvent(SkeletonData _s) 
  {
    synchronized(bodies) {
      for (int i=bodies.size ()-1; i>=0; i--) 
      {
        if (_s.dwTrackingID == bodies.get(i).dwTrackingID) 
        {
          bodies.remove(i);
        }
      }
    }
  }

  void moveEvent(SkeletonData _b, SkeletonData _a) {
    if (_a.trackingState == Kinect.NUI_SKELETON_NOT_TRACKED) 
    {
      return;
    }
    synchronized(bodies) {
      for (int i=bodies.size ()-1; i>=0; i--) 
      {
        if (_b.dwTrackingID == bodies.get(i).dwTrackingID) 
        {
          bodies.get(i);//.copy(_a);
          break;
        }
      }
    }
  }
