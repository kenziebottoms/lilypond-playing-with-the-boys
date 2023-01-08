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

      r8 d\p cis e a,4-. g-.
      r8 a-. g-. d' cis( g) a4-.
      g8( a) d,-. c-. d( e)
    }

    \new Staff \with {
      instrumentName = "Electric Guitar"
      shortInstrumentName = "Guitar"
      midiInstrument = #"overdriven guitar"
    } \relative c'' {
      r1 * 4
      \repeat unfold 2 {
        g8( a4-.) d-. cis4-. a8
        g( a) d4-. cis8( a) g4
      }
    }

    \new DrumStaff \with {
      instrumentName = "Toms"
      midiInstrument = #"melodic tom"
    } \drummode {
      toml4\fff r8 tomh4 r8 toml8 tomfl
      tomfl4 tomh r8 toml4 r8
      tomfl4 r8 tomh4 r8 toml8 tomfl
      tomfl tomh r4 tomh8-^\fff tomh-^ tomh-^ tomh-^

      \repeat unfold 2 {
        bd4-> tomh-> r tomh-> bd-> tomh-> r tomh->
      }
    }

    \new DrumStaff \with {
      instrumentName = "Claps"
    } \drummode {
      r1
      r2 hc8-^\fffff hc\f hc\mp hc\p
      r1
      r2 hc8-^\fff hc8-^ hc8-^ hc8-^
    }

    \new DrumStaff \drummode {
      cymr8->\pppp cymr cymr cymr cymr-> cymr cymr cymr
      \repeat unfold 7 {
        cymr-> cymr cymr cymr cymr-> cymr cymr cymr
      }
    }
  >>
}