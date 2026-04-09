#import "../../../Template/definitions.typ": *
#import "../../../Template/template.typ": subchapter-title-slide

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

#slide[
  = Linien-Rendering
  == Bresenham's Linien Generierungs Algorithmus
  Bestandteile der Linie zwischen $A(x_(0), y_(0))$ und $B(x_(1), y_(1))$: 
  - Distanz der Punkte zueinander auf jeder Achse: #text(fill: deltaXColor)[$Delta x$] und #text(fill: deltaYColor)[$Delta y$]
  $ colMath(Delta x, deltaXColor) eq x_(1) - x_(0) $
  $ colMath(Delta y, deltaYColor) eq y_(1) - y_(0) $

  #figure(
    diagram(
      node-stroke: 2.5pt, 
      node((0, 0), name: <a>)[$A$],
      node((5, 2), name: <b>)[$B$],
      edge(<a>, <b>, stroke: 2.5pt),
      edge(<a>, (0, 2), stroke: green.darken(20%) + 2.5pt)[
        #text(fill: green.darken(20%))[$Delta y$]
      ],
      edge((0, 2), <b>, stroke: red.darken(20%) + 2.5pt)[
        #text(fill: red.darken(20%))[$Delta x$]
      ]
    )
  )
]

#slide[
  = Linien-Rendering
  == Bresenham's Linien Generierungs Algorithmus
  Bestandteile der Linie zwischen $A(x_(0), y_(0))$ und $B(x_(1), y_(1))$: 
  - Neigung (Slope) $m$ der Linie. Wenn man einen Pixel horizontal der Linie folgt, wie viele Pixel werden vertikal zurückgelegt?
  $ m eq frac(colMath(Delta y, deltaYColor), colMath(Delta x, deltaXColor)) $
  *Wichtig:* $m$ ist ein float Wert
]

#slide[
  = Linien-Rendering
  == Bresenham's Linien Generierungs Algorithmus
  #set align(horizon)
  Annahmen für den Algorithmus:
  #box(
    fill: gray.lighten(50%),
    inset: 15pt
  )[
    1. Die Linie wird von links nach rechts gezeichnet
    2. $x_(1) lt x_(2)$ und $y_(1) lt y_(2)$
    3. Der Anstieg der Linie ist zwischen 0 und 1. Die Linie wird von unten links nach oben rechts gezeichnet.
  ]
]

#slide[
  = Linien-Rendering
  == Bresenham's Linien Generierungs Algorithmus
  #set align(horizon + center)
  ```java
    public void DrawLine(int x0, int y0, int x1, int y1) {

      int dx = x1 - x0;
      int dy = y1 - y0;

      if (dx != 0) {
        float m = dy / dx;
        for (int i = 0; i < dx; i++) {
          int y = round(y0 + i * m)
          putPixel(x0 + i, y);
        }
      }
    }
  ```
]
