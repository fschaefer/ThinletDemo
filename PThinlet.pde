// custom Thinlet class for use with processing
public class PThinlet extends Thinlet {

  PApplet parent; // holder for the PApplet 
  Panel container = new Panel(); // holder for our Thinlet

  PThinlet(PApplet parent, String fileName, String layout){
    super(); // call the Thinlet Constuctor
    this.parent = parent; // set parent attribut

      try {
      if (!online){
        add(super.parse(openStream(fileName))); // if running in PDE or as application use stream

      }
      else{
        add(super.parse("/data/" + fileName)); // else if applet load resource from /data folder
      }

      container.setLayout(new BorderLayout()); // set layout of the Thinlet container
      parent.setLayout(new BorderLayout()); // set parents layout 

      container.add(this, -1); // add Thinlet to our container
      parent.add(container, layout); // add container to PApplet


      parent.doLayout(); // after that refresh the PApplet layout
      container.doLayout(); // refresh layout on container with Thinlet
    }
    catch(Exception e){
      e.printStackTrace(); // show some debug message if something goes wrong
    }
  }

  // custom event handling method as defined in XML
  // see thinlet.com how to do this

  int x;
  int y;
  int width;
  int height;

  void draw(String x, String y, String width, String height) {
    try {
      this.x = Integer.parseInt(x);
      this.y = Integer.parseInt(y);
      this.width = Integer.parseInt(width);
      this.height = Integer.parseInt(height);

      // call the processing draw method
      parent.redraw();
    } 
    catch (NumberFormatException e) {
      println(e);
      getToolkit().beep();
    }
  }
}
