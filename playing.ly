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
      r1

      r8 d-. cis-. e-. a,4-. g-.
      r8 a-. g d'-. cis-.( g) a4-.
    }

    \new DrumStaff \with {
      instrumentName = "Bass Drum"
      shortInstrumentName = "B.D."
      midiInstrument = #"melodic tom"
    } \drummode {
      toml4 r8 tomh4 r8 toml8 tomfl
      tomfl4 tomh r8 toml4 r8
      tomfl4 r8 tomh4 r8 toml8 tomfl
      tomfl toml r4 toml8-> toml-> toml-> toml->
    }

    \new DrumStaff \with {
      instrumentName = "Tambourine"
    } \drummode {
      cymr8 8 8 8 8 8 8 8
    }
  >>
}