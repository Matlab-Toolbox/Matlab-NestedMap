%% TestNestedMap.m
%
% Description : Quick and dirty script for testing 'MapNested'-class.
% Simple syntax test/presentation of the class
%
%
% Author :
%    Roland Ritt
%
% History :
% \change{1.0}{10 April 2017}{Original}
%
% --------------------------------------------------
% (c) 2017, Roland Ritt

clear
close all hidden
clc;



testMap = MapNested(); % create new MapNested- object
% assign values to keys
testMap('A') = 5;

testMap('C', 'd', 1, 'u') = 'hallo';
testMap({'C', 'd', 1, 'v'}) = 'servus';

% retrieve values

if (testMap('A')~=5)
    error('Test ''A'' went wrong');
end


if (testMap('C', 'd', 1, 'u')~= 'hallo')
    error('Test ''C d 1 i'' went wrong');
end


if (testMap({'C', 'd', 1, 'v'}) ~= 'servus')
    error('Test ''C d 1 v'' went wrong');
end



testMap = setValueNested(testMap, {'ad', 'c'}, 7);
testMap = setValueNested(testMap, {'ad', 'e'}, 8);


if (getValueNested(testMap, {'ad', 'c'}) ~= 7)
    error('Test ''ad c'' went wrong');
end
if (getValueNested(testMap, {'ad', 'e'})~= 8)
    error('Test ''ad e'' went wrong');
end

% override value ('A' = 5, with a map)
testMap = setValueNested(testMap, {'A', 'x'}, 10);



if getValueNested(testMap, {'A', 'x'}) ~= 10
    error('Test ''A x'' went wrong');
end

try
    val5 = getValueNested(testMap, {'B', 'x'});
    
catch ME
    if ME.message ~= 'key ''B'' is not a key'
        error('Test wrong key went wrong');
    end
    
    
end

if ~isequal(keys(testMap),{'A', 'C', 'ad'})
    error('Test ''keys'' function went wrong');
end


if ~isequal(keys(testMap('C')) ,{'d'})
    error('Test ''keys'' function went wrong');
end

try
    values(testMap('C'));
catch
    error('Test ''values'' function went wrong');
end



M = MapNested();


M(1, 'a')     = 'a string value';
M(1, 'b')     = 287.2;
M(2)          = [1 2 3; 4 5 6];
M(2, 'x', pi) = {'a' 'cell' 'array'};