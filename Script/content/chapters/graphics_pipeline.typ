#import "@preview/fletcher:0.5.8" as fletcher: diagram, node, edge

= Grafikpipeline

#figure(
  diagram(
    node-stroke: 1pt,
    node-fill: gradient.radial(blue.lighten(80%), blue, center: (30%, 20%), radius: 80%),
    spacing: 4em,
    node((0,0), [Application], name: <application_node>),
    node((1,0), [Vertex Program], name: <vertex_node>),
    node((2,0), [Geometry Program], name: <geometry_node>),
    node((2,1), [Clipping Rasterization], name: <clipping_node>),
    node((1,1), [Fragment Program], name: <fragment_node>),
    node((0,1), [Framebuffer Operations], name: <framebuffer_node>),

    edge(<application_node>, <vertex_node>, "-|>"),
    edge(<vertex_node>, <geometry_node>, "-|>"),
    edge(<geometry_node>, <clipping_node>, "-|>"),
    edge(<clipping_node>, <fragment_node>, "-|>"),
    edge(<fragment_node>, <framebuffer_node>, "-|>"),
  ),
  caption: [Ablauf einer einfachen Grafikpipeline]
)

== OpenGL Pipeline
@renderingPipelineOverview

Die Rendering-Pipeline wird ausgeführt, wenn eine Rendering-Operation durchgeführt wird. 
Damit diese Operation durchgeführt werden kann, muss ein definiertes Vertex Array Objekt und ein Programm Objekt oder Programm Pipeline Objekt für die Shader vorhanden sein. 


#let unprogrammableFill = yellow
#let optionalStroke = (dash: "dashed", thickness: 1pt)
#let programmableFill = blue.lighten(60%)

#figure(
  diagram(
    node-stroke: 1pt,
    spacing: 4em,
    node((0,0), [Vertex Spezifikation], name: <vertex_specification>, fill: unprogrammableFill),
    edge("-|>"),
    node((0,0.5), [Vertex Shader], name: <vertex_shader>, fill: programmableFill),
    edge("-|>"),
    node((0,1), [Tesselation], name: <tesselation>, stroke: optionalStroke, fill: programmableFill),
    edge("-|>"),
    node((0,1.5), [Geometry Shader], name: <geometry_shader>, stroke: optionalStroke, fill: programmableFill),
    edge("-|>"),
    node((0,2), [Vertex Post-Processing], name: <vertex_post_processing>, fill: unprogrammableFill),
    edge("-|>"),
    node((0,2.5), [Primitive Assembly], name: <primitive_assembly>, fill: unprogrammableFill),
    edge("-|>"),
    node((0,3), [Rasterization], name: <rasterization>, fill: unprogrammableFill),
    edge("-|>"),
    node((0,3.5), [Fragment Shader], name: <fragment_shader>, stroke: optionalStroke, fill: programmableFill),
    edge("-|>"),
    node((0,4), [Per-Sample Operations], name: <per_sample_operations>, fill: unprogrammableFill),

    node((2,0), [Optional], stroke: optionalStroke),
    node((2,0.5), [Programmierbar], fill: programmableFill),
    node((2,1), [Unprogrammierbar], fill: unprogrammableFill)
  ),
  caption: [

  ]
)

=== Vertex Processing
1. Jede Vertex im Vertex Array wird von einem Vertex Shader beeinflusst. Jede Vertex wird dabei zu einer Output Vertex umgewandelt.
2. Optionale primitive Tesselations-Schritte
3. Optionaler Geometrie-Shader. Der Output ist dabei eine Sequenz an Primitiven

=== Vertex Post-Processing
Die Ausgaben der letzten Stage werden angepasst und zu unterschiedlichen Stellen gebracht.
1. Transform Feedback
2. Primitive Assembly
3. Primitive Clipping, perspective divide, viewport transform zum Window Space
=== 
