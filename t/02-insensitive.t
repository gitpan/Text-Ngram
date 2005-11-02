use Test::More tests => 5;
use_ok("Text::Ngram");

my $text = "ABCdefg1235678hijklmnop";
my $hash = Text::Ngram::ngram_counts( { lowercase => 1 }, $text, 3);
is_deeply($hash, {
          'abc' => 1,
          'bcd' => 1,
          'cde' => 1,
          'def' => 1,
          'efg' => 1,
          'fg ' => 1,
          ' hi' => 1,
          'hij' => 1,
          'ijk' => 1,
          'jkl' => 1,
          'klm' => 1,
          'lmn' => 1,
          'mno' => 1,
          'nop' => 1,
         }, "Simple test finds all ngrams");

$text = "ABCdefg1235678hijklmnop";
$hash = Text::Ngram::ngram_counts( { lowercase => 0 }, $text, 3);
is_deeply($hash, {
          #'ABC' => 1,
          #'BCd' => 1,
          ' de' => 1,
          'def' => 1,
          'efg' => 1,
          'fg ' => 1,
          ' hi' => 1,
          'hij' => 1,
          'ijk' => 1,
          'jkl' => 1,
          'klm' => 1,
          'lmn' => 1,
          'mno' => 1,
          'nop' => 1,
         }, "Simple test with lowercase flag unset ignores uppercase letters");

$text = "ABCdefg1235678hijklmnop";
$hash = Text::Ngram::ngram_counts( { lowercase => 1 }, $text, 3);
is_deeply($hash, {
          'abc' => 1,
          'bcd' => 1,
          'cde' => 1,
          'def' => 1,
          'efg' => 1,
          'fg ' => 1,
          ' hi' => 1,
          'hij' => 1,
          'ijk' => 1,
          'jkl' => 1,
          'klm' => 1,
          'lmn' => 1,
          'mno' => 1,
          'nop' => 1,
         }, "Simple test lowercases letters");


$text = "Hello, world";
$hash = Text::Ngram::ngram_counts($text, 5);


is_deeply($hash, {
    'hello' => 1,
    'ello ' => 1,
    ' worl' => 1,
    'world' => 1,
  }, "zz");

