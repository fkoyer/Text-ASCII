# NAME

Text::ASCII::Convert - Perl module to convert non-ASCII characters to their ASCII equivalents

# SYNOPSIS

    use Text::ASCII::Convert;

    print convert_to_ascii("Ýou hãve a nèw vòice-mãil");

    # prints "You have a new voice-mail"

# DESCRIPTION

This module attempts to convert non-ASCII characters in a string to their closet ASCII homoglyph. The input
can be a string of Unicode characters or a string of UTF-8 octets. The output is always a string of ASCII characters
in the range 0x00 to 0x7F.

This is most useful for catching spam that uses non-ASCII characters to obfuscate words. For example,

    Ýou hãve a nèw vòice-mãil
    You havé Reꞓeìved an Enꞓryptéd Company Maíl

would be converted to

    You have a new voice-mail
    You have ReCeived an EnCrypted Company Mail

Unlike other transliteration software, this plugin converts non-ASCII characters
to their ASCII equivalents based on appearance instead of meaning. For example, the
German eszett character 'ß' is converted to the Roman letter 'B' instead of 'ss'
because it resembles a 'B' in appearance. Likewise, the Greek letter Sigma ('Σ') is
converted to 'E' and a lower case Omega ('ω') is converted to 'w' even though these
letters have different lexical meanings.

Not all non-ASCII characters are converted. For example, the Japanese Hiragana
character 'あ' is not converted because it does not resemble any ASCII character.
Characters that have no ASCII equivalent are replaced by spaces. To avoid long runs
of spaces, multiple spaces are collapsed into a single space. For example,

    Find 💋💘Singles💋💘 in your Area

would be converted to

    Find Singles in your Area

The plugin also removes zero-width characters such as the zero-width
space (U+200B) and zero-width non-joiner (U+200C) that are often used to
obfuscate words.

Control characters such as tabs, newlines, and carriage returns are retained.

# AUTHORS

Kent Oyer <kent@mxguardian.net>

# LICENSE AND COPYRIGHT

Copyright (C) 2023 MXGuardian LLC

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the LICENSE
file included with this distribution for more information.

You should have received a copy of the GNU General Public License
along with this program.  If not, see &lt;http://www.gnu.org/licenses/>.
