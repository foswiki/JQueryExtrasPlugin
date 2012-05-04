# See bottom of file for default license and copyright information

=begin TML

---+ package JQueryExtrasPlugin

=cut

package Foswiki::Plugins::JQueryExtrasPlugin;

# Always use strict to enforce variable scoping
use strict;
use warnings;

use Foswiki::Func    ();    # The plugins API
use Foswiki::Plugins ();    # For the API version

our $VERSION = '$Rev$';

our $RELEASE = '03 Mar 2010';

# Short description of this plugin
# One line description, is shown in the %SYSTEMWEB%.TextFormattingRules topic:
our $SHORTDESCRIPTION =
'Miscellaneous jQuery plugins that could not be shipped with the base JQueryPlugin package';

our $NO_PREFS_IN_TOPIC = 1;

=begin TML

---++ initPlugin($topic, $web, $user) -> $boolean
   * =$topic= - the name of the topic in the current CGI query
   * =$web= - the name of the web in the current CGI query
   * =$user= - the login name of the user
   * =$installWeb= - the name of the web the plugin topic is in
     (usually the same as =$Foswiki::cfg{SystemWebName}=)

=cut

sub initPlugin {
    my ( $topic, $web, $user, $installWeb ) = @_;

    # check for Plugins.pm versions
    if ( $Foswiki::Plugins::VERSION < 2.0 ) {
        Foswiki::Func::writeWarning( 'Version mismatch between ',
            __PACKAGE__, ' and Plugins.pm' );
        return 0;
    }
    if ( $Foswiki::cfg{Plugins}{JQueryPlugin}{Enabled} ) {
        require Foswiki::Plugins::JQueryPlugin;
        Foswiki::Plugins::JQueryPlugin::registerPlugin( "QTip",
            'Foswiki::Plugins::JQueryExtrasPlugin::QTIP' );
        Foswiki::Plugins::JQueryPlugin::registerPlugin( "MapHilight",
            'Foswiki::Plugins::JQueryExtrasPlugin::MAPHILIGHT' );
    }

    # Plugin correctly initialized
    return 1;
}

1;
__END__
This copyright information applies to the JQueryExtrasPlugin:

# Plugin for Foswiki - The Free and Open Source Wiki, http://foswiki.org/
#
# JQueryExtrasPlugin is Copyright (C) 2010 Foswiki Contributors
# 
# The Javascript files packaged with this plugin are Copyright (C) and licensed
# separately by their respective authors, please review those files separately
# for more detailed information.
#
# Foswiki Contributors are listed in the AUTHORS file in the root
# of this distribution. NOTE: Please extend that file, not this notice.
#
# Additional copyrights apply to some or all of the code as follows:
# Copyright (C) 2000-2003 Andrea Sterbini, a.sterbini@flashnet.it
# Copyright (C) 2001-2006 Peter Thoeny, peter@thoeny.org
# and TWiki Contributors. All Rights Reserved.
# Foswiki Contributors are listed in the AUTHORS file in the root of this
# distribution.
#
# This license applies to JQueryExtrasPlugin and to any derivatives.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version. For
# more details read LICENSE in the root of this distribution.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
# For licensing info read LICENSE file in the root of this distribution.
