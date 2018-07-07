#!/bin/bash
###################################################################################################
########### User names of collaborators, including internal Baylor student user names #############
###################################################################################################
echo -e "hello script world, my name is $(basename --  $0)"
function testfunc() 
{ 
    echo -e "hello script function world, my name is $(basename --  $0)"
}
testfunc