#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": *

#chapter-title-slide(section-name: [Einführung])

#slide[
  = Was ist Computergrafik
  #set align(horizon)
  Der Begriff _Computergrafik_
  - geht zurück auf William Fetter (1928-2002), 1960
  - Name für neue Konstruktionsmethoden, die er bei Boeing verfolgte
  - Fetter, der das Cockpit-Design erforschte, schuf auf einem Stiftplotter mit Hilfe eines 3D-Modells eines menschlichen Körpers weitgehend reproduzierte Bilder
]

#slide[
  = Was ist 3D Computergrafik
  #set align(horizon)
  #text(style: "italic")[
    “Perhaps the best way to deﬁne computer graphics is to ﬁnd out what it is not. 
    It is not a machine. 
    It is not a computer, nor a group of computer programs. 
    It is not the know-how of a graphic designer, a programmer, a writer, a motion picture specialist, or a reproduction specialist. \

    Computer graphics is all these - a consciously managed and documented technology directed toward communicating information accurately and descriptively.”
  ]

  #text(weight: "light")[Computer Graphics, by William A. Fetter, 1966]
]

#slide[
  = Was ist 3D Computergrafik
  #set align(horizon)
  Computer graphics (CG) is the ﬁeld of visual computing, where one utilizes computers both to generate visual images synthetically and to integrate or alter visual and spatial information sampled from the real world. [Wikipedia]

  -> Geometry-based Graphics \
  -> Sample-based Graphics
]

#slide[
  = Was ist 3D Computergrafik
  #set align(horizon)
  - *Modeling* = Repräsentation von 3D Objekten
  - *Rendering* = Erstellung von 2D Bildern aus 3D Modellen
  - *Animation* = Simulation von Zustandsänderungen über die Zeit

  #figure()[
    #diagram(
      node-stroke: 1pt,
      node-inset: 25pt,
      node-shape: rect,
      node((0, 0))[
        #figure()[
          #diagram(
            node-stroke: 1pt,
            node-inset: 10pt,
            node-shape: rect,
            node((0, 0.5))[
              #image("../../Images/noto-v1--camera.svg", width: 35pt)
              Camera
            ],
            node((1, 0))[
              #image("../../Images/noto--light-bulb.svg", width: 35pt)
              Light
            ],
            node((1, 1))[
              #image("../../Images/streamline-flex--cube.svg", width: 35pt)
              3D Model
            ],
          )
        ]
        *3D Scene*
      ],
      edge("-|>"),
      node((2, 0))[
        #image("../../Images/streamline-flex-color--cube.svg", width: 70pt)
        *2D Image*
      ]
    )
  ]
]

#slide[
  = Historischer Überblick
  #set align(horizon)
  - Zeichenanzeigen (1960-heute)
  - Vektordarstellung (1963-1980er Jahre)
  - 2D-Bitmap-Rasteranzeigen für PCs und Workstations
  - 3D-Grafik-Workstations
  - Grafikkarten und GPUs
]

#slide[
  = 3D Computergrafik in Videospielen
  #set align(horizon)
  - 1952: erstes grafisches Videospiel OXO von Alexander Douglas
  - 1958: Tennis for two, erstes interaktives Videospiel
  - 1961: Spacewar!, entwicklet am MIT
  - 1972: Gründung von ATARI, Entwicklung von PONG
  - 1978: Space Invaders, erstes Spiel in Farbe
  - 1979: Asteroids > 50.000 verkaufte Exemplare
  - 1994: Veröffentlichung von Sega Saturn und Sony Playstation
  - 1996: Veröffentlichung von Nintendo 64
  - Hardware ermöglichte erstmals 3D-Grafikdarstellung
]

#slide[
  = 3D Computergrafik in Filmen
  #set align(horizon)
  - Pixars erster Kurzfilm: Die Abenteuer von Andre und Wally.B (1984)
  - Toy Story als erster vollständig 3D-Animietert Film (1995)
  - Vorgänger: Tin Toy (1988)
  - Animationsfilme mit Blender:
    - Elephant's Dream
    - Big Buck Bunny
]

#slide[
  = Neue Formen digitaler Medien
  #set align(horizon)
  - Virtuelle Realität (fully immersive VR)
  - CAVE, HMDs
  - Semi-immersive VR
  - Augmented Reality
]

#slide[
  = Hardwareentwicklung
  #set align(horizon)
  - Spieleplattformen:
    - #text(weight: "light", "Xbox Series: 52 CUs@1,825 GHz mit 12,15 TeraFlops")
    - #text(weight: "light", "Playstation 5: AMD RDNA2 36 CUs @ 2,23 GHz mit 10,28 TeraFlops")
  - Top Grafikkarten:
    - #text(weight: "light")[Benchmarks ermöglichen Ranking von GPUs]
    - #text(weight: "light")[momentan: GeForce RTX 5090]
  - Advances in transistor counts ... (CPUs and GPUs)
    - #text(weight: "light")[AMD Ryzen (2017) has 4.8 billion transistors]
    - #text(weight: "light")[GeForce GTX 1080 (single core) has 7.2 billion transistors]
    - #text(weight: "light")[Geforce GTX 2080 Ti (dual core) has 18.6 billion transistors]
    - #text(weight: "light")[Radeon Fury has 8.9 billion, Radeon Pro Duo (dual core) has 17.8 billion transistors]
]
