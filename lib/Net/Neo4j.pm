package Net::Neo4j;

use MooseX::Net::API;

net_api_declare neo4j => (
    api_format      => 'json',
    api_format_mode => 'content-type',
);

net_api_method root => (
    method   => 'GET',
    path     => '/',
    expected => [qw/200/],
);

net_api_method add_node => (
    method   => 'POST',
    path     => '/node',
    strict   => 0,
    expected => [qw/201/],
);

net_api_method node => (
    method   => 'GET',
    path     => '/node/:id',
    params   => [qw/id/],
    required => [qw/id/],
    expected => [qw/200 404/],
);

net_api_method set_node_properties => (
    method   => 'PUT',
    path     => '/node/:id/properties',
    strict   => 0,
    params   => [qw/id/],
    required => [qw/id/],
    expected => [qw/204 400 404/],
);

net_api_method node_properties => (
    method   => 'GET',
    path     => '/node/:id/properties',
    params   => [qw/id/],
    required => [qw/id/],
    expected => [qw/200 204 404/],
);

net_api_method delete_node_properties => (
    method   => 'DELETE',
    path     => '/node/:id/properties',
    params   => [qw/id/],
    required => [qw/id/],
    expected => [qw/204 404/],
);

# XXX won't work with JSON...
net_api_method set_node_property => (
    method   => 'PUT',
    path     => '/node/:id/properties/:property',
    params   => [qw/id property/],
    required => [qw/id property/],
    expected => [qw/200 404/],
);

net_api_method node_property => (
    method   => 'GET',
    path     => '/node/:id/properties/:property',
    params   => [qw/id property/],
    required => [qw/id property/],
    expected => [qw/200 404/],
);

net_api_method delete_node_property => (
    method   => 'DELETE',
    path     => '/node/:id/properties/:property',
    params   => [qw/id property/],
    required => [qw/id property/],
    expected => [qw/204 404 /],
);

net_api_method delete_node => (
    method   => 'DELETE',
    path     => '/node/:id',
    params   => [qw/id/],
    required => [qw/id/],
    expected => [qw/204 404 409/],
);

net_api_method add_edge => (
    method   => 'POST',
    path     => '/node/:id/relationships',
    params   => [qw/id to data type/],
    required => [qw/id to data type/],
    expeced  => [qw/201 400 404/],
);

net_api_method set_edge_properties => (
    method   => 'PUT',
    path     => '/relationship/:id/properties',
    params   => [qw/id/],
    required => [qw/id/],
    strict   => 0,
    expected => [qw/204 400 404/],
);

net_api_method edge_properties => (
    method   => 'GET',
    path     => '/relationship/:id/properties',
    params   => [qw/id/],
    required => [qw/id/],
    expected => [qw/200 204 404/],
);

net_api_method delete_edge_properties => (
    method   => 'DELETE',
    path     => '/relationship/:id/properties',
    params   => [qw/id/],
    required => [qw/id/],
    expected => [qw/204 404/],
);

net_api_method set_edge_property => (
    method   => 'PUT',
    path     => '/relationship/:id/properties/:property',
    params   => [qw/id property/],
    required => [qw/id property/],
    expected => [qw/204 404 400/],
);

net_api_method edge_property => (
    method   => 'GET',
    path     => '/relationship/:id/properties/:property',
    params   => [qw/id property/],
    required => [qw/id property/],
    expected => [qw/200 404/],
);

net_api_method delete_edge_property => (
    method   => 'DELETE',
    path     => '/relationship/:id/properties/:property',
    params   => [qw/id property/],
    required => [qw/id property/],
    expected => [qw/204 404/],
);

net_api_method delete_edge => (
    method   => 'DELETE',
    path     => '/relationship/:id',
    params   => [qw/id /],
    required => [qw/id /],
    expected => [qw/204 404/],
);

net_api_method get_edges => (
    method   => 'GET',
    path     => '/node/123/relationships/:dir/:types',
    params   => [qw/id dir types/],
    required => [qw/id dir types/],
    expected => [qw/200 404/],
);

# XXX index methods

net_api_method traverse => (
    method   => 'POST',
    path     => '/node/:id/traverse/:returntype',
    params   => [qw/id returntype/],
    required => [qw/id returntype/],
    expected => [qw/200 404/],
    strict   => 0,
);

1;
