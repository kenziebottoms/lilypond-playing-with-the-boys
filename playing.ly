\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

#(set-default-paper-size "b4")

\header{
  title = "Playing With The Boys"
}

\score {
  \layout {
    \context {
      \RemoveEmptyStaffContext
      \override VerticalAxisGroup.remove-first = ##t
    }
  }

  \midi {
    \tempo 4 = 142
  }

  \new StaffGroup <<
    \new Staff \with {
      instrumentName = "Reed Organ"
      shortInstrumentName = "Reed"
      midiInstrument = #"reed organ"
    } \relative c''' {
      r8 d-. cis-. e-. a,4-. g-.
    }
  >>
}