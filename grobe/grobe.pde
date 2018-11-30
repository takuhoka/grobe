import java.awt.*;
import java.awt.event.*;
Frame f;
CheckboxGroup cg;
Checkbox c1,c2,c3;
Button b1;
int r;
PShape earth;
PImage earth_tex;
float rotx;
float rotz;
void mouseDragged() {
  rotx=(pmouseY-mouseY)*0.01;
  rotz=(mouseX-pmouseX)*0.01;
}
void setup() {
  size(400, 400, P3D);
  earth_tex=loadImage("Albedo.jpg");
  noStroke();
  earth=createShape(SPHERE, 100);
  earth.setTexture(earth_tex);
  f=new Frame();
 f.setSize(200, 100);
  f.setLayout(null);
  b1=new Button("rotation");
  f.add(b1);
  b1.setBounds(70,40,60,20);
  b1.addActionListener(new ActionListener() {
    public void actionPerformed(ActionEvent ae) {
      if (b1.getLabel().equals("rotation")) {
        b1.setLabel("stop");
      } else {
        b1.setLabel("rotation");
      }
    }
  }
  );
  cg=new CheckboxGroup();
  c1=new Checkbox("slow",cg,false);
  f.add(c1);
  c1.setBounds(5,80,65,20);
  c2=new Checkbox("normal",cg,true);
  f.add(c2);
  c2.setBounds(70,80,80,20);
  c3=new Checkbox("fast",cg,false);
  f.add(c3);
  c3.setBounds(145,80,70,20);
  f.setVisible(true);
}
void draw() {
  background(0);
  translate(width/2, height/2); 
  if (b1.getLabel().equals("stop")) {
    speed();
    earth.rotateX(radians(r));
    earth.rotateY(radians(r));
  } else {
    earth.rotateX(rotx);
    earth.rotateZ(rotz);
  }
  shape(earth);
}
void speed(){
  if(c1.getState()){
    r=-1;
  }
  if(c2.getState()){
    r=-3;
  }
  if(c3.getState()){
    r=-5;
  }
}