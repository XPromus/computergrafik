#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": chapter-title-slide
// #import "../../Components/chapter_titile_slide.typ": chapter-title-slide

#let chapter_title = [Anwendung]
#chapter-title-slide(section-name: chapter_title)

#slide[
  = #chapter_title
  #set align(horizon)
  #toolbox.side-by-side()[
    - Entertainment
      - Filme
      - Videospiele
    #text(fill: gray.lighten(75%))[
      - Architektur Walk-throughs
      - Datenvisualisierung
      - Robotik
      - Produktentwicklung
        - Autoindustrie
      - Trainingssimulationen
        - Flugsimulator
        - Militär
        - Fahrschule
    ]
    
  ][
  ]
]

#slide[
  = #chapter_title
  #set align(horizon)
  #toolbox.side-by-side()[
    - Entertainment
      - Filme
      - Videospiele
    - *Architektur Walk-throughs*
    #text(fill: gray.lighten(75%))[
      - Datenvisualisierung
      - Robotik
      - Produktentwicklung
        - Autoindustrie
      - Trainingssimulationen
        - Flugsimulator
        - Militär
        - Fahrschule
    ]
    
  ][
    #figure(
      image("../../Images/izu_hzsg.png", fit: "contain"),
      caption: [Virtuelle Darstellung eines Umgebindehauses (#link("https://umgebindehaus.hszg.de/")[IZU])]
    )
  ]
]

#slide[
  = #chapter_title
  #set align(horizon)
  #toolbox.side-by-side()[
    - Entertainment
      - Filme
      - Videospiele
    - Architektur Walk-throughs
    - Datenvisualisierung
    - *Robotik*
    #text(fill: gray.lighten(75%))[
      - Produktentwicklung
        - Autoindustrie
      - Trainingssimulationen
        - Flugsimulator
        - Militär
        - Fahrschule
    ]
    
  ][
    #figure(
      image("../../Images/simulator.png", fit: "contain", width: 80%)
    )
  ]
]

#slide[
  = #chapter_title
  #set align(horizon)
  #toolbox.side-by-side()[
    - Entertainment
      - Filme
      - Videospiele
    - Architektur Walk-throughs
    - Datenvisualisierung
    - Robotik
    - Produktentwicklung
      - Autoindustrie
    - Trainingssimulationen
      - Flugsimulator
      - Militär
      - Fahrschule
  ][
    #figure(
      image("../../Images/izu_hzsg.png", fit: "contain", width: 250pt)
    )
    #figure(
      image("../../Images/simulator.png", fit: "contain", width: 250pt)
    )
  ]
]
