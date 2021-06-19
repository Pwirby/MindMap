ArrayList<Rayon> rayons = new ArrayList<Rayon>();
PFont f;
color c;
String s = "";
void setup () {
  size(1280, 720, P2D);
  frameRate(60);

  // Create the font
  f = createFont("SourceCodePro-Regular.ttf", 35);
  textFont(f);
  textAlign(CENTER, CENTER);

  colorMode(HSB, 355, 100, 100);
  background(#000000);
  c = color(random(355), 20, 90);
  rayons.add(new Rayon(s, c, random(width), random(height)));
}

void draw() {
  background(0);
  for (Rayon r : rayons) {
    r.move();
    r.display();
  }

  /*if (frameCount == 300){
   exit();
   }
   saveFrame("sequence/image#####.png");*/
}
void keyPressed() {
  if (keyCode == ENTER && !s.isEmpty()) {
    c = color(random(355), 20, 90);
    s = "";
    rayons.add(new Rayon(s, c, random(width), random(height)));
  } else if (key == DELETE && !rayons.isEmpty()) {
    rayons.remove(rayons.size() -1);
    if (!rayons.isEmpty()) {
      s = rayons.get(rayons.size() -1).s;
    } else {
      c = color(random(355), 20, 90);
      s = "";
    }
  } else if (key == BACKSPACE && !s.isEmpty()) {
    s = s.substring(0, s.length()-1);
    rayons.get(rayons.size()-1).rewrite(s);
  } else if (key !=  CODED && key!= DELETE && key != SHIFT && key != ENTER && key != ALT && key != BACKSPACE) {
    s += key;
    rayons.get(rayons.size()-1).rewrite(s);
  }
}

// Create a random lowercase letter
private String getRandomLetter() {
  return String.valueOf((char)(random(26)+'a'));
}
