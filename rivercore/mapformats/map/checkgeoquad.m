function checkgeoquad(latlim, lonlim, func_name, ...
    latlim_var_name, lonlim_var_name, latlim_pos, lonlim_pos)
%CHECKGEOQUAD Validate limits of geographic quadrangle
%
%     This function is intentionally undocumented and is intended for
%     use only by other Mapping Toolbox functions.  Its behavior may
%     change, or the function itself may be removed, in a future
%     release.
%
%   CHECKGEOQUAD(LATLIM, LONLIM, FUNC_NAME, LATLIM_VAR_NAME,
%   LONLIM_VAR_NAME, LATLIM_POS, LONLIM_POS) ensures that LATLIM and
%   LONLIM are real, finite, double-valued two-element vectors, with
%   LATLIM having the form [southern_limit northern_limit] such that
%
%        -90 <= southern_limit <= northern_limit <= 90
%
%   and LONLIM having the form [western_limit eastern_limit].  To allow
%   for various longitude wrapping conventions, there are no constraints
%   on the values and ordering of western_limit and eastern_limit, other
%   than that they be real and finite.

% Copyright 2007-2009 The MathWorks, Inc.

% Validate LATLIM
validateattributes(latlim, {'double'}, {'real','vector','finite'}, ...
    func_name, latlim_var_name, latlim_pos)

assert(numel(latlim) == 2, ...
    ['map:' func_name ':latlimNot2Vector'], ...
    ['Function %s expected its %s input, %s,\n', ...
    'to be a two-element vector.'], ...
    func_name, num2ordinal(latlim_pos), latlim_var_name)

assert(latlim(1) <= latlim(2), ...
    ['map:' func_name ':latlimNotAscending'], ...
    ['Function %s expected the elements of %s to be\n', ...
    'in ascending order.'], ...
    func_name, latlim_var_name)

assert(-90 <= latlim(1) && latlim(2) <= 90, ...
    ['map:' func_name ':latlimOutsideLimits'], ...
    ['Function %s expected the elements of %s to be\n', ...
    'in the range [-90 90] degrees.'], ...
    func_name, latlim_var_name)

% Validate LONLIM
validateattributes(lonlim, {'double'}, {'real','vector','finite'}, ...
    func_name, lonlim_var_name, lonlim_pos);

assert(numel(lonlim) == 2, ...
    ['map:' func_name ':lonlimNot2Vector'], ...
    ['Function %s expected its %s input, %s,\n', ...
    'to be a two-element vector.'], ...
    func_name, num2ordinal(lonlim_pos), lonlim_var_name)
