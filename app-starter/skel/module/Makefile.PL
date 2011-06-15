use inc::Module::Install;
name '[* module *]';
all_from 'lib/[* module *].pm';

build_requires 'Test::More';
use_test_base;
auto_include;
WriteAll;
