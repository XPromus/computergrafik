#import "@preview/polylux:0.4.0": *

#import "@preview/frame-it:1.2.0": *
#let (notice, definition, guideline) = frames(
  notice: ("Hinweis", red),
  definition: ("Definition"),
  guideline: ("Richtlinie"),
)

#import "@preview/cetz:0.4.2"
//#import "@preview/cetz-plot:0.1.3": plot, chart
//#import draw: circle, content, line, scope, set-style, translate

#let custom-node(pos, label, color, name) = {
  content(pos, $V_#label$, frame: "circle", radius: 0.25, fill: color, stroke: 0.8pt, name: name, padding: 3.5pt)
}

#import "@preview/plotst:0.2.0": *

#import "@preview/codly:1.3.0": *
#import "@preview/codly-languages:0.1.1": *

#import "@preview/lilaq:0.5.0" as lq

#import "@preview/fletcher:0.5.8" as fletcher: diagram
