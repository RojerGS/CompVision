function [Gd] = gaussianDer(sigma)
%gaussianDer returns the 1D kernel with the derivative of the gaussian
    bound = ceil(3*sigma);
    xs = [-bound:bound];
    expr = @(x)((-x/(sigma^3*sqrt(2*pi))).*exp(-x.^2/(2*sigma^2)));
    Gd = expr(xs);
end

