\header {
  tagline = ""
  composer = "Sean Connolly (?-)"
}
\include "english.ly"
\include "lilypond-book-preamble.ly"
\include "header.ly"

global = {
  \key c \major
  \time 4/4
}

sopMusic = \relative c' {
  \clef "treble_8"
  f2 f4 f | e2. d4 | c2.( b4) | c2. c4 | c2 c |
  c4 c c2 \bar "||" e2. e4 | c2 c | f1 | e2. e4 | d e d4. d8 |
  e2 e \bar "||" r4 e e f | e2. e4 | d c b2 | a1 \bar "||"
  \mark \markup { \musicglyph #"scripts.segno" }
  f'2 f4 f | e4. e8 e4 e ~ | e d e2 | r1 | r |
  r \bar "||" r4 e e2 | c4 c f2 ~ | f4 f2( e8 d8) | e1 \bar "||"
    \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
    \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \override Score . RehearsalMark #'font-shape = #'italic
    \override Score.RehearsalMark #'font-size = #0.5
    \mark "Fine"
}
sopWords = \lyricmode {
  \set fontSize = #0.5
  %\set vocalName = "2. "
  %\set shortVocalName = "2. "
  O -- mnes a -- mi -- ci | me -- i de -- re -- lin -- que -- runt me. | Et præ | va -- lu -- e -- runt in -- si -- pi -- en -- tes | mi -- hi; tra -- di -- dit | me quem | di -- li -- ge -- bam. | Et ter -- ri -- bi -- li -- bus o -- cu -- lis a -- ce -- to po -- ta -- bant | me.
}

altoMusic = \relative c' {
  \clef "treble_8"
  a2 a4 a | gs2 a2( ~ | a4 g) f2( ~ | f4 e8 d) e4 f | g a f f |
  g2 ~ g2 \bar "||" g g | a c( ~ | c4 b8 a) b2 | c2. c4 | c c c b |
  c2 c \bar "||" c c4 a | gs2. a4 | b a a( gs) | a1 \bar "||"
  a2 a4 a | gs4. gs8 gs2 | a4. a8 b4 c | c d e2 | d4 c b c ~ |
  c b c2 \bar "||" r4 g g2 | a4 c c( b8 a | b2) g | g1 \bar "||"
}

altoWords = \lyricmode {
  \set fontSize = #0.5
  O -- mnes a -- mi -- ci __ me -- i de -- re -- lin -- que -- runt me. __ | Et præ | va -- lu -- e -- runt in -- si -- pi -- en -- tes | mi -- hi; tra -- di -- dit | me quem | di -- li -- ge -- bam. | Et ter -- ri -- bi -- li -- bus o -- cu -- lis pla -- ga cru -- de -- li per -- cu -- ti -- en -- tes
  a -- ce -- to po -- ta -- bant | me.
}

bassMusic = \relative c {
  \clef bass
  d2 d4 d | e2 f2( ~ f4 e) d2 | c2. d4 | e f d4. d8 |
  c2 ~ c \bar "||" c2. c4 | f2 e | d1 | e4 f g2 | f4( e) f g |
  c,2 c \bar "||" r4 a'4 a d, | e2. c4 | d e d( e) | a1 \bar "||"
  d,2 d4 d | e4. e8 e2 | f4. f8 e4 a | a b c2 | b4 a g c, |
  f( g) c,2 \bar "||" r4 c c2 | f4 e d2 ~ | d c | c1 \bar "||"
}

bassWords = \lyricmode {
  \set fontSize = #0.5
  O -- mnes a -- mi -- ci __ me -- i de -- re -- lin -- que -- runt me. __ | Et præ | va -- lu -- e -- runt in -- si -- pi -- en -- tes | mi -- hi; tra -- di -- dit | me quem | di -- li -- ge -- bam. | Et ter -- ri -- bi -- li -- bus o -- cu -- lis pla -- ga cru -- de -- li per -- cu -- ti -- en -- tes
  a -- ce -- to po -- ta -- bant | me.
}

chantMusic = \relative c {
  \clef "treble_8"
  \cadenzaOn
  e4( g) a a a( g) a a g( a) b a a4. r8 \bar "|" a4 a c e d ~ d a c b a b a( g a4.)
  \cadenzaOff \bar "||"
  \override Score.RehearsalMark #'break-visibility = #begin-of-line-invisible
    \override Score.RehearsalMark #'self-alignment-X = #RIGHT
    \override Score . RehearsalMark #'font-shape = #'italic
    \override Score.RehearsalMark #'font-size = #0.5
    \mark "D.S. al Fine"
}


chantWords = \lyricmode {
  In -- ter in -- i -- quos pro -- je -- ce -- runt me. Et non per -- pe -- ce -- runt a -- ni -- mæ me -- æ.
}

%altoWords = \lyricmode {
%  \override StanzaNumber #'font-name = #"Garamond Premier Pro"
%  \override LyricText #'font-name = #"Garamond Premier Pro"
%}

\score {
  \new ChoirStaff <<
%    \new Lyrics = "sopranos"
    \new Staff = "women" <<
      \new Voice = "sopranos"{
%        \voiceOne
        << \global \sopMusic >>
      }
%      \new Voice = "altos" {
%        \voiceTwo
%        << \global \altoMusic >>
%      }
    >>
    \new Lyrics = "sopranos"

    \new Staff = "women2" <<
      \new Voice = "altos" {
%        \voiceTwo
        << \global \altoMusic >>
      }
    >>
    \new Lyrics = "altos"
    
    \new Staff = "men" <<
      %\new Lyrics = "bass"
      \new Voice = "bass" {
%        \voiceOne
        << \global \bassMusic >>
      }
    >>
    \context Lyrics = "sopranos" \lyricsto "sopranos" \sopWords
    \context Lyrics = "altos" \lyricsto "altos" \altoWords
    \context Lyrics = "bass" \lyricsto "bass" \bassWords
  >>
  \layout {
    \context {
      \Staff
    }
  }
}

\score {
  \new ChoirStaff <<
    \new Staff = "chant" <<
      \new Voice = "chant" \with {
      \remove "Stem_engraver"
    } {
        << \global \chantMusic >>
      }
    >>
    \new Lyrics = "chant"
    \context Lyrics = "chant" \lyricsto "chant" \chantWords
  >>
  \layout {
    \context {
      \Staff
    }
  }
}

