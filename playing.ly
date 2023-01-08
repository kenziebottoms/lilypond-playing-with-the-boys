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
    \tempo 4 = 140
  }

  \new StaffGroup <<
    \new Staff \with {
      instrumentName = "Pan Flute"
      shortInstrumentName = "Flute"
      midiInstrument = #"pan flute"
    } \relative c''' {
      r1

      r8 d cis e a,4-. g-.
      r8 a-. g-. d' cis( g) a4-.
      g8( a) d,-. c-. d( e)
    }

    \new DrumStaff \with {
      instrumentName = "Toms"
      midiInstrument = #"melodic tom"
    } \drummode {
      toml4\fff r8 tomh4 r8 toml8 tomfl
      tomfl4 tomh r8 toml4 r8
      tomfl4 r8 tomh4 r8 toml8 tomfl
      tomfl toml
    }

    \new DrumStaff \with {
      instrumentName = "Electric Snare"
    } \drummode {
      r1 * 3
      r2 sne8-^ sne-^ sne-^ sne-^
    }

    \new DrumStaff \with {
      instrumentName = "Claps"
    } \drummode {
      r1
      r2 hc8-^\fffff hc\f hc\mp hc\p
    }

    \new DrumStaff \with {
      instrumentName = "Tambourine"
    } \drummode {
      hh8\ppppp hh hh hh hh hh hh hh hh
      \repeat unfold 3 {
        hh hh hh hh hh hh hh hh hh
      }
    }
  >>
}