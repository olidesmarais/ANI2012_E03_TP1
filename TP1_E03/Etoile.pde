class Etoile {
  float posX, posY;
  int hauteur, largeur;
  float diametreContour;
  int type;
  PImage image;
  int puissance;
  
  Etoile() {
    posX = random(width);
    posY = random(height - hauteurCockpit);
    
    type = determinerType();
    
    //Type 0-Grande 1-Petite 2-Ronde
    switch(type) {
      //Grande
      case 0 :
        largeur = 209;
        hauteur = 214;
        puissance = 15;
        diametreContour = 150;
        break;
      //Petite
      case 1 :
        largeur = 78;
        hauteur = 80;
        puissance = 10;
        diametreContour = 55;
        break;
      //Ronde
      case 2 :
        largeur = 70;
        hauteur = 69;
        puissance = 5;
        diametreContour = 45;
        break;
    }
    image = createImage(largeur, hauteur, ARGB);
    image.copy(etoilesRef[type], 0, 0, largeur, hauteur, 0, 0, largeur, hauteur);
  }
  
  int determinerType() {
    float probabilite = random(10);
    if (probabilite > 9.0f)
      return 0;
    else if (probabilite > 5.0)
      return 1;
    else
      return 2;
  }
  
  void render() {
    imageMode(CENTER);
    image(image, posX, posY);
  }
  
  boolean verifierSuperposition() {    
    float distance =  sqrt(sq(mouseX - posX) + sq(mouseY - posY));
   
    return (distance <= diametreAttraperEtoile / 2 + diametreContour / 2);
  }
  
}
