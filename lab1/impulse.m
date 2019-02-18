% create an impulse image
N = 100;
img = zeros(2*N+1, 2*N+1);
img(N+1, N+1) = 1;
figure();
imshow(img);
title('impulse image');

ds = {'x', 'y', 'xx', 'yy', 'xy', 'yx'};
sigma = 10;

for i = 1:length(ds)
    d = ds{i};
    out = imageDerivatives(img, sigma, d);
    figure();
    imshow(out, [min(out(:)), max(out(:))]);
    title(d);
end