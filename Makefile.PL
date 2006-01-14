use inc::Module::Install;

name            ('Data-RoundRobin');
abstract        ('');
author          ('Kang-min Liu <gugod@gugod.org>');
license         ('perl');
version_from    ('lib/Data/RoundRobin.pm');
build_requires  ('Test::More');

&WriteAll;

