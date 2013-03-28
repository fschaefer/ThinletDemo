import thinlet.*;
import java.awt.*;
import java.awt.event.*;

PThinlet thinlet;

void setup(){ 
  size(400,400);
  frameRate(50);
  
  // create a new PThinlet
  thinlet = new PThinlet(this, "boxGUI.xml", BorderLayout.PAGE_START);
  // set some nice colors
  thinlet.setColors(0xeeeecc, 0x000000, 0xffffff, 0x999966, 0xb0b096, 0xededcb, 0xcccc99, 0xcc6600, 0xffcc66);
  
  noLoop(); // stop processing from repainting in loop
} 

void draw(){

  // displace objects with thinlet height
  translate(0, thinlet.getBounds().height);

  // continue here with normal painting
  background(0);
  rect(thinlet.x, thinlet.y, thinlet.width, thinlet.height);
}

