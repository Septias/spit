#import "@preview/touying:0.7.4": *
#import "@preview/suiji:0.5.1": gen-rng-f, shuffle-f

#let blau = rgb("#0e4278")
#let gelb = rgb("#ffd208")
#let rot = rgb("#971b2f")

// Layouts nachgebaut aus "BdP PPT Vorlage Stamm 260424.pptx" (960pt × 540pt),
// alle Positionen in pt wie in der Vorlage.
#let at(x, y, body) = place(top + left, dx: x, dy: y, body)

// Layout "Titelfolie"
#let title-slide(
  config: (:),
  title: auto,
  subtitle: auto,
  picture: none,
) = touying-slide-wrapper(self => {
  let title = if title == auto { self.info.title } else { title }
  let subtitle = if subtitle == auto { self.info.subtitle } else { subtitle }
  self = utils.merge-dicts(self, config-page(
    background: {
      // Foto randlos hinter der Welle
      if picture != none {
        set image(width: 100%, height: 100%, fit: "cover")
        place(picture)
      }
      image("asset/vorlage/welle-blau.png", width: 100%, height: 100%)
      if picture != none {
        // weißer Grund, damit das Logo auf dem Foto lesbar bleibt
        at(717.7pt, 9pt, rect(
          width: 179.1pt,
          height: 67pt,
          radius: 8pt,
          fill: white,
        ))
      }
      at(727.7pt, 17pt, image("asset/vorlage/bdp-logo.png", width: 159.1pt))
    },
    foreground: {
      set text(fill: gelb, top-edge: "ascender")
      at(73.2pt, 364.6pt, block(width: 439.1pt, text(
        36pt,
        weight: "black",
        title,
      )))
      at(73.2pt, 461.9pt, block(width: 705.6pt, text(
        24pt,
        weight: "regular",
        subtitle,
      )))
    },
  ))
  touying-slide(self: self, config: config, [])
})

#let new-section-slide(
  config: (:),
  level: 1,
  numbered: true,
  body,
) = title-slide(
  config: config,
  title: utils.display-current-heading(level: level, numbered: numbered),
  subtitle: body,
)

// Hochformat-Fotos aus bilder/, zufällig gemischt (anderer Seed = andere Reihenfolge)
#let hochformat-bilder = shuffle-f(gen-rng-f(2027), (
  "bier.jpeg",
  "draußen.jpg",
  "knopp.jpg",
  "lemmy_leona.JPG",
  "niggi.jpg",
  "reiki.jpg",
  "reiki_lemmy.jpg",
  "reiki_zora.JPG",
  "schosch.jpg",
)).last()

// Foto rechts neben den Text, wenn die längste Zeile dafür Platz lässt
#let bild-breite = 240pt
#let mit-bild(body) = context {
  let frei = 813.6pt - bild-breite - 30pt
  // in Folienbreite gemessen: Listen ergeben ihre natürliche Breite,
  // volle Layouts (z. B. Spalten mit 1fr) die ganze Breite
  if measure(body, width: 813.6pt).width > frei {
    body
  } else {
    let nr = utils.slide-counter.get().first()
    let datei = hochformat-bilder.at(calc.rem(nr, hochformat-bilder.len()))
    grid(
      columns: (1fr, bild-breite),
      column-gutter: 30pt,
      body,
      box(radius: 8pt, clip: true, image(
        "bilder/" + datei,
        width: bild-breite,
        height: 320pt,
        fit: "cover",
      )),
    )
  }
}

// Layout "Liste"
#let slide(
  config: (:),
  repeat: auto,
  setting: body => body,
  composer: auto,
  ..bodies,
) = touying-slide-wrapper(self => {
  self = utils.merge-dicts(self, config-page(
    background: {
      image("asset/vorlage/welle-gelb.png", width: 100%, height: 100%)
      at(14.2pt, 70.5pt, image("asset/vorlage/kringel-rot.png", width: 283pt))
    },
    foreground: {
      set text(fill: blau, top-edge: "ascender")
      at(73.2pt, 24.4pt, block(width: 694.3pt, text(
        36pt,
        weight: "black",
        utils.display-current-heading(depth: self.slide-level),
      )))
      set text(18pt)
      at(73.2pt, 498pt, box(height: 28.8pt, align(horizon, self.info.title)))
      at(678pt, 498pt, box(width: 208.8pt, height: 28.8pt, align(
        right + horizon,
        context utils.slide-counter.display(),
      )))
    },
  ))
  touying-slide(
    self: self,
    config: config,
    repeat: repeat,
    setting: body => mit-bild(setting(body)),
    composer: composer,
    ..bodies,
  )
})

// Hochkant-Folie: eigene Seite im Hochformat (die Folie gedreht, 540pt × 960pt),
// der Inhalt wird so groß wie möglich skaliert (z. B. für den Zeitplan)
#let hochkant-slide(config: (:), title: none, body) = touying-slide-wrapper(
  self => {
    self = utils.merge-dicts(self, config-page(
      width: 540pt,
      height: 960pt,
      margin: (x: 10pt, top: 24pt, bottom: 10pt),
    ))
    touying-slide(self: self, config: config, place(block(
      width: 100%,
      height: 100%,
      grid(
        rows: (auto, 1fr),
        row-gutter: 12pt,
        stack(
          spacing: 4pt,
          text(36pt, weight: "black", title),
          image("asset/vorlage/kringel-rot.png", width: 200pt),
        ),
        layout(size => {
          let m = measure(body)
          let s = calc.min(size.width / m.width, size.height / m.height)
          align(center + top, scale(s * 100%, reflow: true, body))
        }),
      ),
    )))
  },
)

// runder Punkt wie das Arial-• der Vorlage (Marker sitzt an der Oberkante der Zeile)
#let bullet = move(dx: .03em, dy: .21em, circle(radius: .135em, fill: blau))

// Roadmap: zwei Spalten in kleinerer schwarzer Schrift, Listen als ToDos mit Kästchen,
// links die Treffen am Zeitstrahl-Pfeil, rechts die hellblauen ToDo-Kästen
#let kaestchen = box(width: .65em, height: .65em, stroke: .8pt + black)
#let treffen(titel) = block(below: .6em, text(
  1.15em,
  weight: "bold",
  fill: rot,
  titel,
))
#let meilenstein(titel) = block(text(1.6em, weight: "bold", fill: rot, titel))
#let todos(titel, body) = block(
  width: 100%,
  inset: 12pt,
  fill: blau.lighten(90%),
  {
    block(above: 0pt, below: .6em, text(1.15em, titel))
    body
  },
)
#let roadmap(links, rechts) = {
  set text(15pt, weight: "regular", fill: black)
  set par(leading: .35em)
  show strong: it => text(weight: "bold", it.body)
  set list(
    marker: box(width: 1.5em, move(dy: .05em, kaestchen)),
    body-indent: 0pt,
    spacing: .35em,
  )
  set block(above: 1.2em)
  // näher an den Titel, damit Treffen und ToDos nebeneinander auf die Folie passen
  v(-30pt)
  grid(
    columns: (1fr, 1fr),
    column-gutter: 28pt,
    block(inset: (left: 24pt), stroke: (left: 5pt + gelb), {
      links
      // Pfeilspitze unten am Zeitstrahl
      place(bottom + left, dx: -24pt - 9pt, dy: 14pt, polygon(
        fill: gelb,
        (0pt, 0pt),
        (18pt, 0pt),
        (9pt, 16pt),
      ))
    }),
    rechts,
  )
}
