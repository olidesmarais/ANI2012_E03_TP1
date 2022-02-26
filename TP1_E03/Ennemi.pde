class Ennemi {
  int posX, posY;
  Jauge jaugeVie;
  int dimensionImg;
  PImage img; 
  int idxImg;
  
  //Constructeur
  Ennemi() {
    //Dimensions
    dimensionImg = int(random(200.0f, 400.0f));
    
    //Position
    posX = int(random(0 - dimensionImg / 2, dimensionX - dimensionImg / 2));
    posY = int(random(0 - dimensionImg / 2, height - hauteurCockpit - dimensionImg / 2));
    
    //Jauge de vie
    jaugeVie = new Jauge(posX + dimensionImg / 2, posY + dimensionImg / 8, 50, 10, 10, 0.5f, color(0, 255, 0, 255));
    
    //Image
    img = createImage(dimensionImg, dimensionImg, ARGB);
    idxImg = 0;
  }
  
  void render() {
    imageMode(CORNER);
    
    if(jaugeVie.niveauCourant > 5)
      tint(255, 255);
    else 
      tint(255, map(jaugeVie.niveauCourant, 0, 5, 0, 255));
    
    
    img.copy(imgEnnemis[idxImg], 0, 0, 400, 400, 0, 0, dimensionImg, dimensionImg);
    image(img, posX, posY);
    
    if (jaugeVie.niveauCourant > jaugeVie.niveau) {
        jaugeVie.render();
    }
    
    float hasard;
    
    //Dans 1% des cas, la séquence d'images est enclenchée
    if (idxImg == 0) {
      //hasard = 0;
      hasard = random(10.0f); 
      if (hasard > 9.9f) {
        idxImg++;
      }
    }
    
    //Image suivante de la sequence d'image
    if (idxImg > 0 && idxImg < 6) {
      idxImg++;
    } else if (idxImg == 6) {
      idxImg = 0;
    }
    tint(255, 255);
  }
  
  void verifierDegats (float clicX, float clicY) {
    
    //Emplacement relatif de l'attaque
    int posRelativeX = int(clicX) - posX;
    int posRelativeY = int(clicY) - posY;
    
    //Vérifier un contact direct
    if (verifierContact(posRelativeX, posRelativeY))
      jaugeVie.niveau -= 10;
    else {
      int posCx, posCy;
      
      for (float angle = radians(0) ; angle < radians(360) ; angle += 0.1) {
          //Position du pixel vérifier
          posCx = posRelativeX + int(cos(angle) * diametreAttraperEtoile);
          posCy = posRelativeY + int(sin(angle) * diametreAttraperEtoile);
          
          if (verifierContact(posCx, posCy)) {
            jaugeVie.niveau -= 5;
            return;
          }
      }
    }
      
    /*//Vérifier si l'attaque est dans le cadre de l'image
    if (posRelativeX >= 0 && posRelativeX <= dimensionImg && posRelativeY >= 0 && posRelativeY <= dimensionImg) {
      //Index du pixel de l'image
      int idxPixel = dimensionImg * posRelativeY + posRelativeX;
      
      //Charger l'image actuelle
      img.loadPixels();
      
      //Touché direct
      if (alpha(img.pixels[idxPixel]) > alpha(0) ) {
        jaugeVie.niveau -= 10;
        
      //Touché indirect
      } else {
        for (float angle = radians(0) ; angle < radians(360) ; angle += 0.1) {
          //Position du pixel vérifier
          int posCx = posRelativeX + int(cos(angle) * diametreAttraperEtoile);
          int posCy = posRelativeY + int(sin(angle) * diametreAttraperEtoile);
          
          //Index du pixel
          idxPixel = dimensionImg * posCy + posCx;
          
          //Si le pixel est dans le cadre de l'image
          if (idxPixel >= 0 && idxPixel < img.pixels.length) {
            //Détecter si touché
            if (alpha(img.pixels[idxPixel]) > 0) {
              jaugeVie.niveau -= 5;
              return;
            }
          }
        }
      }
    }*/
  }
    
  boolean verifierContact(int posRelativeX, int posRelativeY) {
    //Vérifier si l'attaque est dans le cadre de l'image
    if (posRelativeX >= 0 && posRelativeX <= dimensionImg && posRelativeY >= 0 && posRelativeY <= dimensionImg) {
      //Index du pixel de l'image
      int idxPixel = dimensionImg * posRelativeY + posRelativeX;
      
      //Charger l'image actuelle
      img.loadPixels();
      
      //Si le pixel est dans le cadre de l'image
      if (idxPixel >= 0 && idxPixel < img.pixels.length) {
        if (alpha(img.pixels[idxPixel]) > alpha(0) ) {
          return true;
        } else
          return false;
      }
    }
    return false;
  }
}
