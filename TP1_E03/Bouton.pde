class Bouton {
  PVector position;
  float largeur, hauteur;
  color couleurFond;
  String texte;
  color couleurPolice;
  
  Bouton(float x, float y, float w, float h, color cF, color cP, String t) {
    position = new PVector (x, y);
    largeur = w;
    hauteur = h;
    couleurFond = cF;
    texte = t;
    couleurPolice = cP;
  }
  
  void render() {
    rectMode(CENTER);
    textAlign(CENTER, CENTER);
    
    fill(couleurFond);
    if (verifierSuperposition())
      rect( position.x, position.y, largeur * 1.1f, hauteur * 1.1f);
    else
      rect( position.x, position.y, largeur, hauteur);
    
    if (verifierSuperposition() && pressed)
      fill(255, 0, 0);
    else
      fill(couleurPolice);
    text(texte, position.x, position.y); 
  }
  
  boolean verifierSuperposition() {
    boolean supX = false, supY = false;
    
    if (mouseX > position.x - largeur / 2 && mouseX < position.x + largeur / 2)
      supX = true;
     
     if (mouseY > position.y - hauteur / 2 && mouseY < position.y + hauteur / 2)
       supY = true;
     
     if (supX && supY) {
        return true;
     } else 
       return false;
  }
}
