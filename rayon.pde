class Rayon {
  String s;
  color c;

  float t;
  float u;

  float x = noise(t);
  float y = noise(u);

  Rayon(String s, color c, float t, float u) {
    this.s = s;
    this.c = c;
    this.t = t;
    this.u = u;
  }
  void rewrite(String s) {
    this.s = s;
  }

  void display() {
    stroke(c);
    if (s.isEmpty()) {
      noStroke();
    } else {
      strokeWeight(2);
    }
    noFill();
    line(width/2, height/2, x, y);

    stroke(0);
    fill(c);
    text(s, x, y);
  }

  void move() {
    t = t + 0.001;
    u = u + 0.002;
    x = noise(t);
    x = map(x, 0, 1, 0, width);
    y = noise(u);
    y = map(y, 0, 1, 0, height);
  }
}
