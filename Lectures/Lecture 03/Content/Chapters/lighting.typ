#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": hszg-green, chapter-title-slide, subchapter-title-slide

#chapter-title-slide(section-name: [Beleuchtung])

#slide[
  = Lichtquellen
  #set align(horizon)
  *Eigenschaften*:
  - Position $(x, y, z)$, Richtung und Wellenlänge
  - Intensität $I$
  *Lichtquellenarten*:
  - Ambientes Licht
    - Beleuchtungen von allen Oberflächen gleichmäßig
    - Unabhängig von der Betrachterposition
  - (isotropes) Punktlicht
    - Emittiert Licht in alle Richtungen
    - Intensität in Abhängigkeit einer Abstandsfunktion
    - Hat keine räumliche Ausdehnung
]

#slide[
  = Lichtquellen in Blender
  #set align(horizon)

  *Point*: Omnidirektionaler Lichtpunkt (in alle Richtungen gleiche Lichtmenge), Richtung des Lichs durch Intersection-Line bestimmt \

  *Sun*: Direktionales Licht, simuliert unendlich weit entfernte Lichtquelle, Licht ist parallel mit konstanter Intensität \
  
  *Spot*: emittiert einen kegelförmigen Lichtstrahl von der Spitze des Kegels in eine bestimmte Richtung \
  
  *Area*: simuliert Licht, das von einem Oberflächen-Emitter stammt
]

#subchapter-title-slide(section-name: [Arten von Lichtquellen])

#slide[
  = Ambientes Licht
  #set align(horizon)
  - Gleichmäßige Beleuchtung durch hochdiffuse Lichtquellen
  - Wahl von globalem Modell (modellierung aller Lichtquellen und Interaktionen) oder vereinfachtes Konzept _Ambient Light_
  - Unabhängig von Betrachterposition
]

#slide[
  //TODO: More Infos
  = Punktlicht
  #set align(horizon)
  - Punktlichter emittieren Licht in alle Richtungen
  - Intensität der Beleuchtung ist das Inverse des Quadrats der Entfernung von Quelle und Oberfläche
  - Werden eher eingesetzt aus Effizienz-Gründen, weniger wegen Realismus
]

#slide[
  = Spotlight
  #set align(horizon)
  - Point Lights mit limitierter Richtung
  - Realismus kann erhöht werden durch variierende Intensität entlang des Kegels
  - Kein Licht außerhalb des Kegels, aber harte Verläufe eher unnatürlich
]

#slide[
  = Distant Light
  #set align(horizon)
  - Lichtquellen, welche weit (unendlich) von der Oberfläche entfernt sind
  - Licht fällt parallel
  - Keine Dämpfung
  - Beispiel: Sonne in Blender
]

#slide[
  = Beleuchtung zusammengefasst
  #set align(horizon)
  Beleuchtungsmodelle: 
  - *Lokal*: z.B.: Phong-Modell
  - *Global*: Raytracing, Radiosity, Path Tracing
  Begrifflichkeit:
  - *Beleuchtung*: Interaktion von Licht mit Materie
  - *Shading*: Berechnung der Beleuchtung an Vertices und Bestimmung der Farbe
  Drei Arten der Interaktion von Licht mit Materie
  - *Specular*: Reflexion in eine Richtung
  - *Diffuse*: Reflexion in alle Richtungen (Streuung)
  - *Durchsichtigkeit*: Brechung des Lichts
]

#chapter-title-slide(section-name: [Beleuchtungsmodelle])

#slide[
  = Beleuchtungsmodelle
  #set align(horizon)
  - Beleuchtungsstärke $I$ an einem Punkt wird als Summe mehrerer Terme modelliert
    - Mehr Terme ergeben plausiblere Ergebnisse
    - Weniger Terme führen zu effizienteren Berechnungen
  - Phong-Reflexionsmodell wird häufig beim Echtzeitrendering verwendet

  #figure(
    image("../../Images/components_of_lighting.png", fit: "contain"),
    caption: [
      Komponenten der gerenderten Farbe auf einem Modell.
    ]
  )
]

#let phongReflectionModel = [Phong Reflection Model]
#subchapter-title-slide(section-name: phongReflectionModel)

#slide[
  = #phongReflectionModel
  #set align(horizon)
  - 1975 von Bui Tuong Phong vorgestellt
  - empirisches Modell, widerspricht Energieerhaltungssatz
  - Lichtquellen sind punktförmig

  #figure(
    image("../../Images/phong_reflection_components.png", fit: "contain"),
    caption: [
      Bestandteile des Phong-Reflexionsmodells
    ]
  )
]

#slide[
  = #phongReflectionModel
  #set align(horizon)

  $ I_("out") eq I_("ambient") plus I_("diffuse") plus I_("specular") $

  $I_("ambient")$ Ambiente Komponente:
  - Unabhängigkeit von Einfallswinkel und Blickwinkel
  - Abhängig von Reflexionsfaktor (Material) und Umgebungslicht

  $I_("diffuse")$ Diffuse Komponente:
  - Reflexion in alle Richtungen, unabhängig von Standpunkt
  - Abhängig von Einfallswinkel und diffuser Reflexionsfaktor

  $I_("specular")$ Spiegelnde Komponente:
  - Reflexion des Lichts in idealer Richtung
  - Abhängig von Einfallswinkel, Reflexionsfaktor, Oberfläche und Blickrichtung
]

#slide[
  = #phongReflectionModel
  == $I_("ambient")$
  #set align(horizon)
  #grid(
    columns: (1fr),
    [
      #rect(stroke: hszg-green + 2pt, fill: hszg-green.lighten(90%), width: 100%, inset: 15pt)[
        $I_("ambient") eq I_(a) times k_("ambient")$
      ]
    ], [
      #rect(stroke: hszg-green + 2pt, width: 100%, inset: 15pt)[
        $I_(a)$ ... Intensität des Umgebungslichts \
        $k_("ambient")$ ... Materialkonstante
      ]
    ]
  )
]

#slide[
  = #phongReflectionModel
  == $I_("diffus")$
  #set align(horizon)
  
  #grid(
    columns: (1fr),
    [
      #rect(stroke: hszg-green + 2pt, fill: hszg-green.lighten(90%), width: 100%, inset: 15pt)[
        $I_("diffus") eq I_("in") times k_("diffus") times cos(phi)$
      ]
    ], [
      #rect(stroke: hszg-green + 2pt, width: 100%, inset: 15pt)[
        - $I_("in")$ ... Lichtstärke einfallender Lichtstrahl
        - $k_("diffus")$ ... diffuser Reflexionsfaktor
        - $phi$ ... Winkel zwischen Normale der Oberfläche und Lichtstrahl
      ]
    ]
  )
]

#slide[
  = #phongReflectionModel
  == $I_("specular")$
  #set align(horizon)

  #grid(
    columns: (1fr),
    [
      #rect(stroke: hszg-green + 2pt, fill: hszg-green.lighten(90%), width: 100%, inset: 15pt)[
        $I_("specular") eq I_("in") times k_("specular") times cos^(n)(theta)$ 
      ]
    ], [
      #rect(stroke: hszg-green + 2pt, width: 100%, inset: 15pt)[
        - $I_("in")$ ... Lichtstärke einfallender Lichtstrahl
        - $k_("specular")$ ... Reflexionsfaktor für Spiegelung
        - $theta$ ... Winkel zwischen Reflexionsrichtung und Blickrichtung
        - n ... Konstante zur Beschreibung von Oberflächenbeschaffenheit
      ]
    ]
  )
]

#slide[
  = #phongReflectionModel
  #set align(horizon)
  - Erweiterung für spiegelnde Komponente: Normalisierungsfaktor
  - Helligkeit soll bei großen Werten $n$ nicht abnehmen
  - sinnvoller Faktor: $f eq frac((n plus 2), 2 times pi)$
  $ I_("specular") eq I_("in") times k_("specular") times f times cos^(n)(theta) $

  *Gesamtdarstellung* für $I_("out") eq I_("ambient") plus I_("diffuse") + I_("specular")$ \
  #grid(
    columns: (1fr, 1fr),
    align: center,
    inset: 15pt,
    [$accent(L, arrow)$ ... Lichteinfallvektor], [$accent(N, arrow)$ ... Normale der Oberfläche],
    [$accent(R, arrow)$ ... Reflexionsvektor ], [$accent(V, arrow)$ ... Sichtvektor]
  )
  
  $ 
    I_("out") &eq I_(a) times k_("ambient") plus I_("in") times k_("diffuse") times cos(phi) plus I_("in") times k_("specular") times frac(n plus 2, 2 times pi) times cos^(n)(theta) \
    I_("out") &eq I_(a) times k_("ambient") plus I_("in") times [k_("diffuse") times (accent(L, arrow) accent(N, arrow)) plus k_("specular") times frac(n plus 2, 2 times pi) times (accent(R, arrow) accent(V, arrow))^(n)] 
  $
]

#slide[
  = Beleuchtungsmodelle
  #set align(horizon)
  #set text(size: 15pt)
  Das Phong Beleuchtungsmodell enthält nur:
    - Lichtquellen
    - Materialien am Objektpunkt
    - Bekannt als "Lokales Modell"
  #line(length: 100%)
  Moderne *Physically-Based Rendering (PBR)* Ansätze verwenden verschiedene lokale Beleuchtungs- und Reflexionsmodelle (z.B.: Cook-Torrance)
    - Energieerhaltung: es ist unmöglich, Objekte zu modellieren, bei denen das ausgehende Licht größer ist als das eingehende
    - Das Erscheinungsbild von Metallen ist realistischer
    - Einfaches Festlegen von 3D-Modellen, die in allen Anwendungen gut aussehen (kein Tweaking erforderlich)
    - Verbreitet in modernen Spiel-Engines und 3D Software (Unity, Unreal, Blender ...)
  #line(length: 100%)
  Echte Beleuchtung gehört dazu:
    - Lichtreflexion von einem Objekt auf ein anderes (globales Modell)
    - Zusätzliche Lichtquellen für einen Objektpunkt
    - Transparenz
    - Raytracing, Radiosity-Ansätze
]
