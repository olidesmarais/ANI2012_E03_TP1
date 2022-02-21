class Jauge {
  float posX, posY;
  float longueur, largeur;
  float hauteur;
  float niveau, niveauMax, niveauCourant;
  float vitesseUpdate;
  
  Jauge(float x, float y, float l, float h, float n, float v) {
    posX = x;
    posY = y;
    longueur = largeur = l;
    hauteur = h;
    niveauMax = niveau = niveauCourant = n;
    vitesseUpdate = v;
  }
  
  void render() {
    rectMode(CORNER);
    
    //Fond
    noStroke();
    fill(200);
    rect(posX, posY, longueur, hauteur);
    
    //Intérieur
    fill(0, 255, 100);
    largeur = map(niveauCourant, 0, niveauMax, 0, longueur);
    rect(posX, posY, largeur, hauteur);
    
    //Dessus
    stroke(150);
    strokeWeight(5);
    noFill();
    rect(posX, posY, longueur, hauteur);
  }
  
  void update() {
    if (niveau > niveauCourant) {
      niveauCourant += vitesseUpdate;
    } else if (niveau < niveauCourant) {
      niveauCourant -= vitesseUpdate;
    }
  }
}
