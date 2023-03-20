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
      \set Score.markFormatter = #format-mark-box-alphabet

      r1

      r8 d\p cis e a,4-. g-.
      r8 a-. g-. d' cis( g) a4-.
      g8( a) d,-. c-. d( e) r4

      % 5 // A
      \mark \default
      r4
    }

    \new Staff \with {
      instrumentName = "Electric Guitar"
      shortInstrumentName = "E.G."
      midiInstrument = #"overdriven guitar"
    } \relative c'' {
      r1 * 4

      % 5 // A
      \repeat unfold 2 {
        g8( a4-.) d-. cis4-. a8
        g( a) d4-. cis8( a) g4
      }
    }

    \new DrumStaff \with {
      instrumentName = "Toms"
      midiInstrument = #"melodic tom"
      shortInstrumentName = "Toms"
    } \drummode {
      toml4\fff r8 tomh4 r8 toml8 bd
      bd4 tomh r8 toml4 r8
      bd4 r8 tomh4 r8 toml8 bd
      bd tomh r2.

      % 5 // A
    }

    \new DrumStaff \with {
      instrumentName = "Snare"
      shortInstrumentName = "Sn."
    } \drummode {
      r1 * 3
      r2 sne8-^ sne-^ sne-^ sne-^

      % 5 // A
      \repeat unfold 3 {
        r4 sne-^ r4 sne-^
      }
    }

    \new DrumStaff \with {
      instrumentName = "Bass Drum"
      shortInstrumentName = "B.D."
      midiInstrument = #35
    } \drummode {
      bd4 r4 r4. bd8
      bd4 r2.
      bd4 r4 r4. bd8
      bd4 r2 r8 bd

      % 5 // A
      \repeat unfold 2 {
        bd4 r8 bd r2
        bd4 r bd r
      }
    }

    \new DrumStaff \with {
      instrumentName = "Hand Claps"
      shortInstrumentName = "H.C."
    } \drummode {
      r1
      r2 hc8-^\fffff hc\f hc\mp hc\p
      r1
      r2 hc8-^\fff hc8-^ hc8-^ hc8-^

      % 5 // A
    }

    \new DrumStaff \with {
      instrumentName = "Tambourine"
      shortInstrumentName = "Tamb."
    } \drummode {
      tamb8->\ppppp tamb tamb tamb tamb-> tamb tamb tamb
      \repeat unfold 7 {
        tamb-> tamb tamb tamb tamb-> tamb tamb tamb
      }
    }
  >>
}