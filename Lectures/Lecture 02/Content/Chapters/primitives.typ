#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide, subchapter-title-slide

#chapter-title-slide(section-name: [Grafikprimitive])

#slide[
  = Grafikprimitive
  #set align(horizon + center)
  #figure()[
    #image("../../Images/primitives.png", fit: "contain", width: 90%)
  ]
]

#slide[
  = Grafikprimitive
  #set align(horizon)
  - OpenGL Compatibility Proﬁle (10 Primitive) vs. Core Proﬁle (7 Primitive)
  - Vulkan reduziert auf 6 Primitive, zusätzliche Primitive für spezielle Shader möglich (bspw. #text("_LINE LIST WITH ADJACENCY"))
  #set align(horizon + center)
  #set text(size: 19pt)
  #table(
    columns: (auto, auto),
    inset: 10pt,
    stroke: hszg-green + 3pt,
    fill: (x, y) => {
      if (y == 0) {
        return hszg-green
      } else if (calc.even(y)) {
        return hszg-green.lighten(90%)
      } else {
        return white
      }
    },
    table.header(
      [*Grafik-Primitive in Vulkan*], [*Grafik-Primitive in OpenGL*]
    ),
    [VK PRIMITIVE TOPOLOGY POINT LIST], [GL POINTS],
    [VK PRIMITIVE TOPOLOGY LINE LIST], [GL LINES],
    [VK PRIMITIVE TOPOLOGY LINE STRIP], [GL LINE STRIP],
    [VK PRIMITIVE TOPOLOGY TRIANGLE LIST], [GL TRIANGLES],
    [VK PRIMITIVE TOPOLOGY TRIANGLE STRIP], [GL TRIANGLES STRIP],
    [VK PRIMITIVE TOPOLOGY TRIANGLE FAN], [GL TRIANGLES FAN],
  )
  #set text(size: 20pt)
]

#subchapter-title-slide(section-name: [Triangle Strips])

#slide[
  = Triangle Strips
  #set align(horizon)
  - Ohne Strips: $8 "triangles" times 3 "vertices" eq 24 "vertices"$
  - Mit Strips: $1$ vertex per triangle anstelle von $3$
  
  #figure()[
    #cetz.canvas({
        import cetz.draw: *
        let scale = 2

        for ii in range(0, 5) {
          if (ii < 4) {
            line(
              (ii * scale, 0),
              ((ii + 1) * scale, 0),
              ((0.5 + ii) * scale, -1 * scale),
              (ii * scale, 0), 
              fill: yellow.lighten(50%)
            )
            let tIndex = ii * 2
            content(((0.5 + ii) * scale, -0.75))[$T_tIndex$]
          }
          
          let upIndex = ii * 2
          content((ii * scale, 0.5))[$V_upIndex$]

          if (ii < 4) {
            line(
              ((ii + 0.5) * scale, -1 * scale),
              ((ii + 0.5 + 1) * scale, -1 * scale),
              ((0.5 + ii + 0.5) * scale, 0),
              ((ii + 0.5) * scale, -1 * scale), 
              fill: green.lighten(50%)
            )
            let tIndex = ii * 2 + 1
            content(((1 + ii) * scale, -1.5))[$T_tIndex$]
          }

          let index = 1 + ii * 2
          content((ii * scale + 1, -2.5))[$V_index$]
          
        }
    })
  ]
  
  Was wir an die Graphic-Hardware senden: \
  Startkosten: $V_(0)$, $V_(1)$ \
  Dann: 
  #let i = 0
  #while i <= 7 {
    [$T_(#i) eq {V_(#{i + 2})}$, ]
    i += 1
  }
]

#slide[
  = Triangle Strips
  #set align(horizon)
  - $10$ Vertices statt $24$
    - $frac(100 times 10, 24)=41.7%$ der Daten
    - $frac(10, 8)=1.25$ Vertices per Triangle
  - *Ergebnis:* wir können Geometriephase mehr als 2x schneller erwarten
  - Definition eines Dreieckstreifens bewirkt eine Änderung der Orientierung zwischen benachbarten Dreiecken im Streifen
    - Intern wird die Reihenfolge gegen den Uhrzeigersinn konsistent gehalten, indem die Eckpunkte 0-1-2, 1-3-2, 2-3-4, 3-5-4, ... überquert werden.
]

#slide[
  = Triangle Strips
  == OpenGL Implementation
  #set align(horizon)
  #figure()[
    #image("../../Images/triangle_strips.png", fit: "contain", width: 75%)
  ]

  #codly(
    header: [*Compatibility Profile*],
    header-cell-args: (align: center),
  )
  ```GLSL
    glBegin(GL_TRIANGLE_STRIP)
      glVertex3fv(v0);
      glVertex3fv(v1);
      glVertex3fv(v2);
      glVertex3fv(v3);
      glVertex3fv(v4);
      glVertex3fv(v5);
    glEnd();
  ```
]

#slide[
  = Triangle Strips
  #set align(horizon)
  #figure()[
    #image("../../Images/triangle_strips.png", fit: "contain", width: 75%)
  ]

  #codly(
    header: [*Core Profile*]
  )
  ```GLSL
    GLBatch triangleBatch;
    GLShaderManager SM;
    float grey[] = {0.5, 0.5, 0.5, 1.0};
    float verts[][3] = {v0, v1, v2, v3, v4, v5};
    triangleBatch.Begin(GL_TRIANGLE_STRIP, 6);
    triangleBatch.CopyVertexData3f(verts);
    triangleBatch.End();
    SM.UseStockShader(GLT_SHADER_IDENTITY, grey);
    triangleBatch.Draw();
  ```
]

// #slide[
//   = Triangle Strips
//   == Swaps/Tausch
//   #set align(horizon)
//   - Durchführen eines Swaps / Tausch für $T_(3)$
//   - Startkosten: $V_(0)$, $V_(1)$ dann
//     - $V_(2)$ $(T_(0))$
//     - $V_(3)$ $(T_(1))$
//     - $V_(2)$
//     - $V_(4)$ $(T_(2))$
//     - $V_(5)$ $(T_(3))$
//     - $V_(6)$ $(T_(4))$
//   - Degeneriertes Dreieck (0-Fläche): $V_(2)$, $V_(3)$, $V_(2)$
// ]

#slide[
  = Triangle Strips
  == Erstellung
  #set align(horizon)

  - Manuelle Erstellung - nur bei kleinen Modellen und macht keinen Spaß...
  - OpenSceneGraph
  - NVIDIA Tri Stip-Library
  - Custom Implementationen
]

#slide[
  = Triangle Strips
  == Erstellung
  #set align(horizon)

  SGI Stripping Algorithm
  1. Wähle ein Start-Dreieck
  2. Baue 3 Triangle-Stips (einer pro Edge)
  3. Wähle den längsten Strip
  4. Beginne bei 1. bis alle Dreiecke in einem Strip sind

  Wahl des Start-Dreiecks
  - Originale Implementation: Dreieck mit den wenigsten Nachbarn
  - Praktisch bringt eine willkürliche Wahl gleich gute Ergebnisse
]

#slide[
  = Triangle Strips
  == Performance
  #set align(horizon)
  
  #figure(
    image("../../Images/siliconcarbidschaum_tu.png", width: 60%),
    caption: [
      Modell von Siliconcarbidschaum der TU Freiberg
    ]
  )
]

#slide[
  = Triangle Strips
  == Performance
  #set align(horizon)

  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: hszg-green + 3pt,
    inset: 15pt,
    fill: (x, y) => {
      if (y == 0) {
        return hszg-green
      } else if (calc.even(y)) {
        return hszg-green.lighten(90%)
      } else {
        return white
      }
    },
    table.header(
      [], [*Originales Modell*], [*Optimiertes Modell*]
    ),
    [Anzahl der Vertices], [ca. 1,36 Millionen], [ca. 0,23 Millionen],
    [Anzahl der Primitve], [ca. 1,36 Millionen Polygone], [ca. 0,44 Millionen Tristrips und ca. 8000 Triangles],
    [Renderdauer], [ca. 50 ms], [ca. 7 ms],
    [FPS], [ca. 19 FPS], [60 FPS (maximales Limit)]
  )
]
