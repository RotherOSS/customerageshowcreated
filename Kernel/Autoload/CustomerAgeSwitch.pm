# --
# OTOBO is a web-based ticketing system for service organisations.
# --
# Copyright (C) 2019-2025 Rother OSS GmbH, https://otobo.io/
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

use Kernel::Output::HTML::Layout;    ## no critic (Modules::RequireExplicitPackage)

package Kernel::Output::HTML::Layout;    ## no critic (Modules::RequireFilenameMatchesPackage)

use strict;
use warnings;

use Kernel::Language qw(Translatable);
use Kernel::System::VariableCheck qw(IsPositiveInteger);

our @ObjectDependencies = (
    'Kernel::Config',
);

# disable redefine warnings in this scope
{
    no warnings 'redefine';    ## no critic qw(TestingAndDebugging::ProhibitNoWarnings)

    sub CustomerAge {
        my ( $Self, %Param ) = @_;

        my $ConfigObject = $Kernel::OM->Get('Kernel::Config');

        my $Age       = defined( $Param{Age} ) ? $Param{Age} : return;
        my $Space     = $Param{Space} || '<br/>';
        my $AgeStrg   = '';
        my $DayDsc    = Translatable('d');
        my $HourDsc   = Translatable('h');
        my $MinuteDsc = Translatable('m');
        if ( $ConfigObject->Get('TimeShowCompleteDescription') ) {
            $DayDsc    = Translatable('day(s)');
            $HourDsc   = Translatable('hour(s)');
            $MinuteDsc = Translatable('minute(s)');
        }
        if ( $Age =~ /^-(.*)/ ) {
            $Age     = $1;
            $AgeStrg = '-';
        }
# Rother OSS / CustomerAgeShowCreated

        # expected to be an integer number
        my $TimeShowCreatedAt = $ConfigObject->Get('TimeShowCreatedAt');
        if ( IsPositiveInteger($TimeShowCreatedAt) ) {

            # check if age transformation should be applied
            if ( $Age >= ( $TimeShowCreatedAt * 86400 ) ) {
                my $CreatedAt;
                if ( $Param{CreatedAtEpoch} ) {
                    my $CreatedAtDateTimeObject = $Kernel::OM->Create(
                        'Kernel::System::DateTime',
                        ObjectParams => {
                            Epoch => $Param{CreatedAtEpoch},
                        },
                    );
                    $CreatedAt = $CreatedAtDateTimeObject->ToString();
                }
                $CreatedAt ||= $Param{CreatedAt};

                if ($CreatedAt) {
                    return $Self->{LanguageObject}->FormatTimeString(
                        $CreatedAt,
                        'DateFormat',
                        'NoSeconds',
                    );
                }
            }
        }
# EO CustomerAgeShowCreated

        # get days
        if ( $Age >= 86400 ) {
            $AgeStrg .= int( ( $Age / 3600 ) / 24 ) . ' ';
            $AgeStrg .= $Self->{LanguageObject}->Translate($DayDsc);
            $AgeStrg .= $Space;
        }

        # get hours
        if ( $Age >= 3600 ) {
            $AgeStrg .= int( ( $Age / 3600 ) % 24 ) . ' ';
            $AgeStrg .= $Self->{LanguageObject}->Translate($HourDsc);
            $AgeStrg .= $Space;
        }

        # get minutes (just if age < 1 day)
        if ( ( $Param{TimeShowAlwaysLong} || $ConfigObject->Get('TimeShowAlwaysLong') || $Age < 86400 ) && $Age != 0 ) {
            $AgeStrg .= int( ( $Age / 60 ) % 60 ) . ' ';
            $AgeStrg .= $Self->{LanguageObject}->Translate($MinuteDsc);
        }
        return $AgeStrg;
    }
}

1;
