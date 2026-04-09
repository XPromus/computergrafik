#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#chapter-title-slide(section-name: [Grafikprimitive], title-text: "Grafikprimitive")

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

#slide[
  = Triangle Strips
  #set align(horizon)
  - Ohne strips: 8 triangles \* 3 vertices = 24 vertices
  - Mit strips: 1 vertex per triangle anstelle von 3
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
  - Was wir an die Graphic-Hardware senden:
    - Startkosten: v0, v1
    - dann v2 (T0), v3 (T1), v4 (T2), v5 (T3), v6 (T4), v7 (T5), v8 (T6), v9 (T7)
  - 10 Vertices à $100 times 10 div 24 = 41.7%$ oder $10 div 8 = 1.25$ Vertices per Triangle
]

#slide[
  = Triangle Strips
  #set align(horizon)
  - 10 Vertices statt 24
    - $frac(100 times 10, 24)=41.7%$ der Daten
    - $frac(10, 8)=1.25$ Vertices per Triangle
  - D.h. wir können Geometriephase mehr als 2x schneller erwarten
  - Deﬁnition eines Dreieckstreifens bewirkt eine Änderung der Orientierung zwischen benachbarten Dreiecken im Streifen
    - Intern wird die Reihenfolge gegen den Uhrzeigersinn konsistent gehalten, indem die Eckpunkte 0-1-2, 1-3-2, 2-3-4, 3-5-4, ... überquert werden.
]

#slide[
  = Triangle Strips
  #set align(horizon)
  - OpenGL: glBegin(GL_TRIANGLE_STRIP); ... glEnd()
  #figure()[
    #image("../../Images/triangle_strips.png", fit: "contain", width: 75%)
  ]

  #codly(
    header: [*Compatibility Profile*],
    header-cell-args: (align: center),
  )
  ```GLSL
    glBegin(GL_TRIANGLE-STRIP)
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

#slide[
  = Triangle Strips
  == Swaps/Touch
  #set align(horizon)
  - Durchführen eines Swaps / Tausch für T3
  - Startkosten: v0, v1 dann
    - v2 (T0)
    - v3 (T1)
    - v2
    - v4 (T2)
    - v5 (T3)
    - v6 (T4)
  - Degeneriertes Dreieck (0-Fläche): v2, v3, v2

  // #cetz.canvas({
  //   import cetz.draw: *
    
  //   let scaling = 1

  //   let scalePosition(pos: (x: int, y: int)) = {
  //     return (
  //       pos.at("x") * scaling,
  //       pos.at("y") * scaling
  //     )
  //   }

  //   let triangle(
  //     pos1: (x: int, y: int), 
  //     pos2: (x: int, y: int), 
  //     pos3: (x: int, y: int)
  //   ) = {
  //     import cetz.draw: *
  //     line(
  //       scalePosition(pos: pos1), 
  //       scalePosition(pos: pos2), 
  //       scalePosition(pos: pos3)
  //     )
  //   }

  //   let v0 = (x: 0, y: 0)
  //   let v1 = (x: 0.5, y: -1)
  //   let v2 = (x: 1, y: 0)
  //   let v3 = (x: 1.5, y: -1)
  //   let v4 = (x: 2, y: 0)
  //   let v5 = (x: 1.5, y: 1)
  //   let v6 = (x: 2.5, y: 1)

  //   triangle()
  // })

]
