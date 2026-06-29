#import "../../../Template/definitions.typ": *
#import "../../../Template/template.typ": *

#subchapter-title-slide(section-name: [Linien-Rendering])

#let colMath(x, color) = text(fill: color)[
  $#x$
]

#let deltaXColor = red.darken(20%)
#let deltaYColor = green.darken(20%)

#slide[
  = Linien-Rendering  
  == Bresenham's Linien Generierungs Algorithmus
  #set align(horizon)
  Es seien zwei Punkte gegeben: $A(x_(0), y_(0))$ und $B(x_(1), y_(1))$. \

  Ziel ist es, alle dazwischen liegenden Punkte zu finden, die man benötigt, um eine Linie auf einem Pixel Display zu zeichnen. 
  Jeder Pixel hat dabei Integer Koordinaten. 

  *Beispiele:* \
  Input: $A(0, 0), B(4, 4)$ \
  Output: $(0,0), (1,1), (2,2), (3,3), (4,4)$ \

  Input: $A(0, 0), B(4, 2)$ \
  Output: $(0,0), (1,0), (2,1), (3,1), (4,2)$
]

#slide[
  = Linien-Rendering 
  == Bresenham's Linien Generierungs Algorithmus
  #set align(horizon + center)
  #figure(
    image("../../../Images/bresenham_line.svg", fit: "contain"),
    caption: [
      Ergebnis des Bresenham's Linien Algorithmus. Der Anfang der Linie ist bei $A(1,1)$ oben links und das Ende ist bei $B(11,5)$ 
    ]
  )
]
