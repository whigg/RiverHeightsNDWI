function h = BoundingBox(b)
%BOUNDINGBOX Bounding Box coordinates
%
%   BOUNDINGBOX(B) Creates a bounding box object from B. B may be in one of
%   two forms: 
%
%   1. A position vector [X,Y,WIDTH,HEIGHT] 
%
%   2. The lower-left and upper-right corners [lower-left-x,y; upper-right-x,y],
%   
%      or equivalently,  [left      bottom;
%                         right        top]

% Copyright 1996-2008 The MathWorks, Inc.

h = MapModel.BoundingBox;

if all(size(b) == [1 4]) % Position Vector
  h.PositionVector = b;
  corners = [b(1)        b(2);
             b(1) + b(3) b(2) + b(4)];
  h.Corners = [min(corners(:,1)), min(corners(:,2));
               max(corners(:,1)), max(corners(:,2))];
elseif all(size(b) == [2 2]) % Box corners
  h.Corners = b;
  corner = b(1,:);
  h.PositionVector = [corner diff(b)];
else
    error('map:MapGraphics:invalidBox', ...
        ['%s must be a position vector %s,', ...
        ' or the lower-left and upper-right corners %s\n'], ...
        'B', '[X,Y,WIDTH,HEIGHT]', '[lower-left-x,y; upper-right-x,y]')
end
