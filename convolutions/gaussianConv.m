function [imOut] = gaussianConv(imgPath, sigma_x, sigma_y)
%gaussianConv convolves the given image with a gaussian filter
    Gx = gaussian(sigma_x);
    Gy = gaussian(sigma_y);
    img = imread(imgPath);
    %size(img)
    imOut = conv2(Gy, Gx, img);
end

