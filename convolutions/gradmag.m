function [magnitude, orientation] = gradmag(img, sigma)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    kernel = gaussianDer(sigma);
    l = length(kernel);
    ker2D = zeros(l, l);
    ker2D(ceil(l/2), :) = kernel;
    dx = conv2(img, ker2D, 'same');
    dy = conv2(img, ker2D', 'same');
    magnitude = sqrt(dx.^2 + dy.^2);
    orientation = atan2(dy, dx);
end

