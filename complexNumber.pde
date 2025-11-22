class complexNumber
{
  //init
  double real,imag;
  double realTemp,imagTemp;
  
  complexNumber(double r, double i)
  {
    real = r;
    imag = i;
  }
  
  //addition
  complexNumber add(complexNumber other)
  {
    realTemp=real+other.real;
    imagTemp=imag+other.imag;
    
    return new complexNumber(realTemp,imagTemp);
  }
  
  //multiplikation
  complexNumber mult(complexNumber other)
  {
    realTemp=real*other.real-imag*other.imag;
    imagTemp=real*other.imag+imag*other.real;
    
    return new complexNumber(realTemp,imagTemp);
  }
  
  //hoch 2
  complexNumber sq()
  {
    return mult(this);
  }
  
  //magnitude
  double mag()
  {
    return Math.sqrt(real*real+imag*imag);
  }
  
  //set
  void set(double r, double i)
  {
    real = r;
    imag = i;
  }
}
