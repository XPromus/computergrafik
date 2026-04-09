#import "../../Template/definitions.typ": *
#import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#slide[
  #toolbox.register-section([Überblick])
  = Kontaktdaten
  #set align(horizon)
  - E-Mail: #text(fill: blue, "christopher.hilgner@stud.hszg.de")
  - GitHub: #link("https://github.com/XPromus")[#text(fill: blue, "https://github.com/XPromus")]
]

#slide[
  = Prüfung
  #set align(horizon)
  *Schriftliche Klausur*
  - 120 Minuten
  - Themen aus den Vorlesungen und Übungen
  - Verständnisfragen
  - Grundbegriffe sollten bekannt und erklärbar sein
]

#slide[
  = Inhalte
  == Themen der Vorlesung
  #set align(horizon)
  - Rendering: Rendering Pipeline, Raytracing, Radiosity, Volume Rendering
  - Licht & Schatten
  - Partikelsysteme
  - Optimierung
  - Computeranimationen
  - Hardware
  - Mathematische Bestandteile der Computergrafik
]

#slide[
  = Inhalte
  == Themen des Seminars
  #set align(horizon)
  - Blender
    - 3D Modellierung, Animationen, Rendering
  - OpenGL in Java mit #link("https://www.lwjgl.org/")[#text(fill: blue)[LWJGL]]
  - Ergänzungen zu Unity
  - Vielleicht auch etwas #link("https://www.vulkan.org/")[#text(fill: blue)[Vulkan]]

  #grid(
    columns: (1fr, 1fr, 1fr),
    inset: 15pt,
    [
      #image("../../Images/blender.png")
    ], [
      #image("../../Images/opengl.svg")
    ], [
      #image("../../Images/unity.png")
    ]
  )
]

#slide[
  = Literatur
  #set align(horizon)
  #grid(
    columns: (0.4fr, 1fr),
    inset: 5pt,
    [
      #image("../../Images/literature/computergrafik_springer_cover.webp", fit: "contain")
    ], [
      #set align(top + right)
      #text(weight: "bold", size: 20pt)[Computergrafik] \
      #text(weight: "regular", size: 18pt)[Band I des Standardwerks Computergrafik und Bildverarbeitung] \

      A. Nischwitz, M. Fischer, P. Haberäcker, G. Socher

      #v(25%)

      #link("https://link.springer.com/book/10.1007/978-3-658-25384-4")[
        #text(fill: blue)[Link zur Springer Website $=>$]
      ]
    ]
  )
]

#slide[
  = Literatur
  #set align(horizon)
  - A. Nischwitz, M. Fischer, P. Haberäcker & G. Socher (Hrsg.): Computergraﬁk. eXamen.press, Springer Vieweg, 2019 (4. Auﬂage).
  - Akenine-Möller, Haines, Hoﬀmann, Pesce, Iwanicki & Hillaire. Real Time Rendering. 5. Auﬂage, CRC Press. 2018.
  - Marschner & Shirley. Fundamentals of Computer Graphics. 4. Auﬂage, Taylor & Francis Ltd, 2016.
]
