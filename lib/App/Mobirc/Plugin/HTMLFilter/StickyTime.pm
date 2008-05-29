package App::Mobirc::Plugin::HTMLFilter::StickyTime;
use strict;
use warnings;
use App::Mobirc::Util;
use HTML::StickyQuery;

sub register {
    my ($class, $global_context) = @_;

    $global_context->register_hook(
        'html_filter' => \&_html_filter
    );
}

sub _html_filter {
    my ($c, $content) = @_;

    my $sticky = HTML::StickyQuery->new();
    return $sticky->sticky(
        scalarref => \$content,
        param     => { t => time() },
    );
}



1;
__END__

=encoding utf8

=head1 NAME

App::Mobirc::Plugin::HTMLFilter::StickyTime - f*cking au cache

=head1 DESCRIPTION

au phone cache very strongly like IE's Ajax.

this filer appends ?t=time() to `a' tag.

=head1 AUTHOR

tokuhirom

=head1 SEE ALSO

L<App::Mobirc>
