class Ennemi {
  float posX, posY;
  float diametre;
  Jauge jaugeVie;
  
  //Jauge de vie
  //int niveauVie;
  //float niveauVieCourant;
  //final int niveauVieMax = 10;
  
  //Constructeur
  Ennemi() {
    posX = random(dimensionX);
    posY = random(height - hauteurCockpit);
    diametre = random(40.0f, 60.0f);
    
    jaugeVie = new Jauge(posX, posY - diametre, 50, 10, 10, 0.5f);
    
    //niveauVie = niveauVieMax;
    //niveauVieCourant = float(niveauVieMax);
  }
  
  void render() {
    if(jaugeVie.niveauCourant > 5)
      fill(255, 0, 0, 255);
    else 
      fill(255, 0, 0, map(jaugeVie.niveauCourant, 0, 5, 0, 255));
    
    //fill(255, 0, 0);
    noStroke();
    ellipse(posX, posY, diametre, diametre);
    
    if (jaugeVie.niveauCourant > jaugeVie.niveau) {
      affiherJaugeVie();
    }
  }
  
  void touche (float clicX, float clicY) {
    float distance = sqrt(sq(posX - clicX) + sq(posY - clicY));
    //Touché directement
    if (distance <= diametre / 2) {
      jaugeVie.niveau -= 10;
    //Touché indirectement
    } else if (distance <= diametreAttaqueMax / 2 + diametre / 2) {
      jaugeVie.niveau -= 5;
    }
  }
  
  void affiherJaugeVie() {
    jaugeVie.render();
    
    /*
    //int longueur = 50;
    //PVector position = new PVector(posX, posY - diametre);
    
    rectMode(CORNER);
    //Fond
    noStroke();
    fill(200);
    rect(position.x, position.y, longueur, 10);
    
    //Intérieur
    fill(0, 255, 100, 255);
    float largeur = map(niveauVieCourant, 0, 10, 0, longueur);
    rect(position.x, position.y, largeur, 10);
    
    //Dessus
    stroke(150);
    strokeWeight(2);
    noFill();
    rect(position.x, position.y, longueur, 10);
    
    //niveauVieCourant -= 0.3f;
    */
  }
}
