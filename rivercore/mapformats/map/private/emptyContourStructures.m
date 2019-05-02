function [L, P] = emptyContourStructures()
% Construct empty contour line and fill polygon structures.

% Copyright 2010 The MathWorks, Inc.

L = struct(...
    'Geometry', [], ...
    'BoundingBox', [], ...
    'X', [], ...
    'Y', [], ...
    'Level', []);
L(:) = [];
L = reshape(L,[0 1]);

if nargout > 1
    P = struct(...
        'Geometry', [], ...
        'BoundingBox', [], ...
        'X', [], ...
        'Y', [], ...
        'MinLevel', [], ...
        'MaxLevel', []);
    P(:) = [];
    P = reshape(P,[0 1]);
end
