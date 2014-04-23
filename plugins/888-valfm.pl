#
## val.fm support
#

{
 url_regex => qr{\bval\.fm\b},
 code      => sub {
     my ($content) = @_;

     if ($content =~ m{class="song-text(.*?)</div>}si) {
         my $lyrics = $1;
         $lyrics =~ s{<p\s+class=['"]verse['"]>}{\n\n}gi;
         $lyrics =~ s{<.*?>}{}sg;
         return $lyrics;
     }

     return;
   }
}
