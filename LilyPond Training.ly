\paper {
  top-system-spacing.basic-distance = #10
  score-system-spacing.basic-distance = #20
  system-system-spacing.basic-distance = #20
  last-bottom-spacing.basic-distance = #10
}

global = {
  \key c \major
  \time 4/4
}

sopMusic = \relative {
  c'''2. c4 c g e' c b e, a e'16 c b a b4 e, a a8 c g4 c, f f8 c' e,1
}

altoMusic = \relative {
  r1 r2. e''4 d2 c g f e d c1
}

tenorMusic = \relative {
  e2 f g1 g2 a c1 c2 b g1
}

bassMusic = \relative {
  c1 c1 d2 e e f g g, c1
}

\score {
  \new ChoirStaff <<
    \new Lyrics = "sopranos" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "women" <<
      \new Voice = "sopranos" {
        \voiceOne
        << \global \sopMusic >>
      }
      \new Voice = "altos" {
        \voiceTwo
        << \global \altoMusic >>
      }
    >>
    \new Lyrics = "altos"
    \new Lyrics = "tenors" \with {
      % this is needed for lyrics above a staff
      \override VerticalAxisGroup.staff-affinity = #DOWN
    }
    \new Staff = "men" <<
      \clef bass
      \new Voice = "tenors" {
        \voiceOne
        << \global \tenorMusic >>
      }
      \new Voice = "basses" {
        \voiceTwo << \global \bassMusic >>
      }
    \chords { c2 f:/c c1 g2:/d a:m/e c:7/e f c/g g:7/b c1 }
    >>
  >>
}