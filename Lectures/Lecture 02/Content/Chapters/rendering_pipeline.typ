#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": *

#chapter-title-slide(section-name: [Grafikpipeline])

#slide[
  = Grafikpipeline
  #set align(horizon)

  #v(1fr)
  #figure(
    diagram(
      node-stroke: 2.5pt,
      node((0, 0), [Resources], corner-radius: 2pt, inset: 10pt),
      edge("-|>"),
      node((1, 0), [Graphics Pipeline], corner-radius: 2pt, inset: 10pt),
      edge("-|>"),
      node((2, 0), [Render Target], corner-radius: 2pt, inset: 10pt)
    )
  )
  #v(1fr)
  #grid(
    columns: (1fr, 1fr),
    inset: 10pt,
    align: center + top,
    [
      *Resources*
      #grid(
        columns: (1fr, 1fr),
        inset: 10pt,
        [
          #figure(
            image("../../Images/render_pipeline/firehydrant_texture.png", height: 100pt)
          )

          Texturen
        ], [
          #figure(
            image("../../Images/render_pipeline/triangle_mesh.png", height: 100pt)
          )

          Triangle Mesh
        ]
      )
    ], [
      *Render Target*
      #image("../../Images/render_pipeline/firehydrant_3d.png", fit: "contain", width: 50%)      
    ]
  )

  #v(1fr)
]

#let blueBox(content, position: (0, 0)) = node(
  position,
  text(fill: blue)[#content],
  stroke: 2.5pt + blue,
  fill: blue.lighten(90%),
  corner-radius: 5pt,
  inset: 10pt,
  width: 200pt
)

#let greenBox(content, position: (0, 0)) = node(
  position,
  text(fill: hszg-green)[#content],
  stroke: 2.5pt + hszg-green,
  fill: hszg-green.lighten(90%),
  corner-radius: 5pt,
  inset: 10pt,
  width: 200pt
)

#slide[
  = Grafikpipeline
  #set align(horizon)

  // #place(
  //   top + right,
  //   grid(
  //     columns: (1fr),
  //     align: right,
  //     inset: 10pt,
  //     box(
  //       fill: blue.lighten(90%),
  //       stroke: 2.5pt + blue,
  //       inset: 10pt,
  //       radius: 5pt,
  //       text(fill: blue, size: 13pt, weight: "bold")[
  //         Über Parameter anpassbar
  //       ]
  //     ), box(
  //       fill: hszg-green.lighten(90%),
  //       stroke: 2.5pt + hszg-green,
  //       inset: 10pt,
  //       radius: 5pt,
  //       text(fill: hszg-green, size: 13pt, weight: "bold")[
  //         Vollständig anpassbar
  //       ]
  //     )
  //   )
  // )

  #figure(
    diagram(
      node-stroke: 2.5pt,
      node((0, 0), [Resources], corner-radius: 5pt, inset: 10pt),

      {
        blueBox(position: (1, 0))[Input Assembler]
        greenBox(position: (1, 0.5))[Vertex Shader]
        greenBox(position: (1, 1))[Hull Shader]
        blueBox(position: (1, 1.5))[Tesselator]
        greenBox(position: (1, 2))[Domain Shader]
        greenBox(position: (1, 2.5))[Geometry Shader]
        blueBox(position: (1, 3))[Rasterizer]
        greenBox(position: (1, 3.5))[Pixel Shader]
        blueBox(position: (1, 4))[Output Merger]
      },

      node(enclose: ((1,0), (1,4)), inset: 10pt, corner-radius: 5pt),
      node((2, 4), [Render Target], corner-radius: 5pt, inset: 10pt),

      blueBox(position: (2, 1))[Parameter anp.],
      greenBox(position: (2, 2))[Vollständig anp.],

      edge((0,0), (1,0), "-|>"),
      edge((1,4), (2,4), "-|>")
    )
  )
]

#slide[
  = Grafikpipeline
  == #text(fill: blue)[Input Assembler] #h(1fr) #text(weight: "light", fill: gray)[$arrow$] #text(fill: hszg-green.lighten(50%), weight: "light")[Vertex Shader]
  #set align(horizon)
  #set align(horizon)

  - Input ist ein Vertex Buffer der alle Vertex Attribute aller Dreiecke eines 3D Modells enthält
  - Form der Attribute muss festgelegt werden

  *Beispiel*
  #table(
    columns: (1fr, 1fr, 1fr),
    stroke: hszg-green + 2.5pt,
    inset: 10pt,
    fill: (x, y) => {
      if (y == 0) {
        return hszg-green
      } else {
        return hszg-green.lighten(90%)
      }
    },
    table.header(
      [*Attribut*], [*Form*], [*Datentyp*]
    ),
    [Position], [3D-Vektor], [FLOAT 32],
    [UV], [2D-Vektor], [FLOAT 32],
    [Normale], [3D-Vektor], [FLOAT 32],
    [ID], [1], [UINT 16]
  )
]

#slide[
  = Grafikpipeline
  == #text(fill: blue)[Input Assembler] #h(1fr) #text(weight: "light", fill: gray)[$arrow$] #text(fill: hszg-green.lighten(50%), weight: "light")[Vertex Shader]
  #set align(horizon)

  #grid(
    columns: (1fr, 1fr),
    align: center + horizon,
    [
      *Vertex Buffer* \

      #set text(size: 13pt)
      4.55, 4.99, 5.03, 0.09, 0.56, 0.50, 0.73, 0.21, 0, \
      4.55, 4.99, 5.03, 0.09, 0.56, 0.50, 0.73, 0.21, 1, \
      4.55, 4.99, 5.03, 0.09, 0.56, 0.50, 0.73, 0.21, 2, \
      4.55, 4.99, 5.03, 0.09, 0.56, 0.50, 0.73, 0.21, 3, \

      #diagram(
        edge((0, 0), (0, 1), "-|>")
      )

      (#text(fill: blue)[4.55, 4.99, 5.03]), (#text(fill: red)[0.09, 0.56]), (#text(fill: hszg-green)[0.50, 0.73, 0.21]), #text(fill: purple)[0], \
      (#text(fill: blue)[4.55, 4.99, 5.03]), (#text(fill: red)[0.09, 0.56]), (#text(fill: hszg-green)[0.50, 0.73, 0.21]), #text(fill: purple)[1], \
      (#text(fill: blue)[4.55, 4.99, 5.03]), (#text(fill: red)[0.09, 0.56]), (#text(fill: hszg-green)[0.50, 0.73, 0.21]), #text(fill: purple)[2], \
      (#text(fill: blue)[4.55, 4.99, 5.03]), (#text(fill: red)[0.09, 0.56]), (#text(fill: hszg-green)[0.50, 0.73, 0.21]), #text(fill: purple)[3], 
    ], [
      #text(fill: blue)[Position] \
      #text(fill: red)[UV] \
      #text(fill: green)[Normale] \
      #text(fill: purple)[ID] \
    ]
  )
]

#slide[
  = Grafikpipeline
  == #text(fill: blue.lighten(50%), weight: "light")[Input Assembler] #text(fill: gray)[$arrow.l$] #h(1fr) #text(fill: hszg-green)[Vertex Shader] #h(1fr) #text(weight: "light", fill: gray)[$arrow$] #text(fill: blue.lighten(50%), weight: "light")[Tesselator]
  #set align(horizon + center)

  #grid(
    columns: (0.5fr, 1fr),
    inset: 10pt,
    [
      #set align(left)
      #set text(size: 15pt)
      - Transformiert einen Input zu einem neuen Output
      - Kann neue Daten einfügen wie z.B. _Color_
      - Jede Vertex sollte nach der Transformation innerhalb von $-1$ und $1$ liegen
    ], [
      #set align(center)
      #diagram(
        node-stroke: 2.5pt,
        node-corner-radius: 5pt,
        node-inset: 10pt,
        node-shape: fletcher.shapes.rect,
        node((0, 0), width: 250pt)[
          #set align(center)
          #grid(
            columns: (auto, 1fr),
            inset: 5pt,
            grid.cell(align: right)[#text(fill: gray.darken(50%))[Position]], grid.cell(align: left)[$(4.22, 3.41, 5.73)$],
            grid.cell(align: right)[#text(fill: gray.darken(50%))[UV]], grid.cell(align: left)[$(0.48, 0.31)$],
            grid.cell(align: right)[#text(fill: gray.darken(50%))[Normal]], grid.cell(align: left)[$(0.65, 0.73, 0.29)$],
            grid.cell(align: right)[#text(fill: gray.darken(50%))[ID]], grid.cell(align: left)[$5$]
          )
        ],
        edge("-|>"),
        greenBox(position: (0, 1))[Vertex Shader],
        edge("<|-"),
        node((1, 1))[Matrix],
        edge((0, 1), (0, 2), "-|>"),
        node((0, 2), width: 250pt)[
          #set align(center)
          #grid(
            columns: (auto, 1fr),
            inset: 5pt,
            grid.cell(align: right)[#text(fill: gray.darken(50%))[Position]], grid.cell(align: left)[$(0.57, 0.35, 0.82)$],
            grid.cell(align: right)[#text(fill: gray.darken(50%))[UV]], grid.cell(align: left)[$(0.48, 0.31)$],
            grid.cell(align: right)[#text(fill: gray.darken(50%))[Color]], grid.cell(align: left)[$(0.42, 0.96, 0.31)$]
          )
        ],  
        edge("--", stroke: 2pt + gray),
        node((1, 2))[
          $
            -1 lt.eq &x lt.eq 1 \
            -1 lt.eq &y lt.eq 1 \
            -1 lt.eq &z lt.eq 1
          $
        ]
      )
    ]
  )
]

// #slide[
//   = Grafikpipeline
//   == #text(fill: blue.lighten(50%), weight: "light")[Input Assembler] #text(fill: gray)[$arrow.l$] #h(1fr) #text(fill: hszg-green)[Vertex Shader] #h(1fr) #text(weight: "light", fill: gray)[$arrow$] #text(fill: blue.lighten(50%), weight: "light")[Tesselation]
//   #set align(horizon + center)

//   ```glsl
//   struct INPUT {
//     float4 position : POSITION;
//     float2 uv : TEXCOORD;
//     float3 normal : NORMAL;
//     uint id : SV_VertexId;
//   }
//   ```
// ]

#slide[
  = Grafikpipeline
  == #text(fill: hszg-green.lighten(50%), weight: "light")[Vertex Shader] #text(fill: gray)[$arrow.l$] #h(1fr) #text(fill: blue)[Tesselation] #h(1fr) #text(weight: "light", fill: gray)[$arrow$] #text(fill: hszg-green.lighten(50%), weight: "light")[Geometry Shader]
  #set align(horizon)
  #v(1fr)
  - Umfasst: Hull Shader, Tesselator und Domain Shader
  - Vereinfacht: Es nimmt eine primitive Form an und gibt eine höher aufgelöste Version davon aus
  - *Hull Shader:* definiert das Muster der Oberfläche
  - *Tesselator:* erstellt Triangles basierend auf dem Muster
  - *Domain Shader:* positioniert die Triangles
  #v(1fr)
  #figure(
    cetz.canvas({
      import cetz.draw: *

      let strokeThickness = 2.5pt

      line((-5, -2), (-5, 2), (-1, 2), (-1, -2), close: true, stroke: 2.5pt)
      line((-1, 0), (2, 0), mark: (end: ">"), stroke: 2.5pt)
      line((2, -0.5), (2, 0.5), (9, 0.5), (9, -0.5), close: true, stroke: 2.5pt)
      content((5.5, 0), [Tesselation])
      line((9, 0), (12, 0), mark: (end: ">"), stroke: 2.5pt)
      
      let tL = (12, 2)
      let tR = (16, 2)
      let bL = (12, -2)
      let bR = (16, -2)
      line(tL, tR, bR, bL, close: true, stroke: 2.5pt)

      line((13, 2), (16, -1), stroke: 2.5pt)
      line((14, 2), (16, 0), stroke: 2.5pt)
      line((15, 2), (16, 1), stroke: 2.5pt)
      line(tL, bR, stroke:2.5pt)
      line((12, 1), (15, -2), stroke: 2.5pt)
      line((12, 0), (14, -2), stroke: 2.5pt)
      line((12, -1), (13, -2), stroke: 2.5pt)

      line((12, 1), (16, 1), stroke: strokeThickness)
      line((12, 0), (16, 0), stroke: strokeThickness)
      line((12, -1), (16, -1), stroke: strokeThickness)

      line((13, 2), (13, -2), stroke: strokeThickness)
      line((14, 2), (14, -2), stroke: strokeThickness)
      line((15, 2), (15, -2), stroke: strokeThickness)
    }),
  )
  #v(1fr)
]

#slide[
  = Grafikpipeline
  == #text(fill: blue.lighten(50%), weight: "light")[Tesselation] #text(fill: gray)[$arrow.l$] #h(1fr) #text(fill: hszg-green)[Geometry Shader]  #h(1fr) #text(weight: "light", fill: gray)[$arrow$] #text(fill: blue.lighten(50%), weight: "light")[Rasterizer]
  #set align(horizon)
  - Nimmt ein Grafikprimitiv an und modifiziert es nach Spezifikation
  - Primtiv kann ohne Ändernug weiter gegeben werden oder mit neuen Vertices modifiziert werden
  - *Beispiel 1:* Aus einem Triangle kann mit einer neuen Vertex eine Pyramide gemacht werden
  - *Beispiel 2:* Nimmt eine Linie entgegen und modifiziert sie zu einer Plane aus 2 Triangles (nützlich für Haare)
  - *Beispiel 3:* Nimmt einen Punkt entgegen und modifiziert ihn zu einem Quad aus 2 Triangles (nützlich für Partikelsysteme)
]

#slide[
  = Grafikpipeline
  == #text(fill: hszg-green.lighten(50%), weight: "light")[Geometry Shader] #text(fill: gray)[$arrow.l$] #h(1fr) #text(fill: blue)[Rasterizer]  #h(1fr) #text(weight: "light", fill: gray)[$arrow$] #text(fill: hszg-green.lighten(50%), weight: "light")[Pixel Shader]
  #set align(horizon)
  - *Input:* Jedes Triangle der Szene
  - *Output:* Ein Grid an Pixeln
  - Konvertierung aller Meshes in ein Pixelgrid basierend auf Kamera in der Szene
  - Nutzung eines Depth Buffers um Triangles in korrekter Anordnung zu rendern
  - Depth Buffer: Umwandlung der $z$ Koordinate aller eines Dreiecks in eine Farbe (Grayscale). Je näher das Triangle ist, desto dunkler wird die Farbe.
  - Rasterizer erstellt Pixelinformationen und gibt sie an den Pixel Shader weiter
]

#slide[
  = Grafikpipeline
  == #text(fill: blue.lighten(50%), weight: "light")[Rasterizer] #text(fill: gray)[$arrow.l$] #h(1fr) #text(fill: hszg-green)[Pixel Shader]  #h(1fr) #text(weight: "light", fill: gray)[$arrow$] #text(fill: blue.lighten(50%), weight: "light")[Output Merger]
  #set align(horizon + center)
  
  #diagram(
    node-stroke: 2.5pt,
    node-corner-radius: 5pt,
    node-inset: 10pt,
    node-shape: fletcher.shapes.rect,
    node((0, 0), width: 250pt)[
      #set align(center)
      #grid(
        columns: (auto, 1fr),
        inset: 5pt,
        grid.cell(align: right)[#text(fill: gray.darken(50%))[Position]], grid.cell(align: left)[$(0.31, 0.51, 0.98)$],
        grid.cell(align: right)[#text(fill: gray.darken(50%))[UV]], grid.cell(align: left)[$(0.48, 0.31)$],
        grid.cell(align: right)[#text(fill: gray.darken(50%))[Normal]], grid.cell(align: left)[$(0.65, 0.73, 0.29)$],
        grid.cell(align: right)[#text(fill: gray.darken(50%))[ID]], grid.cell(align: left)[$5$]
      )
    ],
    edge("-|>"),
    greenBox(position: (0, 1))[Pixel Shader],
    edge((0.78, 1), (0, 1), "-|>"),
    node((1, 0.82), width: 100pt, height: 35pt)[Texture],
    node((1, 1.3), width: 100pt, height: 35pt)[Sampler],
    edge((0, 1), (0, 2), "-|>"),
    node((0, 2), width: 60pt, shape: fletcher.shapes.circle, fill: red, stroke: red)
  )
]

#slide[
  = Grafikpipeline
  == #text(fill: hszg-green.lighten(50%), weight: "light")[Pixel Shader] #text(fill: gray)[$arrow.l$] #h(1fr) #text(fill: blue)[Output Merger]  #h(1fr) #text(weight: "light", fill: gray)[$arrow$] #text(fill: gray, weight: "light")[Render Output]
  #set align(horizon)
  #v(1fr)
  - Nimmt die Farb , Tiefen Informationen, Render Target und Depth Buffer eines Pixels
  - Typischerweise ist der Output die gleiche Farbe wie der Input
  - Blending von Input Farbe und Render Target Farbe kann hier geschehen
  #v(1fr)
  $P_("depth") lt "Depth Buffer"$: \ Output Merger schreibt Werte in Render Target und Depth Buffer. \
  $P_("depth") gt "Depth Buffer"$: \ Render Target Farbe wird nicht überschrieben. Die Farbe bleibt gleich.
  #v(1fr)
]
