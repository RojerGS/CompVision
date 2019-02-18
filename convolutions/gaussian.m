function [G] = gaussian(sigma)
%GAUSSIAN implements a 1d discrete gaussian filter
%   Detailed explanation goes here
    expr = @ (x) ((1/(sigma*sqrt(2*pi)))*exp(-x.^2/(2*sigma^2)));
    bound = ceil(3*sigma);
    xs = [-bound:bound];
    G = expr(xs);
    G = G/sum(G);
end

