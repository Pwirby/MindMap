import java.io.FileWriter;  // Import the File class
import java.io.IOException;  // Import the IOException class to handle errors
ArrayList<Rayon> rayons = new ArrayList<Rayon>();
PFont f;
color c;
String s = "";

void setup () {
  size(920, 920, P2D);
  frameRate(60);
  colorMode(HSB, 355, 100, 100);
  background(#000000);

  // Create the font
  f = createFont("WorkSans-VariableFont_wght.ttf", 35);
  textFont(f);
  textAlign(CENTER, CENTER);

  // Create the first ray
  c = color(random(355), 20, 90);
  rayons.add(new Rayon(s, c, random(width), random(height)));
}

void draw() {
  background(0);
  for (Rayon r : rayons) {
    r.move();
    r.display();
  }

  if (key == TAB && keyPressed) {
    saveFrame("sequence/image#####.png");
  }
}
void keyPressed() {
  switch (key) {
  case ENTER:
    if (!s.isEmpty()) {
      c = color(random(355), 20, 90);
      s = "";
      rayons.add(new Rayon(s, c, random(width), random(height)));
    }
    break;
  case DELETE:
    if (rayons.size() > 1) {
      rayons.remove(rayons.size() -1);
      s = rayons.get(rayons.size() -1).s;
    } else {
      c = color(random(355), 20, 90);
      rayons.get(rayons.size()-1).recolor(c);
      s = "";
      rayons.get(rayons.size()-1).rewrite(s);
    }
    break;
  case BACKSPACE :
    if (!s.isEmpty()) {
      s = s.substring(0, s.length()-1);
      rayons.get(rayons.size()-1).rewrite(s);
    }
    break;
  case ESC :
    String textResult = "The result of the mindmap is :\n";
    for (Rayon r : rayons) {
      textResult += r.s + "\n";
    }
    try {
      FileWriter myWriter = new FileWriter("D:/MindMap.txt");
      myWriter.write(textResult);
      myWriter.close();
      System.out.println("Successfully wrote to the file.");
    } 
    catch (IOException e) {
      System.out.println("An error occurred.");
      e.printStackTrace();
    }
    break;
  case CODED :
    break;
  default : 
    s += key;
    rayons.get(rayons.size()-1).rewrite(s);
    break;
  }
}
