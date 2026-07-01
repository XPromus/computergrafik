#import "../../Template/definitions.typ": *
#import "../../Template/template.typ": *

#chapter-title-slide(section-name: [Radiosity])

#slide[
  = Raytracing vs. Radiosity
  #set align(horizon)

  #v(1fr)
  *Raytracing* ist sehr gut für spekuläre bzw. transparente Umgebungen geeignet 
  #line(length: 100%)
  *Radiosity* ist sehr gut für diffuse Umgebunden geeignet
  #v(1fr)
  #grid(
    columns: (1fr, 1fr),
    [
      - Ansatz über globale Energiebilanz
      - Betrachterunabhängig
      - Höherer Rechenbedarf
      - Schwer für ideal globale Beleuchtung
    ], [
      #figure(
        image("../../Images/radiosity_example_1.png")
      )
    ]
  )
  #v(1fr)
]

#slide[
  = Raytracing vs Radiosity
  #set align(horizon)

  #grid(
    columns: (1fr, 1fr),
    [
      - In der realen Welt beeinflussen sich diffuse Oberflächen gegenseitig
      - Beeinflussung der Farbgebung
        - Eine rote Wand neben der weißen Wand
        - Diffuses Licht von Weiß auf Rot und umgekehrt
      - Diffus-Diffus-Interaktion
      - Nicht berücksichtigt bei lokalen Modellen oder Raytracing
    ], [
      #figure(
        image("../../Images/radiosity_example_2.png", width: 90%)
      )
    ]
  )
]

#slide[
  = Radiosity
  #set align(horizon)

  - Radiosity ist eine numerische Methode für die Approximation von diffus-diffus-Interaktion
  - Standardverfahren:
    - Unterteilung der Szene in flache, diffuse Polygone (Patches)
    - Paarweise Betrachtung der Patches um Lichtinteraktion festzustellen
    - Für jeden Patch wird die Farbe festgestellt, indem die Lichtenergie aller Form-Faktoren zusammengeführt wird
    - Nach Farbfeststellung Rendering über Flat- oder Gouraud-Shading
]

#slide[
  = Radiosity Rendering
  #set align(horizon)

  - Radiosities sind konstant pro Patch
  - Reines Rendering der Patches gibt "Tiled Look"
  - Stattdessen Interpolation der Radiosities mittels Gouraud-Shading

  #figure(
    image("../../Images/radiosity_shading.png", width: 100%)
  )
]

#slide[
  = Radiosity
  #set align(horizon)

  - Radiosity: gesamte Energie, welche von eine Oberfläche ausgeht
    - Emission
    - Reflexion
  - Modellierung der Szene als Menge an Patches mit konstanter Radiosity
  - Aufstellung & Lösen eines linearen Gleichungssystems

  $ 
    "radiosity" times "area" &eq "emitted energy" plus "reflected energy" \
    B_(i) d A_(i) &eq E_(i) d A_(i) plus rho_(i) integral_(j) B_(j)F_(j i) d A_(j)  
  $

  #set align(center)
  mit $B_(i)$ Radiosity pro Path $i$, $d A_(i)$ Differentialfläche für Fläche $i$, $E_(i)$ Emissionsrate pro Path $i$, $rho_(i)$ Reflektivität pro Patch $i$, $F_(i j)$ Formfaktor
]

#slide[
  = Radiosity
  == Formfaktoren
  #set align(horizon)

  - Formfaktoren sind abhängig von geometrischen Zusammenhängen
    - Distanz zwischen zwei Oberflächen
    - Relative Größe
    - Relative Orientierung
    - Okklusion durch dazwischenliegende Flächen
  - Formfaktoren sind unabhängig von:
    - Oberflächenattributen
    - Viewpoint
  
  $ 
    F_(i j) eq frac(
      "Strahlungsenergie, die die Oberfläche " A_(j) \ " verlässt und direkt auf " A_(i) " trifft", 
      "Strahlungsenergie, die die oberfläche " A_(j) \ " in alle Richtungen im halbkugelförmigen Raum um " A_(j) " herum verlässt" 
    ) 
  $
]

#slide[
  = Radiosity
  #set align(horizon)

  #grid(
    columns: (1fr, 1fr),
    [
      - Iterativer Ansatz zum Zusammenführen (Gathering) an einem Patch
      - Gauss-Seidel Iteration
        - Bei jedem Update der Radiosity eines Patches wird Radiosity anderer Patches mit einbezogen $arrow$ Gathering
    ], [
      $ B_(i) eq E_(i) plus rho_(i) sum_(j) B_(j) F_(i j) $

      #figure(
        image("../../Images/radiosity_patch.png")
      )
    ]
  )
]

#subchapter-title-slide(section-name: [Beispiel])

#slide[
  = Radiosity
  == Beispiel
  #set align(horizon)

  Eine simple Szene (links) mit Sonnen-Beleuchtung durch 3 Fenster. 
  Eine Säule (rechts) unterteilt in Patches.

  #figure(
    image("../../Images/radiosity_func_example_1.png")
  )
]

#slide[
  = Radiosity
  == Beispiel
  #set align(horizon)

  Ein Patch (links) und Fisheye Sicht von dem Patch aus (rechts). 
  Dieser Patch kann nur den Raum und die Dunkelheit draußen sehen (aber nicht die Sonne). 
  Hier kommt kein Licht an. 
  Dieser Patch ist dunkel beleuchtet.

  #figure(
    image("../../Images/radiosity_func_example_2.png")
  )
]

#slide[
  = Radiosity
  == Beispiel
  #set align(horizon)

  #grid(
    columns: (1fr, 1fr),
    [
      - Fisheye-Sicht von einem Patch weiter unten
      - Patch kann die helle Sonne außerhalb des Fensters sehen
      - Addition des einfallenden Lichts zeigt, dass hier sehr viel Licht ankommt (obwohl Sonne sehr klein erscheint)
      - Path ist hell beleuchtet
    ], [
      #set align(center)
      #image("../../Images/radiosity_func_example_3.png", width: 80%)
    ]
  )  
]

#slide[
  = Radiosity
  == Beispiel
  #set align(horizon)

  - Sicht auf die Säule, nachdem alle Patches beleuchtet wurden und der obere Teil im Schatten liegt (links), Beleuchtung des gesamten Raums (Mitte), Sicht vom oberen Patch (rechts) nach dem ersten Pass
  - Patch kann nun Licht auf anderen Oberflächen sehen
  - Patch wird im nächsten Pass leicht beleuchtet und ist nicht komplett dunkel

  #figure(
    image("../../Images/radiosity_func_example_4.png")
  )
]

#slide[
  = Radiosity
  == Beispiel
  #set align(horizon)

  Raumbeleuchtung nach dem 2. Pass (links), wobei die Sonne einmal reflektiert wurde vom Boden und den Wänden auf andere Oberflächen. 
  Raum nach dem 3. Pass (Mitte) und nach dem 4. Pass (rechts)

  #figure(
    image("../../Images/radiosity_func_example_5.png", width: 100%)
  )
]

#chapter-title-slide(section-name: [Formfaktoren])

#slide[
  = Formfaktoren
  #set align(horizon)

  - Nach wie vor großes Problem: Berechnung der Formfaktoren
  - Analytische Lösung besteht aus zwei Integralen und ist schwer zu lösen
  - Mögliche Lösung: *Hemicube*
  - Nutzt die Tatsache, dass die Pojektion der Oberfläche auf das begrenzende Volumen den gleichen Formfaktor wie die ursprüngliche Oberfläche hat
  - Zentrum von Patch $i$ mit einem gepixelten Halbwürfel umgeben
]

#slide[
  = Radiosity
  #set align(horizon)

  - Grobe Stichprobenmathode
    - Besser wäre eine feinere Unterteilung der Hemisphäre um das Patch-Zentrum
  - Rechenintensiver
  - Führt zu Aliasing - abhängig von der Größe der "Pixel"
    - Weniger Pixel $arrow$ Aliasing
    - Mehr Pixel $arrow$ teurer
  - Okklusion nahe an der Oberfläche
  - Ergibt Formfaktoren (und damit Radiositäten) in den Patch-Zentren
    - Nicht ideal für glatte Schattierungen (besser wären Radiositäten an Scheitelpunkten)
]

#slide[
  = Probleme
  #set align(horizon)

  Artefakt-Bildung wegen:
  - Approximationen in Hemicube-Ansatz
  - Lineare Interpolation zur Rekonstruktion von Radiosity-Funktionen entlang eines Patches
  - Nutzung von Mesh-Strukturen, welche keine Rücksicht auf Variation von Radiosity-Funktion legen
    - Zu grob: Block-Effekte, möglicherweise fehlende Schatten
    - Zu fein: erhöht Zeit- und Speicherbedarf
]

#slide[
  = Eigenschaften
  #set align(horizon)

  - Da es keine spiegelden oder transparenten Lichteffekte gibt, ist die Beleuchtung *nicht betrachterabhängig*
  - Man kann durch strahlend-gerenderte Szene gehen
  - Flächenlichter sind einfach
  - Wird am häufigsten verwendet für
    - Architektur-Renderings
    - Walkthroughs
  - Auch: Teil von hybriden Echtzeit-Rendering-Engines (Unity, Unreal, ...)
]

#slide[
  = Radiosity + Raytracing
  #set align(horizon)

  #grid(
    columns: (1fr, 1fr, 1fr),
    align: center,
    [
      Raytracing \ (indirekt spekular, links)
    ], [
      Radiosity \ (indirekt diffus, mitte)
    ], [
      Kombination \ (rechts)
    ]
  )

  #figure(
    image("../../Images/radiosity_combination.png", width: 100%)
  )
]

#slide[
  = Beispiele
  #set align(horizon)

  - *Enlighten*: "Echtzeit"-Middleware für globale Beleuchtung (z.B.: integriert in Unreal Engine, Unity, ...)
  - Kompromisse für "Echtzeit"-Radiosity
    - Mehrere Vorberechnungen; vereinfachte Geometrie;
    - Nur statische Geometrie lässt Licht abprallen
    - Indirekte Beleuchtung wird asynchron aktualisiert, d.h.: nicht in jedem Frame
    - Kombiniert mit direkter Beleuchtung in Echtzeit zur Laufzeit
  
  #grid(
    columns: (1fr, 1fr),
    inset: 10pt,
    [
      #figure(
        image("../../Images/enlighten_off.png", width: 80%)
      )
    ], [
      #figure(
        image("../../Images/enlighten_on.png", width: 80%)
      )
    ]
  )
]

#slide[
  = Light Probes
  #set align(horizon)

  *Light Probes*: Erfassung indirekter Beleuchtung (erzeugt mit Radiosity-Methode) an vordefinierter Position
    - Technisch gesehen ist jede Probe ein sphärisches, panoramisches HDR-Bild der Ansicht vom Probenpunkt
    - Sollte in Bereichen, in denen sich das Licht stark ändert, dichter platziert werden
    - Zur Laufzeit tragen Light Probes zur Beleuchtung von dynamischen Objekte bei
    - d.h.: dynamische Objekte empfangen indirektes Licht, lassen es aber nicht abprallen
]

#slide[
  = Light Probes
  #set align(horizon)

  - Statische Objekte erhalten und senden Licht
    - Nutzung dynamischer Lightmaps
  - Dynamische Objekte erhalten nur Licht
    - Sampling der Beleuchtung über Light Probes
  
  #figure(
    image("../../Images/light_probes.png", width: 70%)
  )
]
