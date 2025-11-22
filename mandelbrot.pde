int recursionAmount = 100;

double centerX =-0.5;
double centerY =0.0;
double zoom = 0.3;

boolean redraw;

PVector topLeftNew = new PVector();
PVector botRightNew = new PVector();

complexNumber z = new complexNumber(0,0);
complexNumber zPrev = new complexNumber(0,0);
complexNumber c = new complexNumber(0,0);

void setup()
{
  pixelDensity(1);
  size(512,512);
  
  mandelFrame();
}

void draw()
{
  if(mousePressed)
  {
    centerX=centerX-0.002*(mouseX-pmouseX)/zoom;
    centerY=centerY-0.002*(mouseY-pmouseY)/zoom;
    redraw=true;
  }
  
  if(redraw)
  {
    mandelFrame();
    redraw=false;
  }
}

void mandelFrame()
{
  for (int y=0; y<height; y++)
  {
    for (int x=0; x<width; x++)
    {
      //neuer frame z reset und auf pos setzen
      z.set(0,0);
      zPrev.set(0,0);
      c.set(centerX+(x-width*0.5)/(width*zoom), centerY+(y-height*0.5)/(width*zoom));
      
      //z iterieren
      for (int i=1; i<recursionAmount; i++)
      {
        zPrev=z;
        z=c.add(zPrev.sq());
        
        //break loop wenn draußen, einfärben für geschwindigkeit des ausbrechens
        if(z.mag()>2)
        {
          set(x,y,color(map(i,0,recursionAmount,0,255)));
          break;
        }
      }
      
      //schwarz wenn drin
      if(z.mag()<2)
      {
        set(x,y,#FFFFFF);
      }
    }
  }
}

void mouseWheel(MouseEvent mouse)
{
  zoom = zoom-mouse.getCount()*zoom*0.1;
  println(zoom);
  redraw=true;
}
