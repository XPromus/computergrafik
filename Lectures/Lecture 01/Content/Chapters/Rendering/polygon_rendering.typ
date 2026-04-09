#import "../../../Template/definitions.typ": *
#import "../../../Template/template.typ": subchapter-title-slide, hszg-green

#let chapter_name = [Polygon-Rendering]
#subchapter-title-slide(section-name: chapter_name)

#slide[
  = #chapter_name
  #set align(horizon + center)
  #toolbox.side-by-side()[
    #figure(
      gap: 40pt,
      diagram(
        node-stroke: 2.5pt, 
        node((0, 0), name: <a>, shape: triangle.with(aspect: auto), radius: 35pt),
      ),
      caption: [Ungefülltes Polygon]
    )
  ][
    #figure(
      gap: 40pt,
      diagram(
        node-stroke: 2.5pt, 
        node((0, 0), name: <a>, shape: triangle.with(aspect: auto), radius: 35pt, fill: hszg-green),
      ),
      caption: [Gefülltes Polygon]
    )
  ]
  
]

#slide[
  = #chapter_name
  #set align(horizon + center)
  #figure(
    image("../../../Images/elite_wireframe.gif", fit: "contain", width: 70%),
    caption: [
      Wireframe Modell einer Cobra in dem ZX Specturm Port von Elite. 
      Man beachte, dass Linien auf der Rückseite der Cobra nicht angezeigt werden. 
      Es kommt *Hidden-Line Removal* zum Einsatz.
    ]
  )
]

#slide[
  = #chapter_name
  #set align(horizon + center)
  #figure(
    image("../../../Images/elite_filled_polygon.png", fit: "contain", width: 70%),
    caption: [
      Gefüllte Polygone einer Cobra in Elite. 
      Die Polygone besitzen hier kein Shading.
    ]
  )
]

#slide[
  = Polygon-Rendering
  == Ungefüllte Polygone
  #set align(horizon)
  - Einfache Sequenz von gerenderten Linien
  - Bresenham's Linien Generierungs Algorithmus
  - Nutzung in Wireframe Rendering
  #figure(
    image("../../../Images/wireframe_environment_render.png", fit: "contain", width: 70%),
    caption: [Landschaft als Wireframe gerendert.]
  )
]

#slide[
  = Polygon-Rendering
  == Gefüllte Polygone
  #set align(horizon)
  - Füllen des Polygons mit jeweils einer Scanlinie
  #figure()[
    #image("../../../Images/full_polygons_1.png", fit: "contain")
  ]
  - Bestimmen, welcher Pixel auf der Scanlinie in dem Polygon liegt
  - Überprüfung jedes Pixels wäre unperformant
  - *Schlüsselidee:* Nicht jeder Pixel wird auf "_inside-ness_" überprüft. Es werden nur Pixel gesucht, an denen Änderungen der "_inside-ness_" auftreten.
]

#slide[
  = Polygon-Rendering
  == Gefüllte Polygone
  #set align(horizon)
  *Inside-Test* \
  Ein Punkt $P$ befindet sich nur dann innerhalb eines Polygons, wenn eine Scanlinie die Polygonkanten eine *ungerade* Anzahl an Malen schneidet und sich von P in beide Richtungen bewegt.
  #figure()[
    #image("../../../Images/full_polygons_2.png", fit: "contain")
  ]
]

#slide[
  = Polygon-Rendering
  == Gefüllte Polygone
  #set align(horizon)
  - Max-Min-Test: 2x, wenn lokales Maximum/Minimum, sonst 1x
  #figure()[
    #image("../../../Images/full_polygons_3.png", fit: "contain", width: 80%)
  ]
  //TODO: Research max-min-test
]

#slide[
  = Polygon-Rendering
  == Gefüllte Polygone
  #set align(horizon)
  *Scan-Line Algorithmus* \
  #toolbox.side-by-side()[
    Für jede Scanline:
    1. Finden Sie die Schnittpunkte der Scanlinie mit allen Kanten des Polygons.
    2. Sortieren Sie die Schnittpunkte nach zunehmender x-Koordinate.
    3. Füllen Sie alle Pixel zwischen den Schnittpunktpaaren aus.
  ][
    #figure()[
      #image("../../../Images/scan_line_1.png", fit: "contain")
    ]
  ]
]
