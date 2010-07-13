use strict;
use warnings;
use Net::Neo4j;
use Test::More;
use Try::Tiny;
use YAML;

my $url = "http://localhost:9999";

my $graph = Net::Neo4j->new(api_base_url => $url);

ok my $root = $graph->root;
is $root->{index}, 'http://localhost:9999/index';

my @nodes = (qw/franckcuny cmaussan ngrunwald niko foo/);

foreach my $n (@nodes) {
    ok my $res = $graph->add_node(name => $n);
}

ok my $res = $graph->node(id => 1);

$graph->set_node_properties(id => 1, profession => 'hacker', name => $nodes[0]);

ok $res = $graph->node_properties(id => 1);
is_deeply $res, {name => $nodes[0], profession => 'hacker'};

$graph->delete_node_properties(id => 1);
$res = $graph->node_properties(id => 1);
is $res, undef;

#$graph->set_node_property(id => 1, property => {name => $nodes[0]});

#$graph->delete_node(id => 5);

try {
    ok $graph->add_edge(id => 1, to => $url.'/node/2', data => {date => time()}, type => 'COWORKER');
}catch{
    warn Dump $_->http_error;
};

done_testing;
