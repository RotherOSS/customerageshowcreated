# --
# OTOBO is a web-based ticketing system for service organisations.
# --
# Copyright (C) 2001-2020 OTRS AG, https://otrs.com/
# Copyright (C) 2019-2026 Rother OSS GmbH, https://otobo.io/
# --
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later version.
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <https://www.gnu.org/licenses/>.
# --

package Kernel::Language::hu_CustomerAgeShowCreated;

use strict;
use warnings;
use utf8;

sub Data {
    my $Self = shift;

    # SysConfig
    $Self->{Translation}->{'30 days'} = '30 nap';
    $Self->{Translation}->{'7 days'} = '7 nap';
    $Self->{Translation}->{'Return formatted creation date instead of age if configured threshold age is surpassed.'} =
        'Formázott létrehozási dátum visszaadása az életkor helyett, ha a beállított küszöbéletkor túllépésre kerül.';
    $Self->{Translation}->{'Shows creation date instead of age if ticket is older than configured value (days).'} =
        'A létrehozás dátumát jeleníti meg az életkor helyett, ha a jegy régebbi a beállított értéknél (napok).';


    push @{ $Self->{JavaScriptStrings} // [] }, (
    );

}

1;
